`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Andrew Weiler
// 
// Create Date: 02/11/2016 12:35:18 PM
// Module Name: barrel_mem_interface
// Project Name: ARMQP
// Target Devices: Zync-7020
// Tool Versions: Vivado 2015.2
// Description: Memory interface for barrel projection. Random Access Output, 
//   sequential Input. Data is output in the order given on the Math coordinates.
//   Math coordinates are only sampled when AXIS_Out_Ready and Math Valid are 
//   high. Output is preserved when AXIS_Out_Ready is low.
// 
// Dependencies: Appropriately configured BRAM generator
// 
//////////////////////////////////////////////////////////////////////////////////


module barrel_mem_interface(
    input clk,
    input [15:0] AXIS_In_tData,
    input AXIS_In_tValid,
    output AXIS_In_tReady,
	 input AXIS_In_tUser,//SOF, Resets Head counters
    input [11:0] Math_Y,//TODO figure out why $clog2() doesn't work with block designs
    input [11:0] Math_X,
    input Math_Vaild,//Also functions as pipeline enable/freeze
    output Math_Ready,//Indicates if buffer is sufficiently full to guarantee request fulfilment
    output [15:0] AXIS_Out_tData,
    output AXIS_Out_tValid,
    input AXIS_Out_tReady,//Also functions as pipeline enable/freeze
    output AXIS_Out_tUser,//SOF
    output AXIS_Out_tLast,//EOL
    input reset
    );
    //User Adjustable Parameters
    parameter buf_capacity = 67584;
    parameter width = 1080;
    parameter height = 960;
    parameter min_rows_in_buffer = 60;
    
    //Synthesis-Time Math
    //TODO: Remind Xilinx that localparams are valid targets for synthesis time math
    parameter min_items_in_buffer = min_rows_in_buffer*width;
    parameter max_rows_in_buffer = $floor(buf_capacity/width);
    
    //Registers and Nets
    reg [$clog2(buf_capacity):0] addrrd;
    reg [$clog2(buf_capacity):0] HeadPtr;
    reg [$clog2(width+1):0] HeadX;
    reg [$clog2(height+1):0] HeadY;
	 reg [$clog2(width+1):0] OutputX;//Used for EOL
    reg [$clog2(height+1):0] OutputY;//Used for SOF
    reg [$clog2(buf_capacity):0] items_in_buffer;
    reg [15:0] mem_out_buf;
    reg output_mux;
    wire [15:0] mem_out;
    
    //Output Mux and Buffering
    assign Math_Ready = items_in_buffer>=min_items_in_buffer;
    assign AXIS_Out_Valid=Math_Vaild;
	 
    //The following always statment will ensure that the valid data is always
    //on the output. The last data retrieved from memory is latched while the
    //AXIS pipeline is halted.
    always @(posedge clk)
        begin
            output_mux<=AXIS_Out_Ready&&Math_Vaild;
            mem_out_buf<= AXIS_Out_Ready&&Math_Vaild ? mem_out : mem_out_buf;
        end    
    assign AXIS_Out_Data = output_mux ? mem_out : mem_out_buf;
    
    //Address Cacluation
    wire [$clog2(buf_capacity):0] lookbackdistance=HeadX+(Math_Y-HeadY)*width+(width-Math_X);
    always @(posedge clk)
    begin
        if(lookbackdistance>HeadPtr)//Wrapping case
            addrrd<=buf_capacity-(lookbackdistance-HeadPtr);
        else//Not Wrapping
            addrrd<=HeadPtr-lookbackdistance;
    end
    
    //Growing Control - AXIS_In_Ready and growing
    assign AXIS_In_Ready = items_in_buffer<buf_capacity;//I want to grow
    wire growing = AXIS_In_Valid&&AXIS_In_Ready;//I will grow on posedge
    
    //Shrinking Control - too_big and shrinking
    wire too_big = items_in_buffer>min_items_in_buffer;//I want to shrink
    wire shrinking = too_big&&AXIS_Out_Ready&&Math_Vaild;//I will shrink on posedge
    
    //Write Logic - Address Counter and Head Pointer
    always @(posedge clk)
        begin
            if(reset)
                HeadPtr<=0;
            else
            if(growing)//Will write this cycle
                if(HeadPtr==buf_capacity)//reset counter
                    HeadPtr<=0;
                else
                    HeadPtr=HeadPtr+1'b1;
            else//Won't write this cycle
                HeadPtr<=HeadPtr;
        end
        
    //items_in_buffer logic
    always @(posedge clk)
        begin
            if(reset)
                items_in_buffer=0;
            else
            case({growing, shrinking})
                2'b00: items_in_buffer<=items_in_buffer;//No changes
                2'b01: items_in_buffer<=items_in_buffer-1'b1;//Shrink only
                2'b10: items_in_buffer<=items_in_buffer+1'b1;//Growth only
                2'b11: items_in_buffer<=items_in_buffer;//Offsetting changes
            endcase
        end
    
    //Head Position Logic -  HeadX   
    always @(posedge clk)
        begin
            if(reset||AXIS_In_tUser)
                HeadX<=0;
            else
            if(growing)
                if(HeadX==width)
                    HeadX<=0;
                else
                    HeadX<=HeadX+1'b1;
            else
                HeadX<=HeadX;
        end   
    
    //Head Position Logic -  HeadY    
    always @(posedge clk)
        begin
            if(reset||AXIS_In_tUser)
                HeadY<=0;
            else
            if(growing&&HeadX==width)
                if(HeadY==height)
                    HeadY<=0;
                else
                    HeadY<=HeadY+1'b1;
            else
                HeadY<=HeadY;
        end 
    
	  //Output Position Logic -  OutputX   
    always @(posedge clk)
        begin
            if(reset)
                OutputX<=0;
            else
            if(shrinking)
                if(OutputX==width)
                    OutputX<=0;
                else
                    OutputX<=OutputX+1'b1;
            else
                OutputX<=OutputX;
        end   
    
    //Head Position Logic -  OutputY    
    always @(posedge clk)
        begin
            if(reset)
                OutputY<=0;
            else
            if(shrinking&&OutputX==width)
                if(OutputY==height)
                    OutputY<=0;
                else
                    OutputY<=OutputY+1'b1;
            else
                OutputY<=OutputY;
        end 
    
    //Output Position based flags
    assign AXIS_Out_tUser = (OutputY==0)&&(OutputX==0)//SOF
    assign AXIS_Out_tLast = OutputX==width;//EOL
    
    blk_mem_gen_0 blk_mem_gen(
        .clka(clk),
        .ena(1'b1),
        .wea(AXIS_In_Valid&&AXIS_In_Ready),
        .addra(HeadPtr),
        .dina(AXIS_In_Data),
        .clkb(clk),
        .addrb(addrrd),
        .doutb(mem_out)
      );
endmodule
