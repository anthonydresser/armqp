/*******************************************************************************
Vendor: Xilinx 
Associated Filename: example.cpp
Purpose: AXI stream interface example for Vivado HLS using side channel data
Revision History: February 13, 2012 - initial release
                                                
*******************************************************************************
#-  (c) Copyright 2011-2015 Xilinx, Inc. All rights reserved.
#-
#-  This file contains confidential and proprietary information
#-  of Xilinx, Inc. and is protected under U.S. and
#-  international copyright and other intellectual property
#-  laws.
#-
#-  DISCLAIMER
#-  This disclaimer is not a license and does not grant any
#-  rights to the materials distributed herewith. Except as
#-  otherwise provided in a valid license issued to you by
#-  Xilinx, and to the maximum extent permitted by applicable
#-  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#-  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#-  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#-  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#-  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#-  (2) Xilinx shall not be liable (whether in contract or tort,
#-  including negligence, or under any other theory of
#-  liability) for any loss or damage of any kind or nature
#-  related to, arising under or in connection with these
#-  materials, including for any direct, or any indirect,
#-  special, incidental, or consequential loss or damage
#-  (including loss of data, profits, goodwill, or any type of
#-  loss or damage suffered as a result of any action brought
#-  by a third party) even if such damage or loss was
#-  reasonably foreseeable or Xilinx had been advised of the
#-  possibility of the same.
#-
#-  CRITICAL APPLICATIONS
#-  Xilinx products are not designed or intended to be fail-
#-  safe, or for use in any application requiring fail-safe
#-  performance, such as life-support or safety devices or
#-  systems, Class III medical devices, nuclear facilities,
#-  applications related to the deployment of airbags, or any
#-  other applications that could lead to death, personal
#-  injury, or severe property or environmental damage
#-  (individually and collectively, "Critical
#-  Applications"). Customer assumes the sole risk and
#-  liability of any use of Xilinx products in Critical
#-  Applications, subject only to applicable laws and
#-  regulations governing limitations on product liability.
#-
#-  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#-  PART OF THIS FILE AT ALL TIMES. 
#- ************************************************************************


This file contains confidential and proprietary information of Xilinx, Inc. and 
is protected under U.S. and international copyright and other intellectual 
property laws.

DISCLAIMER
This disclaimer is not a license and does not grant any rights to the materials 
distributed herewith. Except as otherwise provided in a valid license issued to 
you by Xilinx, and to the maximum extent permitted by applicable law: 
(1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX 
HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether 
in contract or tort, including negligence, or under any other theory of 
liability) for any loss or damage of any kind or nature related to, arising under 
or in connection with these materials, including for any direct, or any indirect, 
special, incidental, or consequential loss or damage (including loss of data, 
profits, goodwill, or any type of loss or damage suffered as a result of any 
action brought by a third party) even if such damage or loss was reasonably 
foreseeable or Xilinx had been advised of the possibility of the same.

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-safe, or for use in any 
application requiring fail-safe performance, such as life-support or safety 
devices or systems, Class III medical devices, nuclear facilities, applications 
related to the deployment of airbags, or any other applications that could lead 
to death, personal injury, or severe property or environmental damage 
(individually and collectively, "Critical Applications"). Customer assumes the 
sole risk and liability of any use of Xilinx products in Critical Applications, 
subject only to applicable laws and regulations governing limitations on product 
liability. 

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT 
ALL TIMES.

*******************************************************************************/
#include "ap_axi_sdata.h"
#define WIDTH	640
#define BLACK	4224
//#define GREEN	0x0000
#define WHITE 0x80EB


void streamOverlay(ap_axiu<16,2,5,6> A[WIDTH], ap_axiu<16,2,5,6> B[WIDTH], ap_axiu<16,2,5,6> C[WIDTH]){
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma HLS INTERFACE axis port=C

  int i;

  for(i = 0; i < WIDTH; i++){
	  C[i].data = B[i].data < WHITE ? A[i].data : B[i].data;
//	  if(i < WIDTH/2){
//		  C[i].data = A[i].data;
//	  } else {
//		  C[i].data = B[i].data < WHITE ? A[i].data : B[i].data;
//	  }
//	  if(B[i].data == GREEN){
//		  C[i].data = A[i].data;
//	  } else {
//		  C[i].data = B[i].data;
//	  }
	  C[i].keep = 1;
	  C[i].strb = 1;
	  C[i].user = 1;
	  C[i].last = A[i].last;
	  C[i].id = 0;
	  C[i].dest = 1;
  }

//
//  for(i = 0; i < WIDTH; i++){
//	  if(i >= 1000 && i <= 1100){
//		    B[i].data = 0;
//		    B[i].keep = A[i].keep;
//		    B[i].strb = A[i].strb;
//		    B[i].user = A[i].user;
//		    B[i].last = A[i].last;
//		    B[i].id = A[i].id;
//		    B[i].dest = A[i].dest;
//	  } else {
//		    B[i].data = A[i].data;
//		    B[i].keep = A[i].keep;
//		    B[i].strb = A[i].strb;
//		    B[i].user = A[i].user;
//		    B[i].last = A[i].last;
//		    B[i].id = A[i].id;
//		    B[i].dest = A[i].dest;
//	  }
//  }
}
