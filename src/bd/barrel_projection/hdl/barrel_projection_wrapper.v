//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Feb 21 20:58:40 2016
//Host        : Andrew-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target barrel_projection_wrapper.bd
//Design      : barrel_projection_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module barrel_projection_wrapper
   (AXIS_IN_tdata,
    AXIS_IN_tready,
    AXIS_IN_tvalid,
    AXIS_Out_tdata,
    AXIS_Out_tready,
    AXIS_Out_tvalid,
    clk,
    reset);
  input [15:0]AXIS_IN_tdata;
  output AXIS_IN_tready;
  input AXIS_IN_tvalid;
  output [15:0]AXIS_Out_tdata;
  input AXIS_Out_tready;
  output AXIS_Out_tvalid;
  input clk;
  input reset;

  wire [15:0]AXIS_IN_tdata;
  wire AXIS_IN_tready;
  wire AXIS_IN_tvalid;
  wire [15:0]AXIS_Out_tdata;
  wire AXIS_Out_tready;
  wire AXIS_Out_tvalid;
  wire clk;
  wire reset;

  barrel_projection barrel_projection_i
       (.AXIS_IN_tdata(AXIS_IN_tdata),
        .AXIS_IN_tready(AXIS_IN_tready),
        .AXIS_IN_tvalid(AXIS_IN_tvalid),
        .AXIS_Out_tdata(AXIS_Out_tdata),
        .AXIS_Out_tready(AXIS_Out_tready),
        .AXIS_Out_tvalid(AXIS_Out_tvalid),
        .clk(clk),
        .reset(reset));
endmodule
