`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2015 05:57:25 PM
// Design Name: 
// Module Name: OV7670_interface
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


module OV7670_interface(
    input [7:0] din,
    input vsync,
    input href,
    input pclk,
    input reset,
	output [15:0] dout
    );
    
    // s0 = waiting on next frame
    // s1 = waiting on row
    // s2 = reading 
    parameter s0 = 0, s1 = 1, s2 = 2;
    
    reg [2:0] currentstate;
    reg [2:0] nextstate;
    reg [15:0] douthold;
       
    always @(posedge pclk, posedge reset)
	begin
        if(reset)
            currentstate <= s0;
        else
            currentstate <= nextstate;
	end
    
    always @(posedge pclk)
	begin
	   if(currentstate == s2)
	   begin
	       douthold <= douthold << 8;
	       douthold[7:0] <= din;
       end
	end
	
	always @(posedge pclk)
	begin
	   if(vsync == 1)
	       nextstate <= s0;
       else if(href == 1)
           nextstate <= s2;
       else
           nextstate <= s1;
	end
    
    assign dout = douthold;
endmodule
