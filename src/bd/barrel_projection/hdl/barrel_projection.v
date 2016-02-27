//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Feb 26 17:43:46 2016
//Host        : Andrew-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target barrel_projection.bd
//Design      : barrel_projection
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "barrel_projection,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=barrel_projection,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "barrel_projection.hwdef" *) 
module barrel_projection
   (AXIS_In_tdata,
    AXIS_In_tready,
    AXIS_In_tuser,
    AXIS_In_tvalid,
    AXIS_Out_tdata,
    AXIS_Out_tlast,
    AXIS_Out_tready,
    AXIS_Out_tuser,
    AXIS_Out_tvalid,
    addr_vld,
    clk,
    reset,
    xOut,
    yOut);
  input [15:0]AXIS_In_tdata;
  output AXIS_In_tready;
  input AXIS_In_tuser;
  input AXIS_In_tvalid;
  output [15:0]AXIS_Out_tdata;
  output AXIS_Out_tlast;
  input AXIS_Out_tready;
  output AXIS_Out_tuser;
  output AXIS_Out_tvalid;
  output addr_vld;
  input clk;
  input reset;
  output [11:0]xOut;
  output [11:0]yOut;

  wire [15:0]AXIS_In_1_TDATA;
  wire AXIS_In_1_TREADY;
  wire AXIS_In_1_TUSER;
  wire AXIS_In_1_TVALID;
  wire GND_1;
  wire barrelMath_0_addr_vld;
  wire [31:0]barrelMath_0_rCin_TDATA;
  wire barrelMath_0_rCin_TREADY;
  wire barrelMath_0_rCin_TVALID;
  wire [15:0]barrelMath_0_rPin_TDATA;
  wire barrelMath_0_rPin_TREADY;
  wire barrelMath_0_rPin_TVALID;
  wire [31:0]barrelMath_0_tIn_TDATA;
  wire barrelMath_0_tIn_TREADY;
  wire barrelMath_0_tIn_TVALID;
  wire [11:0]barrelMath_0_xOut;
  wire [11:0]barrelMath_0_yOut;
  wire [15:0]barrel_mem_interface_0_AXIS_Out_TDATA;
  wire barrel_mem_interface_0_AXIS_Out_TLAST;
  wire barrel_mem_interface_0_AXIS_Out_TREADY;
  wire barrel_mem_interface_0_AXIS_Out_TUSER;
  wire barrel_mem_interface_0_AXIS_Out_TVALID;
  wire barrel_mem_interface_0_Math_Ready;
  wire clk_1;
  wire [31:0]cordic_0_M_AXIS_DOUT_TDATA;
  wire cordic_0_M_AXIS_DOUT_TREADY;
  wire cordic_0_M_AXIS_DOUT_TVALID;
  wire [31:0]cordic_1_M_AXIS_DOUT_TDATA;
  wire cordic_1_M_AXIS_DOUT_TREADY;
  wire cordic_1_M_AXIS_DOUT_TVALID;
  wire reset_1;

  assign AXIS_In_1_TDATA = AXIS_In_tdata[15:0];
  assign AXIS_In_1_TUSER = AXIS_In_tuser;
  assign AXIS_In_1_TVALID = AXIS_In_tvalid;
  assign AXIS_In_tready = AXIS_In_1_TREADY;
  assign AXIS_Out_tdata[15:0] = barrel_mem_interface_0_AXIS_Out_TDATA;
  assign AXIS_Out_tlast = barrel_mem_interface_0_AXIS_Out_TLAST;
  assign AXIS_Out_tuser = barrel_mem_interface_0_AXIS_Out_TUSER;
  assign AXIS_Out_tvalid = barrel_mem_interface_0_AXIS_Out_TVALID;
  assign addr_vld = barrelMath_0_addr_vld;
  assign barrel_mem_interface_0_AXIS_Out_TREADY = AXIS_Out_tready;
  assign clk_1 = clk;
  assign reset_1 = reset;
  assign xOut[11:0] = barrelMath_0_xOut;
  assign yOut[11:0] = barrelMath_0_yOut;
  GND GND
       (.G(GND_1));
  barrel_projection_barrelMath_0_0 barrelMath_0
       (.addr_vld(barrelMath_0_addr_vld),
        .clk(clk_1),
        .mem_ready(barrel_mem_interface_0_Math_Ready),
        .rCIn(barrelMath_0_rCin_TDATA),
        .rCIn_ready(barrelMath_0_rCin_TREADY),
        .rCIn_vld(barrelMath_0_rCin_TVALID),
        .rOut(cordic_1_M_AXIS_DOUT_TDATA),
        .rOut_ready(cordic_1_M_AXIS_DOUT_TREADY),
        .rOut_vld(cordic_1_M_AXIS_DOUT_TVALID),
        .rPIn(barrelMath_0_rPin_TDATA),
        .rPIn_ready(barrelMath_0_rPin_TREADY),
        .rPIn_vld(barrelMath_0_rPin_TVALID),
        .reset(reset_1),
        .tIn(barrelMath_0_tIn_TDATA),
        .tIn_ready(barrelMath_0_tIn_TREADY),
        .tIn_vld(barrelMath_0_tIn_TVALID),
        .tOut(cordic_0_M_AXIS_DOUT_TDATA),
        .tOut_ready(cordic_0_M_AXIS_DOUT_TREADY),
        .tOut_vld(cordic_0_M_AXIS_DOUT_TVALID),
        .xOut(barrelMath_0_xOut),
        .yOut(barrelMath_0_yOut));
  barrel_projection_barrel_mem_interface_0_0 barrel_mem_interface_0
       (.AXIS_In_tData(AXIS_In_1_TDATA),
        .AXIS_In_tReady(AXIS_In_1_TREADY),
        .AXIS_In_tUser(AXIS_In_1_TUSER),
        .AXIS_In_tValid(AXIS_In_1_TVALID),
        .AXIS_Out_tData(barrel_mem_interface_0_AXIS_Out_TDATA),
        .AXIS_Out_tLast(barrel_mem_interface_0_AXIS_Out_TLAST),
        .AXIS_Out_tReady(barrel_mem_interface_0_AXIS_Out_TREADY),
        .AXIS_Out_tUser(barrel_mem_interface_0_AXIS_Out_TUSER),
        .AXIS_Out_tValid(barrel_mem_interface_0_AXIS_Out_TVALID),
        .Math_Ready(barrel_mem_interface_0_Math_Ready),
        .Math_Vaild(barrelMath_0_addr_vld),
        .Math_X(barrelMath_0_yOut),
        .Math_Y(barrelMath_0_xOut),
        .clk(clk_1),
        .reset(reset_1));
  barrel_projection_cordic_0_0 cordic_0
       (.aclk(clk_1),
        .m_axis_dout_tdata(cordic_0_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tready(cordic_0_M_AXIS_DOUT_TREADY),
        .m_axis_dout_tvalid(cordic_0_M_AXIS_DOUT_TVALID),
        .s_axis_cartesian_tdata(barrelMath_0_tIn_TDATA),
        .s_axis_cartesian_tready(barrelMath_0_tIn_TREADY),
        .s_axis_cartesian_tuser({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .s_axis_cartesian_tvalid(barrelMath_0_tIn_TVALID));
  barrel_projection_cordic_1_0 cordic_1
       (.aclk(clk_1),
        .m_axis_dout_tdata(cordic_1_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tready(cordic_1_M_AXIS_DOUT_TREADY),
        .m_axis_dout_tvalid(cordic_1_M_AXIS_DOUT_TVALID),
        .s_axis_cartesian_tdata(barrelMath_0_rCin_TDATA),
        .s_axis_cartesian_tready(barrelMath_0_rCin_TREADY),
        .s_axis_cartesian_tvalid(barrelMath_0_rCin_TVALID),
        .s_axis_phase_tdata(barrelMath_0_rPin_TDATA),
        .s_axis_phase_tready(barrelMath_0_rPin_TREADY),
        .s_axis_phase_tuser({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .s_axis_phase_tvalid(barrelMath_0_rPin_TVALID));
endmodule
