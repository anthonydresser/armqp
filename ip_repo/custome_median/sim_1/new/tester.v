`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI - ARMQP
// Engineer: Andrew Weiler
// 
// Create Date: 04/04/2016 01:20:55 AM
// Module Name: tester
// Project Name: ARMQP
// Target Devices: Zync 7020
// Tool Versions: Vivado 2015.2
// Description: This module test the median filter by using an external image
//  input and output.
// Dependencies: median.v, image data
//
//////////////////////////////////////////////////////////////////////////////////


module tester();
   //UUT Stuff
   reg         clk;
   reg         reset;
   reg [7:0]   AXIS_In_tData;
   reg         AXIS_In_tValid;//Fore-Pressure (i.e. The previous process is ready)
   wire        AXIS_In_tReady;//Back-Pressure (i.e. This process is ready)
   reg         AXIS_In_tUser;//Start of Frame
   reg         AXIS_In_tLast;//End of Line
   wire [7:0]  AXIS_Out_tData;
   wire        AXIS_Out_tValid;//Fore-Pressure (i.e. This process is ready)
   reg         AXIS_Out_tReady;//Back-Pressure (i.e. The next process is ready)
   wire        AXIS_Out_tUser;//Start of Frame
   wire        AXIS_Out_tLast;//End of Line
   
   //Testing Stuff!
   integer fin, fout, status;

median UUT(
    .clk(clk),
    .reset(reset),
    
    .AXIS_In_tData(AXIS_In_tData),
    .AXIS_In_tValid(AXIS_In_tValid),//Fore-Pressure (i.e. The previous process is ready)
    .AXIS_In_tReady(AXIS_In_tReady),//Back-Pressure (i.e. This process is ready)
    .AXIS_In_tUser(AXIS_In_tUser),//Start of Frame
    .AXIS_In_tLast(AXIS_In_tLast),//End of Line
    
    .AXIS_Out_tData(AXIS_Out_tData),
    .AXIS_Out_tValid(AXIS_Out_tValid),//Fore-Pressure (i.e. This process is ready)
    .AXIS_Out_tReady(AXIS_Out_tReady),//Back-Pressure (i.e. The next process is ready)
    .AXIS_Out_tUser(AXIS_Out_tUser),//Start of Frame
    .AXIS_Out_tLast(AXIS_Out_tLast)//End of Line
    );
    
initial begin
   clk=0;
   reset=1;
   AXIS_In_tData=0;
   AXIS_In_tValid=0;
   AXIS_In_tUser=0;//not used by UUT
   AXIS_In_tLast=0;//not used by UUT
   AXIS_Out_tReady=0;
   
   #96;
   
   fin = $fopen ("fin.csv", "r");
   fout = $fopen ("fout.csv", "w");
   reset = 0;
   AXIS_In_tValid=1;
   AXIS_Out_tReady=1;
   
   while(!$feof(fin)) begin 
      @(posedge clk);
      status=$fscanf(fin, "%d,", AXIS_In_tData);
   end
   
   wait(AXIS_Out_tLast==1);
   @(posedge clk);
   @(posedge clk);//wait one more cycle for 48000th sample to be captured
   $fclose(fin);
   $fclose(fout);
   $stop;
end

always #5 clk=~clk;

always @(posedge clk)
   if(AXIS_Out_tValid)
      $fdisplay(fout, "%d", AXIS_Out_tData);
      
endmodule
