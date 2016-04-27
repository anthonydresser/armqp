`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI - AR MQP
// Engineer: Andrew Weiler
// 
// Create Date: 04/04/2016 01:20:55 AM
// Module Name: median
// Project Name: ARMQP
// Target Devices: Zync 7020
// Tool Versions: Vivado 2015.2
// Description: This modules implements an AXIS4 compliant median filter
// 
// Dependencies: None
// 
//////////////////////////////////////////////////////////////////////////////////


module median(
    input         clk,
    input         reset,
    
    input [7:0]   AXIS_In_tData,
    input         AXIS_In_tValid,//Fore-Pressure (i.e. The previous process is ready)
    output        AXIS_In_tReady,//Back-Pressure (i.e. This process is ready)
    input         AXIS_In_tUser,//Start of Frame, Resets Head counters
    input         AXIS_In_tLast,//End of Line
    
    output [7:0]  AXIS_Out_tData,
    output        AXIS_Out_tValid,//Fore-Pressure (i.e. This process is ready)
    input         AXIS_Out_tReady,//Back-Pressure (i.e. The next process is ready)
    output        AXIS_Out_tUser,//Start of Frame
    output        AXIS_Out_tLast//End of Line
    );
    
    //Frame Size
    parameter width = 240;
    parameter height = 200;
        
    //---------------------------Pipeline Control-------------------------------
    //Counter
    reg [$clog2(width+1):0] x;//These counters count the center of the median filter
    reg [$clog2(height+1):0] y;//[0,0] corresponds to the top left corner
    
    reg [$clog2(3*width):0] pixelsInBuffer; //This counts out filling the buffer from a cold start
    wire bufferFull;
    wire masterEnable;//Enables the median filter algorithm
    always @(posedge clk) begin
            if(reset)
                pixelsInBuffer <= 'b0;
            else if (AXIS_In_tValid && AXIS_In_tReady && ~bufferFull)
                    pixelsInBuffer <= pixelsInBuffer + 1'b1;
                else
                    pixelsInBuffer <= pixelsInBuffer;
    end
    
    //Main Control Signals
    assign bufferFull = pixelsInBuffer == ((2*width)+3);
    assign AXIS_In_tReady = AXIS_Out_tReady;
    assign AXIS_Out_tValid = bufferFull&&AXIS_In_tValid;
    assign masterEnable = AXIS_In_tValid && AXIS_In_tReady && AXIS_Out_tValid && AXIS_Out_tReady;
    
    always @(posedge clk) begin
        if(reset)
            x <= 'b0;
        else if (AXIS_In_tValid && AXIS_In_tReady && bufferFull)
                if(x+1<width)
                    x <= x + 'b1;
                else
                    x <= 'b0;
            else
                x <= x;
    end
    
    always @(posedge clk) begin
            if(reset)
                y <= 'b0;
            else if (AXIS_In_tValid && AXIS_In_tReady && bufferFull && x+1==width)
                    if(y+1<height)
                        y <= y + 'b1;
                    else
                        y <= 'b0;
                else
                    y <= y;
        end
    
    assign AXIS_Out_tUser = (x+1==width);
    assign AXIS_Out_tLast = (x+1==width&&y+1==height);
    //------------------------------Line Buffer---------------------------------
    reg [(8*((2*width)+3))-1:0] buffer;//Line buffer (2 full rows + 3 pixels deep, 8 bits/pixel, MS Pix = Newest)
    always @(posedge clk) begin
        if(reset)
            buffer <= 'b0;
        else if (AXIS_In_tValid && AXIS_In_tReady)
                buffer <= {AXIS_In_tData, buffer[(8*((2*width)+3))-1:8]};
            else
                buffer <= buffer;
    end
    
    //--------------------------Edge Case Trapping------------------------------
    reg [7:0] P [1:9];//Current 3x3 Median mask section
    //The following code use the indexed part-select operator (i.e. [offset-:width], where offset is the high index)
    always @(posedge clk) begin
        if(x==0&&y==0) begin //Top Left Corner
            //The buffer contains the last pixel in the 2nd to last row, the first row, plus 2 pixels in row 2
            P[1] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, 1st row
            P[2] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, 1st row
            P[3] <= buffer[(8*(1*width+2)+7)-:8];//copy 2nd pixel, 1st row
            P[4] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, 1st row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use 1st pixel, 1st row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//use 2nd pixel, 1st row
            P[7] <= buffer[(8*(2*width+1)+7)-:8];//copy 1st pixel, 2nd row
            P[8] <= buffer[(8*(2*width+1)+7)-:8];//use 1st pixel, 2nd row
            P[9] <= buffer[(8*(2*width+2)+7)-:8];//use 2nd pixel, 2nd row
            
        end else if (x+1==width&&y==0) begin //Top Right Corner
            //The buffer contains the last 2 pixels in the last row, row 1 and 2, and the 1st pixel in row 3
            P[1] <= buffer[(8*(1*width+0)+7)-:8];//copy 2nd to last pixel, 1st row
            P[2] <= buffer[(8*(1*width+1)+7)-:8];//copy last pixel, 1st row
            P[3] <= buffer[(8*(1*width+1)+7)-:8];//copy last pixel, 1st row
            P[4] <= buffer[(8*(1*width+0)+7)-:8];//use 2nd to last pixel, 1st row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use last pixel, 1st row
            P[6] <= buffer[(8*(1*width+1)+7)-:8];//copy last pixel, 1st row
            P[7] <= buffer[(8*(2*width+0)+7)-:8];//use 2nd to last pixel, 2nd row
            P[8] <= buffer[(8*(2*width+1)+7)-:8];//use last pixel, 2nd row
            P[9] <= buffer[(8*(2*width+1)+7)-:8];//copy last pixel, 2nd row
            
        end else if (y==0) begin //Anywhere else, top row
            //The buffer contains up from the x-1 pixel in the last row, row 1, and row 2 up to x+1
            P[1] <= buffer[(8*(1*width+0)+7)-:8];//copy x-1 pixel, 1st row
            P[2] <= buffer[(8*(1*width+1)+7)-:8];//copy x pixel, 1st row
            P[3] <= buffer[(8*(1*width+2)+7)-:8];//copy x+1 pixel, 1st row
            P[4] <= buffer[(8*(1*width+0)+7)-:8];//use x-1 pixel, 1st row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use x pixel, 1st row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//use x+1 pixel, 1st row
            P[7] <= buffer[(8*(2*width+0)+7)-:8];//use x-1 pixel, 2nd row
            P[8] <= buffer[(8*(2*width+1)+7)-:8];//use x pixel, 2nd row
            P[9] <= buffer[(8*(2*width+2)+7)-:8];//use x+1 pixel, 2nd row
            
        end else if(x==0&&y+1==height) begin //Bottom Left Corner
            //The buffer contains the last pixel in the 3rd to last row, the 2nd to last and last row, and 2 pixels in row 1
            P[1] <= buffer[(8*(0*width+1)+7)-:8];//copy 1st pixel, 2nd to last row
            P[2] <= buffer[(8*(0*width+1)+7)-:8];//use 1st pixel, 2nd to last row
            P[3] <= buffer[(8*(0*width+2)+7)-:8];//use 2nd pixel, 2nd to last row
            P[4] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, last row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use 1st pixel, last row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//use 2nd pixel, last row
            P[7] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, last row
            P[8] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, last row
            P[9] <= buffer[(8*(1*width+2)+7)-:8];//copy 2nd pixel, last row
            
         end else if(x+1==width&&y+1==height) begin //Bottom Right Corner
            //The buffer contains the last 2 pixels in the 2nd to last row, the last row, row 1, and the 1st pixel in row 2
            P[1] <= buffer[(8*(0*width+0)+7)-:8];//use 2nd to last pixel, 2nd to last row
            P[2] <= buffer[(8*(0*width+1)+7)-:8];//use last pixel, 2nd to last row
            P[3] <= buffer[(8*(0*width+1)+7)-:8];//copy last pixel, 2nd to last row
            P[4] <= buffer[(8*(1*width+1)+7)-:8];//use 2nd to last pixel, last row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use last pixel, last row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//copy last pixel, last row
            P[7] <= buffer[(8*(1*width+1)+7)-:8];//copy 2nd to last pixel, last row
            P[8] <= buffer[(8*(1*width+1)+7)-:8];//copy last pixel, last row
            P[9] <= buffer[(8*(1*width+2)+7)-:8];//copy last pixel, last row
         
         end else if(y+1==height) begin //Anywhere else, bottom row
            //The buffer contains up from the x-1 pixel in the second to last row, the last row, and row 1 up to x+1
            P[1] <= buffer[(8*(0*width+0)+7)-:8];//use x-1 pixel, 2nd to last row
            P[2] <= buffer[(8*(0*width+1)+7)-:8];//use x pixel, 2nd to last row
            P[3] <= buffer[(8*(0*width+2)+7)-:8];//use x+1 pixel, 2nd to last row
            P[4] <= buffer[(8*(1*width+0)+7)-:8];//use x-1 pixel, last row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use x pixel, last row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//use x+1 pixel, last row
            P[7] <= buffer[(8*(1*width+0)+7)-:8];//copy x-1 pixel, last row
            P[8] <= buffer[(8*(1*width+1)+7)-:8];//copy x pixel, last row
            P[9] <= buffer[(8*(1*width+2)+7)-:8];//copy x+1 pixel, last row
            
        end else if(x==0) begin //Anywhere else, left side
            //The buffer contains the last pixel in the y-2 row, the y-1 and y row, plus 2 pixels in y+1 row
            P[1] <= buffer[(8*(0*width+1)+7)-:8];//copy 1st pixel, y-1 row
            P[2] <= buffer[(8*(0*width+1)+7)-:8];//use 1st pixel, y-1 row
            P[3] <= buffer[(8*(0*width+2)+7)-:8];//use 2nd pixel, y-1 row
            P[4] <= buffer[(8*(1*width+1)+7)-:8];//copy 1st pixel, y row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use 1st pixel, y row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//use 2nd pixel, y row
            P[7] <= buffer[(8*(2*width+1)+7)-:8];//copy 1st pixel, y+1 row
            P[8] <= buffer[(8*(2*width+1)+7)-:8];//use 1st pixel, y+1 row
            P[9] <= buffer[(8*(2*width+2)+7)-:8];//use 2nd pixel, y+1 row
            
         end else if(x==0) begin //Anywhere else, right side
            //The buffer contains the last 2 pixels in the y-1 row, the y and y+1 row, plus the 1st pixel in y+2 row
            P[1] <= buffer[(8*(0*width+0)+7)-:8];//use 2nd to last pixel, y-1 row
            P[2] <= buffer[(8*(0*width+1)+7)-:8];//use last pixel, y-1 row
            P[3] <= buffer[(8*(0*width+1)+7)-:8];//copy last pixel, y-1 row
            P[4] <= buffer[(8*(1*width+0)+7)-:8];//use 2nd to last pixel, y row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use last pixel, y row
            P[6] <= buffer[(8*(1*width+1)+7)-:8];//copy last pixel, y row
            P[7] <= buffer[(8*(2*width+0)+7)-:8];//use 2nd to last pixel, y+1 row
            P[8] <= buffer[(8*(2*width+1)+7)-:8];//use last pixel, y+1 row
            P[9] <= buffer[(8*(2*width+1)+7)-:8];//copy last pixel, y+1 row
            
         end else begin //Anywhere in the middle
            //The buffer contains all the pixels between the x-1, y-1 pixel and the x+1, y+1 pixel
            P[1] <= buffer[(8*(0*width+0)+7)-:8];//use x-1 pixel, y-1 row
            P[2] <= buffer[(8*(0*width+1)+7)-:8];//use x pixel, y-1 row
            P[3] <= buffer[(8*(0*width+2)+7)-:8];//use x+1 pixel, y-1 row
            P[4] <= buffer[(8*(1*width+0)+7)-:8];//use x-1 pixel, y row
            P[5] <= buffer[(8*(1*width+1)+7)-:8];//use x pixel, y row
            P[6] <= buffer[(8*(1*width+2)+7)-:8];//use x+1 pixel, y row
            P[7] <= buffer[(8*(2*width+0)+7)-:8];//use x-1 pixel, y+1 row
            P[8] <= buffer[(8*(2*width+1)+7)-:8];//use x pixel, y+1 row
            P[9] <= buffer[(8*(2*width+2)+7)-:8];//use x+1 pixel, y+1 row
        end
    end
    //--------------------------Median Calculation-----------------------------
    //The following intermediate wires are used. If you examine the diagram in
    //   in the report, the instantiation below lines up with all dots on the 
    //   same horizontal position/order in the diagram.
    
    //1st Series
    wire [7:0] P2_P3_low, P5_P6_low, P8_P9_low;
    wire [7:0] P2_P3_high, P5_P6_high, P8_P9_high;
    
      assign P2_P3_low = P[2]>P[3] ? P[3] : P[2];
      assign P2_P3_high = P[2]>P[3] ? P[2] : P[3];
      
      assign P5_P6_low = P[5]>P[6] ? P[6] : P[5];
      assign P5_P6_high = P[5]>P[6] ? P[5] : P[6];
      
      assign P8_P9_low = P[8]>P[9] ? P[9] : P[8];
      assign P8_P9_high = P[8]>P[9] ? P[8] : P[9];
   
   //2nd Series
   wire [7:0] P1_P2P3_low, P4_P5P6_low, P7_P8P9_low;
   wire [7:0] P1_P2P3_high, P4_P5P6_high, P7_P8P9_high;
   
      assign P1_P2P3_low = P[1]>P2_P3_low ? P2_P3_low : P[1];
      assign P1_P2P3_high = P[1]>P2_P3_low ? P[1] : P2_P3_low;
      
      assign P4_P5P6_low = P[4]>P5_P6_low ? P5_P6_low : P[4];
      assign P4_P5P6_high = P[4]>P5_P6_low ? P[4] : P5_P6_low;
      
      assign P7_P8P9_low = P[7]>P8_P9_low ? P8_P9_low : P[7];
      assign P7_P8P9_high = P[7]>P8_P9_low ? P[7] : P8_P9_low;
   
   //3rd Series
   wire [7:0] P123_low, P456_low, P789_low;
   wire [7:0] P123_high, P456_high, P789_high;
   
      assign P123_low = P1_P2P3_high>P2_P3_high ? P2_P3_high : P1_P2P3_high;
      assign P123_high = P1_P2P3_high>P2_P3_high ? P1_P2P3_high : P2_P3_high;
      
      assign P456_low = P4_P5P6_high>P5_P6_high ? P5_P6_high : P4_P5P6_high;
      assign P456_high = P4_P5P6_high>P5_P6_high ? P4_P5P6_high : P5_P6_high;
      
      assign P789_low = P7_P8P9_high>P8_P9_high ? P8_P9_high : P7_P8P9_high;
      assign P789_high = P7_P8P9_high>P8_P9_high ? P7_P8P9_high : P8_P9_high;
   
   //4th series, Middle Pair, discarding 2 values
   wire [7:0] P123_P456_high;
   wire [7:0] P456_P789_low;
      
      assign P123_P456_high = P1_P2P3_low>P4_P5P6_low ? P1_P2P3_low : P4_P5P6_low;
      
      assign P456_P789_low = P456_high>P789_high ? P789_high : P456_high;
      
   //5th series, Middle single
   wire [7:0] S5_P456_P789_low;
   wire [7:0] S5_P456_P789_high;
   
      assign S5_P456_P789_low = P456_low>P789_low ? P789_low : P456_low;
      assign S5_P456_P789_high = P456_low>P789_low ? P456_low : P789_low;
   
   //6th series, discarding 3 values. Carefully note the gaps below
   wire [7:0] S6_3_low;
   wire [7:0] S6_1_high, S6_2_high;
    
      assign S6_1_high = P123_P456_high>P7_P8P9_low ? P123_P456_high : P7_P8P9_low;
      
      assign S6_2_high = P123_low>S5_P456_P789_low ? P123_low : S5_P456_P789_low;
      
      assign S6_3_low = P123_high>P456_P789_low ? P456_P789_low : P123_high;
   
   //7th series, middle single, discarding 1 value.
   wire [7:0] S7_low;
   
      assign S7_low = S6_2_high>S5_P456_P789_high ? S5_P456_P789_high : S6_2_high;
   
   //8th series, middle single
   wire [7:0] S8_low;
   wire [7:0] S8_high;
   
      assign S8_low = S7_low>S6_3_low ? S6_3_low : S7_low;
      assign S8_high = S7_low>S6_3_low ? S7_low : S6_3_low;
   
   //9th series, middle single, discarding 1
   wire [7:0] S9_high;

      assign S9_high = S6_1_high>S8_low ? S6_1_high : S8_low;
   
   //10th series, selection of median value
      assign AXIS_Out_tData = S9_high>S8_high ? S8_high : S9_high;
   
endmodule
