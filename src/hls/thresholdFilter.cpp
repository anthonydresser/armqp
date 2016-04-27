#include "ap_axi_sdata.h"
#define WHITE 0x80EB
#define BLACK 0x8010
#define WIDTH 640
#define THRESHOLD 0x77

void threshold_filter(ap_axiu<16,2,5,6> videoIn[WIDTH], ap_axiu<16,2,5,6> videoOut[WIDTH]){
#pragma HLS INTERFACE axis port=videoIn
#pragma HLS INTERFACE axis port=videoOut

	int i;

	for(i = 0; i < WIDTH; i++){
		videoOut[i].data = (0xFF & videoIn[i].data) < THRESHOLD ? BLACK : WHITE;
		videoOut[i].keep = videoIn[i].keep;
		videoOut[i].strb = videoIn[i].strb;
		videoOut[i].user = videoIn[i].user;
		videoOut[i].last = videoIn[i].last;
		videoOut[i].id = videoIn[i].id;
		videoOut[i].dest = videoIn[i].dest;
	}
}
