`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: NQ
// 
// Create Date: 2018/09/13 21:00:53
// Design Name: 
// Module Name: adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module is same with IP mult_gen_v12 in function and utilization
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


(* use_dsp48 = "yes" *) module mult42_18(A, B, CLK, CE, SCLR, P);

input signed [41 : 0]A;
input signed [17 : 0]B;
input CLK;
input CE;
input SCLR;
output reg signed [59 : 0]P; 
    
always @(posedge CLK)
	if(SCLR)
		P <= 0;
	else if(CE)
		P <= A * B;
  
endmodule
