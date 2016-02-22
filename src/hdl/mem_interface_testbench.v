`timescale 1ns / 1ps
module mem_interface_testbench;
    parameter width = 1080;
    parameter height = 960;
    
    reg clk, reset, AXIS_In_Valid, AXIS_Out_Ready;
    reg [15:0] AXIS_In_Data;
    reg [$clog2(height):0] Math_Y;
    reg [$clog2(width):0] Math_X;
    
    wire AXIS_In_Ready;
    wire [15:0] AXIS_Out_Data;
    wire AXIS_Out_Valid;
    wire Math_Ready;
    
    initial begin
        //Hold Reset for 100ns
        clk=0;
        reset=1;
        AXIS_In_Valid=0;
        AXIS_In_Data=0;
        Math_Y=0;
        Math_X=0;
        AXIS_Out_Ready=0;
        #100;
        //Start Feeding in data from 'VDMA'
        reset=0;
        AXIS_In_Valid=1;
    end
    
    //clk generation: 148.5MHz (6.7ns)
    always begin
        #6.7 clk = ~clk;
    end
    
    //simulating video input data as a counter
    always @(posedge clk)
        if(reset)
            AXIS_In_Data<=0;
        else
            if(AXIS_In_Ready)
                AXIS_In_Data<=AXIS_In_Data+1'b1;      
    
    barrel_projection_wrapper UUT(
        .AXIS_IN_tdata(AXIS_In_Data),
        .AXIS_IN_tready(AXIS_In_Ready),
        .AXIS_IN_tvalid(AXIS_In_Valid),
        .AXIS_Out_tdata(AXIS_Out_Data),
        .AXIS_Out_tready(AXIS_Out_Ready),
        .AXIS_Out_tvalid(AXIS_Out_Valid),
        .clk(clk),
        .reset(reset)
        );
    
endmodule