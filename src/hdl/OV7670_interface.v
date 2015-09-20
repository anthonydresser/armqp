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
	input wclk,
    input [7:0] din,
    input vsync,
    input href,
    input pclk,
    input reset,
	output reg [7:0] dout,
	output reg [3:0] addrout,
	output reg we
    );
    
    // s0 = waiting on next frame
    // s1 = waiting on row
    // s2 = reading
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    
    reg [2:0] currentstate;
    reg [2:0] nextstate;
	reg [7:0] datahold;
       
    always @(posedge pclk, posedge reset)
	begin
        if(reset)
            currentstate <= s0;
        else
            currentstate <= nextstate;
	end
    
    always @(posedge pclk)
	begin
        case(currentstate)
            s2: begin
				datahold <= din;
                nextstate <= s2;
                end
       endcase
	end
            
    always @(vsync)
	begin
        if(vsync == 1)
            nextstate <= s0;
        else
            nextstate <= s1;
	end
            
    always @(href)
	begin
        if(href == 0)
            nextstate <= s1;
        else
            nextstate <= s2;
	end
    
	always @(posedge wclk, posedge reset)
	begin
	   if(reset)
	   begin
	       we <= 0;
	       dout <= 8'b0;
	       addrout <= 4'b0;
	   end
	   else
	   begin
            if(currentstate == s2)
            begin
                we <= 1;
                dout <= datahold;
                addrout <= addrout + 1;
            end
            else
                we <= 0;
        end
	end
endmodule
