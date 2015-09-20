`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Anthony Dresser
// 
// Create Date: 09/19/2015 04:08:09 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
	input [7:0] vdin,
	input clk,
	input pclk,
	input vsync,
	input href,
	input reset,
	output vclk
    );
	
	wire ena, clk_24M, wea;
	wire [7:0] dataW;
	wire [3:0] addrW;
	
	
    clk_wiz_1 clk_gen (
		// Clock in ports
		.clk_in1(clk),      // input clk_in1
		// Clock out ports
		.clk_out1(clk_24M),     // output clk_out1
		// Status and control signals
		.reset(reset), // input reset
		.locked(locked)
	);
        
    blk_mem_gen_0 bmem (
		.clka(clk_24M),    // input wire clka
		.ena(ena),      // input wire ena
		.wea(wea),      // input wire [0 : 0] wea
		.addra(addrW),  // input wire [3 : 0] addra
		.dina(dataW),    // input wire [7 : 0] dina
		.douta()  // output wire [7 : 0] douta
    );
   
    OV7670_interface cam (
		.wclk(clk_24M),
		.din(vdin),
		.vsync(vsync),
		.href(href),
		.pclk(pclk),
		.reset(reset),
		.dout(dataW),
		.addrout(addrW),
		.we(wea)
    );
    
    assign ena = 1'b1;
        
endmodule
