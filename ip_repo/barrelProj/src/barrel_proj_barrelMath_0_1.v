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


// IP VLNV: armqp:user:barrelMath:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module barrel_proj_barrelMath_0_1 (
  tIn_tdata,
  tIn_tvalid,
  tIn_tready,
  tOut_tdata,
  tOut_tvalid,
  tOut_tready,
  rCin_tdata,
  rCin_tvalid,
  rPin_tdata,
  rPin_tvalid,
  rCin_tready,
  rPin_tready,
  rOut_tdata,
  rOut_tvalid,
  rOut_tready,
  xOut,
  yOut,
  mem_ready,
  clk,
  reset,
  addr_vld
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 tIn TDATA" *)
output wire [31 : 0] tIn_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 tIn TVALID" *)
output wire tIn_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 tIn TREADY" *)
input wire tIn_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 tOut TDATA" *)
input wire [31 : 0] tOut_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 tOut TVALID" *)
input wire tOut_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 tOut TREADY" *)
output wire tOut_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rCin TDATA" *)
output wire [31 : 0] rCin_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rCin TVALID" *)
output wire rCin_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rPin TDATA" *)
output wire [15 : 0] rPin_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rPin TVALID" *)
output wire rPin_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rCin TREADY" *)
input wire rCin_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rPin TREADY" *)
input wire rPin_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rOut TDATA" *)
input wire [31 : 0] rOut_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rOut TVALID" *)
input wire rOut_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rOut TREADY" *)
output wire rOut_tready;
output wire [11 : 0] xOut;
output wire [11 : 0] yOut;
input wire mem_ready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;
output wire addr_vld;

  barrelMath inst (
    .tIn_tdata(tIn_tdata),
    .tIn_tvalid(tIn_tvalid),
    .tIn_tready(tIn_tready),
    .tOut_tdata(tOut_tdata),
    .tOut_tvalid(tOut_tvalid),
    .tOut_tready(tOut_tready),
    .rCin_tdata(rCin_tdata),
    .rCin_tvalid(rCin_tvalid),
    .rPin_tdata(rPin_tdata),
    .rPin_tvalid(rPin_tvalid),
    .rCin_tready(rCin_tready),
    .rPin_tready(rPin_tready),
    .rOut_tdata(rOut_tdata),
    .rOut_tvalid(rOut_tvalid),
    .rOut_tready(rOut_tready),
    .xOut(xOut),
    .yOut(yOut),
    .mem_ready(mem_ready),
    .clk(clk),
    .reset(reset),
    .addr_vld(addr_vld)
  );
endmodule
