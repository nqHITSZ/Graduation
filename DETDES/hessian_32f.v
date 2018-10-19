`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 13:52:17
// Design Name: 
// Module Name: hessian_32f
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


module	hessian_32f  #( parameter constanta = 1165,
						parameter constantb = 2595,
						parameter MULT_IN_DATAWIDTH = 21,
						parameter DATA_WIDTH = 28)
				 (
				
				    input	wire	[DATA_WIDTH - 1:0]	Dxx_A,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_B,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_C,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_D,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_E,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_F,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_G,
					input	wire	[DATA_WIDTH - 1:0]	Dxx_H,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_A,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_B,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_C,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_D,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_E,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_F,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_G,
					input	wire	[DATA_WIDTH - 1:0]	Dyy_H,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_A,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_B,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_C,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_D,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_E,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_F,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_G,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_H,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_I,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_J,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_K,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_L,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_M,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_N,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_O,
					input	wire	[DATA_WIDTH - 1:0]	Dxy_P,
					input	wire						din_valid,
					input	wire						clk,
					input	wire						rst_n,
					output	wire						o_d_valid,
					output	wire	[DATA_WIDTH + 3:0]	o_d
				
				 );
				 
				wire	[DATA_WIDTH - 1:0]		o_d_Dxx;     //Dxx计算数据输出
				wire	[DATA_WIDTH - 1:0]		o_d_Dyy;
				wire	[DATA_WIDTH - 1:0]		o_d_Dxy;
				wire							ce_detH;    //计算hessian矩阵det使能信号
																	//Dxx、Dyy、Dxy输出同时有效，
																	//相对于din_valid延时4个周期
				
				/********************************************
				*计算Dxx
				********************************************/
				derXX  inst_Dxx(
				
						.A				(Dxx_A),
						.B				(Dxx_B),
						.C				(Dxx_C),
						.D				(Dxx_D),
						.E				(Dxx_E),
						.F				(Dxx_F),
						.G				(Dxx_G),
						.H				(Dxx_H),
						.clk			(clk),
						.rst_n			(rst_n),
						.din_valid		(din_valid),
						.Dxx_d_o   		(o_d_Dxx),
						.Dxx_d_o_valid	(ce_detH)
				
				);
				
				
				/********************************************
				*计算Dyy
				********************************************/
				derXX  inst_Dyy(
				
						.A				(Dyy_A),
						.B				(Dyy_B),
						.C				(Dyy_C),
						.D				(Dyy_D),
						.E				(Dyy_E),
						.F				(Dyy_F),
						.G				(Dyy_G),
						.H				(Dyy_H),
						.clk			(clk),
						.rst_n			(rst_n),
						.din_valid		(din_valid),	
						.Dxx_d_o   		(o_d_Dyy),
						.Dxx_d_o_valid	()
				
				);
				
				
				/********************************************
				*计算Dxy
				********************************************/
				derXY  inst_Dxy(
				
						.A				(Dxy_A),
						.B				(Dxy_B),
						.C				(Dxy_C),
						.D				(Dxy_D),
						.E				(Dxy_E),
						.F				(Dxy_F),
						.G				(Dxy_G),
						.H				(Dxy_H),
						.I   			(Dxy_I),
						.J				(Dxy_J),
						.K				(Dxy_K),
						.L				(Dxy_L),
						.M				(Dxy_M),
						.N				(Dxy_N),
						.O  			(Dxy_O),
						.P				(Dxy_P),
						.clk			(clk),
						.rst_n			(rst_n),
						.din_valid 		(din_valid),
						.Dxy_d_o   		(o_d_Dxy),
						.Dxy_d_o_valid	()
				
				);
				
				
			
				
				/**********************************************
				*求解hessian矩阵detH
				**********************************************/
				detH_32f #(.constanta	(constanta),
					   .constantb	(constantb))  inst_detH
				(
					.Dxx_d				({o_d_Dxx[DATA_WIDTH - 1],o_d_Dxx[MULT_IN_DATAWIDTH - 2:0]}),
					.Dyy_d				({o_d_Dyy[DATA_WIDTH - 1],o_d_Dyy[MULT_IN_DATAWIDTH - 2:0]}),
					.Dxy_d				({o_d_Dxy[DATA_WIDTH - 1],o_d_Dxy[MULT_IN_DATAWIDTH - 2:0]}),
					.clk				(clk),
					.rst_n 				(rst_n),
					.din_valid			(ce_detH),
					.det_d_o			(o_d),
					.det_d_o_valid		(o_d_valid)
				);
				
endmodule
