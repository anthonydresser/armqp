`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2015 11:16:34 PM
// Design Name: 
// Module Name: edgeDetect
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


module edgeDetect(input sig_a, input rst, input clk, output sig_a_risedge);

  reg sig_a_d1;

  always @(posedge clk or negedge rst)
  begin
    if(!rst)
      sig_a_d1<=1'b0;
    else
      sig_a_d1<=sig_a;
  end

  assign sig_a_risedge=sig_a & !sig_a_d1;

endmodule
