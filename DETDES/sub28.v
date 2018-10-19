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
// Description: This module is same with IP c_addsub_v12 in function and utilization
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


(* use_dsp48 = "yes" *) module sub28(A, B, CLK, CE, SCLR, S);

  input signed [27:0]A;
  input signed [27:0]B;
  input CLK;
  input CE;
  input SCLR;
  output reg [27:0]S;

always @(posedge CLK)
	if(SCLR)
		S <= 0;
	else if(CE)
		S <= A - B;
  
  
endmodule

