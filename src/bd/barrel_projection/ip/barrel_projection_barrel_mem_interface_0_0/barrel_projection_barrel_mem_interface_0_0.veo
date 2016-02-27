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

// IP VLNV: wpi.edu:user:barrel_mem_interface:1.4
// IP Revision: 1

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
barrel_projection_barrel_mem_interface_0_0 your_instance_name (
  .clk(clk),                          // input wire clk
  .AXIS_In_tData(AXIS_In_tData),      // input wire [15 : 0] AXIS_In_tData
  .AXIS_In_tValid(AXIS_In_tValid),    // input wire AXIS_In_tValid
  .AXIS_In_tReady(AXIS_In_tReady),    // output wire AXIS_In_tReady
  .AXIS_In_tUser(AXIS_In_tUser),      // input wire AXIS_In_tUser
  .Math_Y(Math_Y),                    // input wire [11 : 0] Math_Y
  .Math_X(Math_X),                    // input wire [11 : 0] Math_X
  .Math_Vaild(Math_Vaild),            // input wire Math_Vaild
  .Math_Ready(Math_Ready),            // output wire Math_Ready
  .AXIS_Out_tData(AXIS_Out_tData),    // output wire [15 : 0] AXIS_Out_tData
  .AXIS_Out_tValid(AXIS_Out_tValid),  // output wire AXIS_Out_tValid
  .AXIS_Out_tReady(AXIS_Out_tReady),  // input wire AXIS_Out_tReady
  .AXIS_Out_tUser(AXIS_Out_tUser),    // output wire AXIS_Out_tUser
  .AXIS_Out_tLast(AXIS_Out_tLast),    // output wire AXIS_Out_tLast
  .reset(reset)                      // input wire reset
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

