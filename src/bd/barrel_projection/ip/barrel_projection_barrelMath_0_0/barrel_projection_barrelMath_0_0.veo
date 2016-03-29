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

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
barrel_projection_barrelMath_0_0 your_instance_name (
  .tIn(tIn),                // output wire [31 : 0] tIn
  .tIn_vld(tIn_vld),        // output wire tIn_vld
  .tIn_ready(tIn_ready),    // input wire tIn_ready
  .tOut(tOut),              // input wire [31 : 0] tOut
  .tOut_vld(tOut_vld),      // input wire tOut_vld
  .tOut_ready(tOut_ready),  // output wire tOut_ready
  .rCIn(rCIn),              // output wire [31 : 0] rCIn
  .rCIn_vld(rCIn_vld),      // output wire rCIn_vld
  .rPIn(rPIn),              // output wire [15 : 0] rPIn
  .rPIn_vld(rPIn_vld),      // output wire rPIn_vld
  .rCIn_ready(rCIn_ready),  // input wire rCIn_ready
  .rPIn_ready(rPIn_ready),  // input wire rPIn_ready
  .rOut(rOut),              // input wire [31 : 0] rOut
  .rOut_vld(rOut_vld),      // input wire rOut_vld
  .rOut_ready(rOut_ready),  // output wire rOut_ready
  .xOut(xOut),              // output wire [11 : 0] xOut
  .yOut(yOut),              // output wire [11 : 0] yOut
  .mem_ready(mem_ready),    // input wire mem_ready
  .clk(clk),                // input wire clk
  .reset(reset),            // input wire reset
  .addr_vld(addr_vld)      // output wire addr_vld
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

