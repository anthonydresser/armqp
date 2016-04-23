//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sat Apr 23 12:16:34 2016
//Host        : Lukas-laptop running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target barrel_proj.bd
//Design      : barrel_proj
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "barrel_proj,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=barrel_proj,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "barrel_proj.hwdef" *) 
module barrel_proj
   (AXIS_IN_tdata,
    AXIS_IN_tready,
    AXIS_IN_tuser,
    AXIS_IN_tvalid,
    AXIS_Out_tdata,
    AXIS_Out_tlast,
    AXIS_Out_tready,
    AXIS_Out_tuser,
    AXIS_Out_tvalid,
    clk,
    reset);
  input [15:0]AXIS_IN_tdata;
  output AXIS_IN_tready;
  input AXIS_IN_tuser;
  input AXIS_IN_tvalid;
  output [15:0]AXIS_Out_tdata;
  output AXIS_Out_tlast;
  input AXIS_Out_tready;
  output AXIS_Out_tuser;
  output AXIS_Out_tvalid;
  input clk;
  input reset;

  wire [15:0]AXIS_IN_1_TDATA;
  wire AXIS_IN_1_TREADY;
  wire AXIS_IN_1_TUSER;
  wire AXIS_IN_1_TVALID;
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

  assign AXIS_IN_1_TDATA = AXIS_IN_tdata[15:0];
  assign AXIS_IN_1_TUSER = AXIS_IN_tuser;
  assign AXIS_IN_1_TVALID = AXIS_IN_tvalid;
  assign AXIS_IN_tready = AXIS_IN_1_TREADY;
  assign AXIS_Out_tdata[15:0] = barrel_mem_interface_0_AXIS_Out_TDATA;
  assign AXIS_Out_tlast = barrel_mem_interface_0_AXIS_Out_TLAST;
  assign AXIS_Out_tuser = barrel_mem_interface_0_AXIS_Out_TUSER;
  assign AXIS_Out_tvalid = barrel_mem_interface_0_AXIS_Out_TVALID;
  assign barrel_mem_interface_0_AXIS_Out_TREADY = AXIS_Out_tready;
  assign clk_1 = clk;
  assign reset_1 = reset;
  barrel_proj_barrelMath_0_1 barrelMath_0
       (.addr_vld(barrelMath_0_addr_vld),
        .clk(clk_1),
        .mem_ready(barrel_mem_interface_0_Math_Ready),
        .rCin_tdata(barrelMath_0_rCin_TDATA),
        .rCin_tready(barrelMath_0_rCin_TREADY),
        .rCin_tvalid(barrelMath_0_rCin_TVALID),
        .rOut_tdata(cordic_1_M_AXIS_DOUT_TDATA),
        .rOut_tready(cordic_1_M_AXIS_DOUT_TREADY),
        .rOut_tvalid(cordic_1_M_AXIS_DOUT_TVALID),
        .rPin_tdata(barrelMath_0_rPin_TDATA),
        .rPin_tready(barrelMath_0_rPin_TREADY),
        .rPin_tvalid(barrelMath_0_rPin_TVALID),
        .reset(reset_1),
        .tIn_tdata(barrelMath_0_tIn_TDATA),
        .tIn_tready(barrelMath_0_tIn_TREADY),
        .tIn_tvalid(barrelMath_0_tIn_TVALID),
        .tOut_tdata(cordic_0_M_AXIS_DOUT_TDATA),
        .tOut_tready(cordic_0_M_AXIS_DOUT_TREADY),
        .tOut_tvalid(cordic_0_M_AXIS_DOUT_TVALID),
        .xOut(barrelMath_0_xOut),
        .yOut(barrelMath_0_yOut));
  barrel_proj_barrel_mem_interface_0_1 barrel_mem_interface_0
       (.AXIS_In_tData(AXIS_IN_1_TDATA),
        .AXIS_In_tReady(AXIS_IN_1_TREADY),
        .AXIS_In_tUser(AXIS_IN_1_TUSER),
        .AXIS_In_tValid(AXIS_IN_1_TVALID),
        .AXIS_Out_tData(barrel_mem_interface_0_AXIS_Out_TDATA),
        .AXIS_Out_tLast(barrel_mem_interface_0_AXIS_Out_TLAST),
        .AXIS_Out_tReady(barrel_mem_interface_0_AXIS_Out_TREADY),
        .AXIS_Out_tUser(barrel_mem_interface_0_AXIS_Out_TUSER),
        .AXIS_Out_tValid(barrel_mem_interface_0_AXIS_Out_TVALID),
        .Math_Ready(barrel_mem_interface_0_Math_Ready),
        .Math_Vaild(barrelMath_0_addr_vld),
        .Math_X(barrelMath_0_xOut),
        .Math_Y(barrelMath_0_yOut),
        .clk(clk_1),
        .reset(reset_1));
  barrel_proj_cordic_0_0 cordic_0
       (.aclk(clk_1),
        .m_axis_dout_tdata(cordic_0_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tready(cordic_0_M_AXIS_DOUT_TREADY),
        .m_axis_dout_tvalid(cordic_0_M_AXIS_DOUT_TVALID),
        .s_axis_cartesian_tdata(barrelMath_0_tIn_TDATA),
        .s_axis_cartesian_tready(barrelMath_0_tIn_TREADY),
        .s_axis_cartesian_tvalid(barrelMath_0_tIn_TVALID));
  barrel_proj_cordic_1_0 cordic_1
       (.aclk(clk_1),
        .m_axis_dout_tdata(cordic_1_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tready(cordic_1_M_AXIS_DOUT_TREADY),
        .m_axis_dout_tvalid(cordic_1_M_AXIS_DOUT_TVALID),
        .s_axis_cartesian_tdata(barrelMath_0_rCin_TDATA),
        .s_axis_cartesian_tready(barrelMath_0_rCin_TREADY),
        .s_axis_cartesian_tvalid(barrelMath_0_rCin_TVALID),
        .s_axis_phase_tdata(barrelMath_0_rPin_TDATA),
        .s_axis_phase_tready(barrelMath_0_rPin_TREADY),
        .s_axis_phase_tvalid(barrelMath_0_rPin_TVALID));
endmodule
