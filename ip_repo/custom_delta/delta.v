`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI - AR MQP
// Engineer: Andrew Weiler
// 
// Create Date: 04/04/2016 01:20:55 AM
// Module Name: delta
// Project Name: ARMQP
// Target Devices: Zync 7020
// Tool Versions: Vivado 2015.2
// Description: This modules implements an AXIS4 compliant delta filter
// 
// Dependencies: None
// 
//////////////////////////////////////////////////////////////////////////////////


module delta(
   input         clk,
   input         reset,

   input [7:0]   AXIS_InCur_tData,
   input         AXIS_InCur_tValid,
   output        AXIS_InCur_tReady,
   input         AXIS_InCur_tUser,
   input         AXIS_InCur_tLast,

   input [7:0]   AXIS_InDelay_tData,
   input         AXIS_InDelay_tValid,
   output        AXIS_InDelay_tReady,
   input         AXIS_InDelay_tUser,
   input         AXIS_InDelay_tLast,

   output [7:0]  AXIS_Out_tData,
   output reg    AXIS_Out_tValid,
   input         AXIS_Out_tReady,
   output reg    AXIS_Out_tUser,
   output reg    AXIS_Out_tLast
   );
   
   //States
   parameter wait_on_both = 2'b00, wait_on_cur = 2'b01, wait_on_delay = 2'b10, go_delta = 2'b11;
   reg [1:0] current_state;
   reg [1:0] next_state; //Combinatorial type
   
   //Assignment of current state
   always @(posedge clk)
      current_state <= next_state;
   
   //Next state logic
   always @(*)
      if((current_state != go_delta) || reset)
         case({AXIS_InCur_tUser, AXIS_InDelay_tUser})
            2'b00: next_state <= wait_on_both;
            2'b01: next_state <= wait_on_cur;
            2'b10: next_state <= wait_on_delay;
            2'b11: next_state <= go_delta;
         endcase
      else
         case({AXIS_InCur_tUser, AXIS_InDelay_tUser})
            2'b00: next_state <= go_delta; //Normal middle of frame
            2'b01: next_state <= wait_on_cur; //Out of sync
            2'b10: next_state <= wait_on_delay; //Out of sync
            2'b11: next_state <= go_delta; //Normal start of frame
         endcase
   
   //Synchronisation of streams
   assign AXIS_InCur_tReady = (current_state!=wait_on_delay);
   assign AXIS_InDelay_tReady = (current_state!=wait_on_cur);
   
   //Delta calculation
   reg [7:0] delta;
   assign AXIS_Out_tData = delta;
   
   always @(posedge clk)
      if(AXIS_InCur_tData>=AXIS_InDelay_tData)//Must use absolute difference
         delta<=AXIS_InCur_tData-AXIS_InDelay_tData;
      else
         delta<=AXIS_InDelay_tData-AXIS_InCur_tData;
         
   //AXIS output signals
   always @(posedge clk) begin
      if(AXIS_InCur_tValid&&AXIS_InDelay_tValid&&current_state==go_delta)
         AXIS_Out_tValid<=1'b1;
      else
         AXIS_Out_tValid<=1'b0;
   
      AXIS_Out_tUser <= AXIS_InCur_tUser;
      AXIS_Out_tLast <= AXIS_InCur_tLast;
   end
endmodule   
