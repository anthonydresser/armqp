`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2015 02:02:54 PM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
    input clk,
    input [7:0] vData,
    output vClk
    );
    
     clk_wiz_0 instance_name
      (
      // Clock in ports
       .clk_in1(clk),      // input clk_in1
       // Clock out ports
       .clk_out1(vClk))     // output clk_out1
    
endmodule
