// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Nov 03 23:28:15 2015
// Host        : Andrew-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub d:/vivadoprojects/armqp/ip_repo/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_in1, clk_24M, clk_12M, clk_100M, clk_50M, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_24M,clk_12M,clk_100M,clk_50M,reset,locked" */;
  input clk_in1;
  output clk_24M;
  output clk_12M;
  output clk_100M;
  output clk_50M;
  input reset;
  output locked;
endmodule
