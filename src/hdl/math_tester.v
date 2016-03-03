`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andrew Weiler
// 
// Create Date: 03/03/2016 01:00:25 PM
// Design Name: 
// Module Name: math_tester
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module math_tester();
    
    reg clk;
    reg reset;
    
    //for debugging only
    real fixbuff;
    
    //Math Unique I/O
    wire [11:0] xOut, yOut;
    reg mem_ready;
    wire addr_vld;
    
    //Rotate I/O
    wire rot_s_axis_phase_tvalid;
    wire [15:0] rot_s_axis_phase_tdata;
    wire rot_s_axis_phase_tready;
    wire rot_s_axis_cartesian_tvalid;
    wire [31:0] rot_s_axis_cartesian_tdata;
    wire rot_s_axis_cartesian_tready;
    wire rot_m_axis_dout_tvalid;
    wire rot_m_axis_dout_tready;
    wire [31:0] rot_m_axis_dout_tdata;
    
    //Transaltion I/O
    wire tran_s_axis_cartesian_tvalid;
    wire tran_s_axis_cartesian_tready;
    wire [31:0] tran_s_axis_cartesian_tdata;
    wire tran_m_axis_dout_tvalid;
    wire tran_m_axis_dout_tready;
    wire [31:0] tran_m_axis_dout_tdata;
    
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
    
    rotate rot_inst(
        .aclk(clk),
        .s_axis_phase_tvalid(rot_s_axis_phase_tvalid),
        .s_axis_phase_tready(rot_s_axis_phase_tready),
        .s_axis_phase_tdata(rot_s_axis_phase_tdata),
        .s_axis_cartesian_tvalid(rot_s_axis_cartesian_tvalid),
        .s_axis_cartesian_tready(rot_s_axis_cartesian_tready),
        .s_axis_cartesian_tdata(rot_s_axis_cartesian_tdata),
        .m_axis_dout_tvalid(rot_m_axis_dout_tvalid),
        .m_axis_dout_tready(rot_m_axis_dout_tready),
        .m_axis_dout_tdata(rot_m_axis_dout_tdata)
    );
      
    translate tran_inst(
        .aclk(clk),
        .s_axis_cartesian_tvalid(tran_s_axis_cartesian_tvalid),
        .s_axis_cartesian_tready(tran_s_axis_cartesian_tready),
        .s_axis_cartesian_tdata(tran_s_axis_cartesian_tdata),
        .m_axis_dout_tvalid(tran_m_axis_dout_tvalid),
        .m_axis_dout_tready(tran_m_axis_dout_tready),
        .m_axis_dout_tdata(tran_m_axis_dout_tdata)
    );
    
    //clk generation: 148.5MHz (6.7ns)
    always begin
      #6.7 clk = ~clk;
    end
    
    initial begin
        clk=0;
        reset=1;
        mem_ready=0;
        repeat (10) @(posedge clk);//Wait for some Posedges
        reset=0;
        repeat (25) @(posedge clk);
        mem_ready=1;
    end
    
    always @(posedge clk) begin
        if(math_inst.tOut_tvalid && math_inst.rCin_tready) begin
            $display("------------------------");
            $display("Head of Pipe is at x=%0d, y=%0d", math_inst.xIn, math_inst.yIn);
            
            fixbuff = (math_inst.rsq2[14:0] / (2**4)); //Signed Fixed point Q4 to real number
            if(math_inst.rsq2[15]==1) fixbuff = -fixbuff;
            $display("rsq2=%f", fixbuff);
            
            fixbuff = (math_inst.phase[14:0] / (2**3));//Signed Fixed point Q3 to real number
            if(math_inst.phase[15]==1) fixbuff = -fixbuff;
            $display("phase=%f", fixbuff);
            
            fixbuff = math_inst.radius / (2**3);//Unsigned Fixed point Q3 to real number
            $display("radius=%f", fixbuff);
            
            //Add more printouts here...
        end
    end
    
endmodule
