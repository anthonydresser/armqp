/**
 * combineStreams.cpp
 * @author Lukas Hunker
 * An IP Block used to combine two AXI streams one on top of another
 * Intended to combine streams for use with the Oculus Rift
 */

#include "ap_axi_sdata.h"
#define HEIGHT 1920
#define WIDTH 1080
int row = 0;

void combineStreams(ap_axis<16,2,5,6> A[WIDTH], ap_axis<16,2,5,6> B[WIDTH], ap_axis<16,2,5,6> C[WIDTH]){
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma HLS INTERFACE axis port=C

  int i;

  if (row < HEIGHT/2){
	  //Copy first stream
	  for_loop1:for(i = 0; i < WIDTH; i++){
	      C[i].data = A[i].data;
	      C[i].keep = A[i].keep;
	      C[i].strb = A[i].strb;
	      C[i].user = A[i].user;
	      C[i].last = A[i].last;
	      C[i].id = A[i].id;
	      C[i].dest = A[i].dest;
	    }
  }else{
	  //Copy second stream
	  for_loop2:for(i = 0; i < WIDTH; i++){
	        C[i].data = B[i].data;
	        C[i].keep = B[i].keep;
	        C[i].strb = B[i].strb;
	        C[i].user = 0;
	        C[i].last = B[i].last;
	        C[i].id = B[i].id;
	        C[i].dest = B[i].dest;
	      }
  }

  //Increment or reset row position
  if(row >= HEIGHT-1){
	  row = 0;
  } else{
	  row = row +1;
  }

}
