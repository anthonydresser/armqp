//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Feb 28 03:05:59 2016
//Host        : Andrew-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target barrel_projection_wrapper.bd
//Design      : barrel_projection_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module barrel_projection_wrapper
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

  wire [15:0]AXIS_In_tdata;
  wire AXIS_In_tready;
  wire AXIS_In_tuser;
  wire AXIS_In_tvalid;
  wire [15:0]AXIS_Out_tdata;
  wire AXIS_Out_tlast;
  wire AXIS_Out_tready;
  wire AXIS_Out_tuser;
  wire AXIS_Out_tvalid;
  wire addr_vld;
  wire clk;
  wire reset;
  wire [11:0]xOut;
  wire [11:0]yOut;

  barrel_projection barrel_projection_i
       (.AXIS_In_tdata(AXIS_In_tdata),
        .AXIS_In_tready(AXIS_In_tready),
        .AXIS_In_tuser(AXIS_In_tuser),
        .AXIS_In_tvalid(AXIS_In_tvalid),
        .AXIS_Out_tdata(AXIS_Out_tdata),
        .AXIS_Out_tlast(AXIS_Out_tlast),
        .AXIS_Out_tready(AXIS_Out_tready),
        .AXIS_Out_tuser(AXIS_Out_tuser),
        .AXIS_Out_tvalid(AXIS_Out_tvalid),
        .addr_vld(addr_vld),
        .clk(clk),
        .reset(reset),
        .xOut(xOut),
        .yOut(yOut));
endmodule
