// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Mar 03 13:08:39 2016
// Host        : Andrew-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivadoprojects/armqp/armqp_math_tester/armqp_math_tester.srcs/sources_1/ip/rotate/rotate_stub.v
// Design      : rotate
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0,Vivado 2015.2" *)
module rotate(aclk, s_axis_phase_tvalid, s_axis_phase_tready, s_axis_phase_tdata, s_axis_cartesian_tvalid, s_axis_cartesian_tready, s_axis_cartesian_tdata, m_axis_dout_tvalid, m_axis_dout_tready, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_phase_tvalid,s_axis_phase_tready,s_axis_phase_tdata[15:0],s_axis_cartesian_tvalid,s_axis_cartesian_tready,s_axis_cartesian_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tready,m_axis_dout_tdata[31:0]" */;
  input aclk;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [15:0]s_axis_phase_tdata;
  input s_axis_cartesian_tvalid;
  output s_axis_cartesian_tready;
  input [31:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  input m_axis_dout_tready;
  output [31:0]m_axis_dout_tdata;
endmodule
