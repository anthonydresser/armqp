// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: wpi.edu:user:barrel_mem_interface:1.5
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module barrel_proj_barrel_mem_interface_0_1 (
  clk,
  AXIS_In_tData,
  AXIS_In_tValid,
  AXIS_In_tReady,
  AXIS_In_tUser,
  Math_Y,
  Math_X,
  Math_Vaild,
  Math_Ready,
  AXIS_Out_tData,
  AXIS_Out_tValid,
  AXIS_Out_tReady,
  AXIS_Out_tUser,
  AXIS_Out_tLast,
  reset
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_In TDATA" *)
input wire [15 : 0] AXIS_In_tData;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_In TVALID" *)
input wire AXIS_In_tValid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_In TREADY" *)
output wire AXIS_In_tReady;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_In TUSER" *)
input wire AXIS_In_tUser;
input wire [11 : 0] Math_Y;
input wire [11 : 0] Math_X;
input wire Math_Vaild;
output wire Math_Ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_Out TDATA" *)
output wire [15 : 0] AXIS_Out_tData;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_Out TVALID" *)
output wire AXIS_Out_tValid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_Out TREADY" *)
input wire AXIS_Out_tReady;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_Out TUSER" *)
output wire AXIS_Out_tUser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_Out TLAST" *)
output wire AXIS_Out_tLast;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;

  barrel_mem_interface #(
    .buf_capacity(67584),
    .width(1080),
    .height(960),
    .min_rows_in_buffer(60),
    .min_items_in_buffer(64800),
    .max_rows_in_buffer(62)
  ) inst (
    .clk(clk),
    .AXIS_In_tData(AXIS_In_tData),
    .AXIS_In_tValid(AXIS_In_tValid),
    .AXIS_In_tReady(AXIS_In_tReady),
    .AXIS_In_tUser(AXIS_In_tUser),
    .Math_Y(Math_Y),
    .Math_X(Math_X),
    .Math_Vaild(Math_Vaild),
    .Math_Ready(Math_Ready),
    .AXIS_Out_tData(AXIS_Out_tData),
    .AXIS_Out_tValid(AXIS_Out_tValid),
    .AXIS_Out_tReady(AXIS_Out_tReady),
    .AXIS_Out_tUser(AXIS_Out_tUser),
    .AXIS_Out_tLast(AXIS_Out_tLast),
    .reset(reset)
  );
endmodule
