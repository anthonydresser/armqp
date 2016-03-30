`timescale 1ns / 1ps
module mem_interface_testbench;
   parameter width = 1080;
   parameter height = 960;

   reg clk, reset, AXIS_In_tValid, AXIS_Out_tReady, AXIS_In_tuser;
   reg [15:0] AXIS_In_tData;
   reg [$clog2(height):0] OutputY;
   reg [$clog2(width):0] OutputX;
   
   wire AXIS_In_tReady;
   wire [15:0] AXIS_Out_tData;
   wire AXIS_Out_tValid;
   
   wire Math_Valid;
   wire [11:0] MathX, MathY;
   wire memReady;
   
   integer fout;

   initial begin
      //Hold Reset for 100ns
      clk=0;
      reset=1;
      AXIS_In_tValid=0;
      AXIS_In_tData=0;
      AXIS_In_tuser=0;
      OutputY=0;
      OutputX=0;
      AXIS_Out_tReady=0;
      #1000;
      //Start Feeding in data from 'VDMA'
      reset=0;
      AXIS_In_tValid=1;
   end



   //clk generation: 148.5MHz (6.7ns)
   always begin
      #6.7;
      clk = ~clk;
   end
   
   //Counter reference
   //Output Position Logic -  OutputX   
    always @(posedge clk)
        begin
            if(reset)
                OutputX<=0;
            else
            if(Math_Valid&&memReady)
                if(OutputX==width-1)
                    OutputX<=0;
                else
                    OutputX<=OutputX+1'b1;
            else
                OutputX<=OutputX;
        end   
    
    //Head Position Logic -  OutputY    
    always @(posedge clk)
        begin
            if(reset)
                OutputY<=0;
            else
            if(Math_Valid&&memReady&&OutputX==width-1)
                if(OutputY==height-1)
                    OutputY<=0;
                else
                    OutputY<=OutputY+1'b1;
            else
                OutputY<=OutputY;
        end 
   
//simulating video input data as a counter
   always @(posedge clk)
     if(reset)
         AXIS_In_tData<=0;
     else
         if(AXIS_In_tReady)
             AXIS_In_tData<=AXIS_In_tData+1'b1;      

//Data Capture & Testing
   initial begin
  //    open file descriptor
      fout = $fopen("output.csv", "w");
    //  print column headers
      $fdisplay(fout, "Xin, Yin, Xout, Yout");
      

      wait(OutputX==width&&OutputY==1);
      
      $fclose(fout);
      $stop;//Stop simulation
   end
   
  // Data Capture Logic
   always @(posedge clk)
      if(Math_Valid&&memReady)//Discard invalid samples
         $fdisplay(fout, "%d, %d, %d, %d", OutputX, OutputY, MathX, MathY);
   

   barrel_proj_wrapper UUT(
     .AXIS_IN_tdata(AXIS_In_Data),
     .AXIS_IN_tready(AXIS_In_Ready),
     .AXIS_IN_tvalid(AXIS_In_Valid),
      .AXIS_Out_tdata(AXIS_Out_Data),
      .AXIS_Out_tready(AXIS_Out_Ready),
      .AXIS_Out_tvalid(AXIS_Out_Valid),
     .clk(clk),
     .reset(reset),
     .memReady(memReady),
     
     //Additional ports for export test...Lukas please adjust these
     .Math_Valid(Math_Valid),
     .MathX(MathX),
     .MathY(MathY)
     

     );

endmodule