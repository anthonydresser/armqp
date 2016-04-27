`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Andrew Weiler, Lukas Hunker, Anthony Dresser
// 
// Create Date: 03/03/2016 01:00:25 PM
// Design Name: AR MQP
// Module Name: math_tester
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//		Test bench to perform behavioral simulation on the barrel projection math module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module math_tester();
    
    parameter height=1080;
    parameter width=960;
    reg clk;
    reg reset;
    
    //for debugging only
    real fixbuff;
    integer f_polarCoordsFixedRadius;
    integer x,y,status;
    reg [15:0] t_polarRadius [0:height-1][0:width-1];
    reg [16*16-1:0] TranslateDataDelay;//16 pipestages, each 16 bits wide
    reg [15:0] TranslateValidDelay;
    reg signed [12:0] thisX, thisY;
    reg [15:0] thisLoad;
    
    //Math Unique I/O
    wire [11:0] xOut, yOut;
    reg mem_ready;
    wire addr_vld;
    
    //Rotate I/O
    wire rot_s_axis_phase_tvalid;
    wire [15:0] rot_s_axis_phase_tdata;
    reg rot_s_axis_phase_tready;
    wire rot_s_axis_cartesian_tvalid;
    wire [31:0] rot_s_axis_cartesian_tdata;
    reg rot_s_axis_cartesian_tready;
    reg rot_m_axis_dout_tvalid;
    wire rot_m_axis_dout_tready;
    wire [31:0] rot_m_axis_dout_tdata;
    
    //Transaltion I/O
    wire tran_s_axis_cartesian_tvalid;
    reg tran_s_axis_cartesian_tready;
    wire [31:0] tran_s_axis_cartesian_tdata;
    reg tran_m_axis_dout_tvalid;
    wire tran_m_axis_dout_tready;
    reg [31:0] tran_m_axis_dout_tdata;
    
    barrelMath math_inst(
        //Translate Hookup
        .tIn_tdata(tran_s_axis_cartesian_tdata),
        .tIn_tvalid(tran_s_axis_cartesian_tvalid),
        .tIn_tready(tran_s_axis_cartesian_tready),
        .tOut_tdata(tran_m_axis_dout_tdata),
        .tOut_tvalid(tran_m_axis_dout_tvalid),
        .tOut_tready(tran_m_axis_dout_tready),
        //Rotate Hookup
        .rCin_tdata(rot_s_axis_cartesian_tdata),
        .rCin_tvalid(rot_s_axis_cartesian_tvalid),
        .rCin_tready(rot_s_axis_cartesian_tready),
        .rPin_tdata(rot_s_axis_phase_tdata),
        .rPin_tvalid(rot_s_axis_phase_tvalid),
        .rPin_tready(rot_s_axis_phase_tready),
        .rOut_tdata(rot_m_axis_dout_tdata),
        .rOut_tvalid(rot_m_axis_dout_tvalid),
        .rOut_tready(rot_m_axis_dout_tready),
        //Other Hookups
        .xOut(xOut),
        .yOut(yOut),
        .mem_ready(mem_ready),
        .clk(clk),
        .reset(reset),
        .addr_vld(addr_vld)
    );
    
//    rotate rot_inst(
//        .aclk(clk),
//        .s_axis_phase_tvalid(rot_s_axis_phase_tvalid),
//        .s_axis_phase_tready(rot_s_axis_phase_tready),
//        .s_axis_phase_tdata(rot_s_axis_phase_tdata),
//        .s_axis_cartesian_tvalid(rot_s_axis_cartesian_tvalid),
//        .s_axis_cartesian_tready(rot_s_axis_cartesian_tready),
//        .s_axis_cartesian_tdata(rot_s_axis_cartesian_tdata),
//        .m_axis_dout_tvalid(rot_m_axis_dout_tvalid),
//        .m_axis_dout_tready(rot_m_axis_dout_tready),
//        .m_axis_dout_tdata(rot_m_axis_dout_tdata)
//    );
      
//    translate tran_inst(
//        .aclk(clk),
//        .s_axis_cartesian_tvalid(tran_s_axis_cartesian_tvalid),
//        .s_axis_cartesian_tready(tran_s_axis_cartesian_tready),
//        .s_axis_cartesian_tdata(tran_s_axis_cartesian_tdata),
//        .m_axis_dout_tvalid(tran_m_axis_dout_tvalid),
//        .m_axis_dout_tready(tran_m_axis_dout_tready),
//        .m_axis_dout_tdata(tran_m_axis_dout_tdata)
//    );
    
    //clk generation: 148.5MHz (6.7ns)
    always begin
      #6.7 clk = ~clk;
    end
    
    //Load up radius table
    initial begin      
        f_polarCoordsFixedRadius = $fopen("../../../polarCoordsFixedRadius.csv", "r");

        
        if(f_polarCoordsFixedRadius==0) begin
            $display("Invalid File Descriptor/Could not find polarCoordsFixedRadius.csv");
            $display("Please paste polarCoordsFixedRadius.csv into sim_1/behav sometime after launching the simulation but before it begins"); 
            $stop;
        end
        
        for (y = 0; y < height; y = y +1)
            for (x = 0; x < width; x = x +1)begin
                status=$fscanf(f_polarCoordsFixedRadius, "%b\n", t_polarRadius[y][x]);
            end
        $fclose(f_polarCoordsFixedRadius);
    end
    
    //Do initial stimulus
    initial begin
        clk=0;
        reset=1;
        mem_ready=0;
        TranslateValidDelay=0;
        TranslateDataDelay=0;
        tran_s_axis_cartesian_tready=1'b1;
        rot_s_axis_phase_tready=1'b1;
        rot_s_axis_cartesian_tready=1'b1;
        rot_m_axis_dout_tvalid=1'b1;
        thisY=0;
        thisX=0;
        thisLoad=0;
        repeat (10) @(posedge clk);//Wait for some Posedges
        reset=0;
        repeat (25) @(posedge clk);
        mem_ready=1;
    end
    
    //Monitoring tools
    always @(posedge clk) begin
        if(math_inst.tOut_tvalid && math_inst.rCin_tready) begin
            $display("------------------------");
            $display("Head of Pipe is at x=%0d, y=%0d", math_inst.xIn, math_inst.yIn);
            
            fixbuff = (math_inst.rsq2[30:0] / (2**14)); //Signed Fixed point Q4 to real number
            if(math_inst.rsq2[31]==1) fixbuff = -fixbuff;
            $display("rsq2=%f", fixbuff);
            
            fixbuff = (math_inst.rad1[30:0] / (2**4)); //Signed Fixed point Q4 to real number
            if(math_inst.rad1[31]==1) fixbuff = -fixbuff;
            $display("rad1=%f", fixbuff);
            
            fixbuff = (math_inst.phase[14:0] / (2**3));//Signed Fixed point Q3 to real number
            if(math_inst.phase[15]==1) fixbuff = -fixbuff;
            $display("phase=%f", fixbuff);
            
            fixbuff = math_inst.radius / (2**3);//Unsigned Fixed point Q3 to real number
            $display("radius=%f", fixbuff);
            
            //Add more printouts here...
        end
    end
    

    
    //CORDIC Model for Translate (Cartesian to Polar)
    always @(posedge clk) begin
        if(tran_s_axis_cartesian_tvalid)begin//Not Blocked
            //Lookup math
            thisY=$signed(tran_s_axis_cartesian_tdata[31:20])+12'sd479;
            thisX=$signed(tran_s_axis_cartesian_tdata[15:4])+12'sd540;
            thisLoad = t_polarRadius[$unsigned(thisX)][$unsigned(thisY)];
            //Shift and load
            TranslateValidDelay={TranslateValidDelay[14:0], 1'b1};
            TranslateDataDelay={TranslateDataDelay[239:0], thisLoad};
            //assign outputs
            tran_m_axis_dout_tvalid=TranslateValidDelay[15];
            tran_m_axis_dout_tdata=TranslateDataDelay[255:240];
        end
    end

endmodule
