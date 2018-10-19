`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 13:40:08
// Design Name: 
// Module Name: hessian8Scales
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


module	hessian8Scales #(parameter	DATA_WIDTH = 28)
		(
				/**************************************************
				*控制信号
				**************************************************/
				input	wire						rst_n,
				input	wire						clk,
				input	wire						din_valid,
				
				/************************************************
				*中心及周围四个数据
				************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxy_F,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_G,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_J,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_K,
				
				/*************************************************
				*9x9数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_09,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_09,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_09,
				
				
				/*************************************************
				*15x15数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_15,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_15,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_15,
				
				
				/*************************************************
				*21x21数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_21,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_21,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_21,
				
				/*************************************************
				*27x27数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_27,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_27,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_27,
				
				/*************************************************
				*33x33数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_33,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_33,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_33,
				
				/*************************************************
				*39x39数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_39,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_39,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_39,
				
				/*************************************************
				*45x45数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_45,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_45,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_45,
				
				/*************************************************
				*51x51数据输入
				*************************************************/
				input	wire	[DATA_WIDTH - 1:0]	Dxx_A_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_B_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_C_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_D_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_E_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_F_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_G_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxx_H_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_A_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_B_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_C_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_D_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_E_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_F_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_G_51,
				input	wire	[DATA_WIDTH - 1:0]	Dyy_H_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_A_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_B_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_C_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_D_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_E_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_H_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_I_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_L_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_M_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_N_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_O_51,
				input	wire	[DATA_WIDTH - 1:0]	Dxy_P_51,
				
				/***************************************************
				*输出信号，包括输出数据和输出有效信号
				*输出数据o_d_xx表示模板大小为xx对应的hessian矩阵det
				****************************************************/
//				input [9:0] i_row_cnt, i_col_cnt,
//				output [9:0] o_row_cnt, o_col_cnt,
				output	wire						o_d_valid,
				output	wire	[DATA_WIDTH + 3:0]	o_d_09,
				output	wire	[DATA_WIDTH + 3:0]	o_d_15,
				output	wire	[DATA_WIDTH + 3:0]	o_d_21,
				output	wire	[DATA_WIDTH + 3:0]	o_d_27,
				output	wire	[DATA_WIDTH + 3:0]	o_d_33,
				output	wire	[DATA_WIDTH + 3:0]	o_d_39,
				output	wire	[DATA_WIDTH + 3:0]	o_d_45,
				output	wire	[DATA_WIDTH + 3:0]	o_d_51
		);
		
		localparam maxValidLatency = 7;
		reg [maxValidLatency-1:0] valid_delay;
		integer i;
		
//		reg [9:0] delay_col_cnt [maxValidLatency-1:0];
//		reg [9:0] delay_row_cnt [maxValidLatency-1:0];
//		always @(posedge clk) begin
//		    for(i=0; i<maxValidLatency-1; i=i+1)
//		        delay_col_cnt[i+1] <= delay_col_cnt[i];
//		    delay_col_cnt[0] <= i_col_cnt;
//		end
//		always @(posedge clk) begin
//		    for(i=0; i<maxValidLatency-1; i=i+1)
//		        delay_row_cnt[i+1] <= delay_row_cnt[i];
//		    delay_row_cnt[0] <= i_row_cnt;
//		end
		
//		assign o_col_cnt = delay_col_cnt[maxValidLatency-1];
//		assign o_row_cnt = delay_row_cnt[maxValidLatency-1];
		
		
				
		/*********************************************
		*9x9hessian计算
		*常数  81827 ----- 0000_0000_0000_1001_1111_1101_0001_1100
		*      66280 ----- 0000_0000_0000_1000_0001_0111_0100_0010
		*********************************************/
		hessian_29f  #(.constanta	('d81827),
					   .constantb	('d66280))	inst_hessian09 
		(
				.Dxx_A					(Dxx_A_09),
				.Dxx_B					(Dxx_B_09),
				.Dxx_C					(Dxx_C_09),
				.Dxx_D					(Dxx_D_09),
				.Dxx_E					(Dxx_E_09),
				.Dxx_F					(Dxx_F_09),
				.Dxx_G					(Dxx_G_09),
				.Dxx_H					(Dxx_H_09),
				.Dyy_A					(Dyy_A_09),
				.Dyy_B					(Dyy_B_09),
				.Dyy_C					(Dyy_C_09),
				.Dyy_D					(Dyy_D_09),
				.Dyy_E					(Dyy_E_09),
				.Dyy_F					(Dyy_F_09),
				.Dyy_G					(Dyy_G_09),
				.Dyy_H					(Dyy_H_09),
				.Dxy_A					(Dxy_A_09),
				.Dxy_B					(Dxy_B_09),
				.Dxy_C					(Dxy_C_09),
				.Dxy_D					(Dxy_D_09),
				.Dxy_E					(Dxy_E_09),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_09),
				.Dxy_I					(Dxy_I_09),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_09),
				.Dxy_M					(Dxy_M_09),
				.Dxy_N					(Dxy_N_09),
				.Dxy_O					(Dxy_O_09),
				.Dxy_P					(Dxy_P_09),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(o_d_valid),
				.o_d					(o_d_09)
		);
		
		
		
		/*********************************************
		*15x15hessian计算
		*常数: 10604 ----- 0000_0000_0000_0001_0100_1011_0110_0110
		*      8589 ----- 0000_0000_0000_0001_0000_1100_0101_1111
		*********************************************/
		hessian_29f #(.constanta	('d10604),
				      .constantb	('d8589))	inst_hessian15
		(
				.Dxx_A					(Dxx_A_15),
				.Dxx_B					(Dxx_B_15),
				.Dxx_C					(Dxx_C_15),
				.Dxx_D					(Dxx_D_15),
				.Dxx_E					(Dxx_E_15),
				.Dxx_F					(Dxx_F_15),
				.Dxx_G					(Dxx_G_15),
				.Dxx_H					(Dxx_H_15),
				.Dyy_A					(Dyy_A_15),
				.Dyy_B					(Dyy_B_15),
				.Dyy_C					(Dyy_C_15),
				.Dyy_D					(Dyy_D_15),
				.Dyy_E					(Dyy_E_15),
				.Dyy_F					(Dyy_F_15),
				.Dyy_G					(Dyy_G_15),
				.Dyy_H					(Dyy_H_15),
				.Dxy_A					(Dxy_A_15),
				.Dxy_B					(Dxy_B_15),
				.Dxy_C					(Dxy_C_15),
				.Dxy_D					(Dxy_D_15),
				.Dxy_E					(Dxy_E_15),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_15),
				.Dxy_I					(Dxy_I_15),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_15),
				.Dxy_M					(Dxy_M_15),
				.Dxy_N					(Dxy_N_15),
				.Dxy_O					(Dxy_O_15),
				.Dxy_P					(Dxy_P_15),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_15)
		);
		
		
		
		/*********************************************
		*21x21hessian计算
		*常数 ： 2760 ----- 0000_0000_0000_0000_0101_0110_0100_0100
		*		 2236 ----- 0000_0000_0000_0000_0100_0101_1110_0000
		*********************************************/
		hessian_29f #(.constanta	('d2760),
				      .constantb	('d2236))	inst_hessian21
		(
				.Dxx_A					(Dxx_A_21),
				.Dxx_B					(Dxx_B_21),
				.Dxx_C					(Dxx_C_21),
				.Dxx_D					(Dxx_D_21),
				.Dxx_E					(Dxx_E_21),
				.Dxx_F					(Dxx_F_21),
				.Dxx_G					(Dxx_G_21),
				.Dxx_H					(Dxx_H_21),
				.Dyy_A					(Dyy_A_21),
				.Dyy_B					(Dyy_B_21),
				.Dyy_C					(Dyy_C_21),
				.Dyy_D					(Dyy_D_21),
				.Dyy_E					(Dyy_E_21),
				.Dyy_F					(Dyy_F_21),
				.Dyy_G					(Dyy_G_21),
				.Dyy_H					(Dyy_H_21),
				.Dxy_A					(Dxy_A_21),
				.Dxy_B					(Dxy_B_21),
				.Dxy_C					(Dxy_C_21),
				.Dxy_D					(Dxy_D_21),
				.Dxy_E					(Dxy_E_21),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_21),
				.Dxy_I					(Dxy_I_21),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_21),
				.Dxy_M					(Dxy_M_21),
				.Dxy_N					(Dxy_N_21),
				.Dxy_O					(Dxy_O_21),
				.Dxy_P					(Dxy_P_21),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_21)
		);
		
		
		/*********************************************
		*27x27hessian计算
		*常数 : 1010 ----- 0000_0000_0000_0000_0001_1111_1001_0001
		*       818 ----- 0000_0000_0000_0000_0001_1001_1001_0010
		*********************************************/
		hessian_29f  #(.constanta	('d1010),
				       .constantb	('d818))	inst_hessian27
		(
				.Dxx_A					(Dxx_A_27),
				.Dxx_B					(Dxx_B_27),
				.Dxx_C					(Dxx_C_27),
				.Dxx_D					(Dxx_D_27),
				.Dxx_E					(Dxx_E_27),
				.Dxx_F					(Dxx_F_27),
				.Dxx_G					(Dxx_G_27),
				.Dxx_H					(Dxx_H_27),
				.Dyy_A					(Dyy_A_27),
				.Dyy_B					(Dyy_B_27),
				.Dyy_C					(Dyy_C_27),
				.Dyy_D					(Dyy_D_27),
				.Dyy_E					(Dyy_E_27),
				.Dyy_F					(Dyy_F_27),
				.Dyy_G					(Dyy_G_27),
				.Dyy_H					(Dyy_H_27),
				.Dxy_A					(Dxy_A_27),
				.Dxy_B					(Dxy_B_27),
				.Dxy_C					(Dxy_C_27),
				.Dxy_D					(Dxy_D_27),
				.Dxy_E					(Dxy_E_27),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_27),
				.Dxy_I					(Dxy_I_27),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_27),
				.Dxy_M					(Dxy_M_27),
				.Dxy_N					(Dxy_N_27),
				.Dxy_O					(Dxy_O_27),
				.Dxy_P					(Dxy_P_27),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_27)
		);
		
		
		/*********************************************
		*33x33hessian计算
		*常数 ：3621 ----- 0000_0000_0000_0000_0000_1110_0010_0101
		*       2933 ---- 0000_0000_0000_0000_0000_1011_0111_0101
		*********************************************/
		hessian_32f #(.constanta	('d3621),
				      .constantb	('d2933))	inst_hessian33
		(
				.Dxx_A					(Dxx_A_33),
				.Dxx_B					(Dxx_B_33),
				.Dxx_C					(Dxx_C_33),
				.Dxx_D					(Dxx_D_33),
				.Dxx_E					(Dxx_E_33),
				.Dxx_F					(Dxx_F_33),
				.Dxx_G					(Dxx_G_33),
				.Dxx_H					(Dxx_H_33),
				.Dyy_A					(Dyy_A_33),
				.Dyy_B					(Dyy_B_33),
				.Dyy_C					(Dyy_C_33),
				.Dyy_D					(Dyy_D_33),
				.Dyy_E					(Dyy_E_33),
				.Dyy_F					(Dyy_F_33),
				.Dyy_G					(Dyy_G_33),
				.Dyy_H					(Dyy_H_33),
				.Dxy_A					(Dxy_A_33),
				.Dxy_B					(Dxy_B_33),
				.Dxy_C					(Dxy_C_33),
				.Dxy_D					(Dxy_D_33),
				.Dxy_E					(Dxy_E_33),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_33),
				.Dxy_I					(Dxy_I_33),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_33),
				.Dxy_M					(Dxy_M_33),
				.Dxy_N					(Dxy_N_33),
				.Dxy_O					(Dxy_O_33),
				.Dxy_P					(Dxy_P_33),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_33)
		);
		
		
		/*********************************************
		*39x39hessian计算
		*常数 : 1856 ----- 0000_0000_0000_0000_0000_0111_0100_0000
		*       1503 ----- 0000_0000_0000_0000_0000_0101_1101_1111
		*********************************************/
		hessian_32f #(.constanta	('d1856),
				      .constantb	('d1503))	inst_hessian39
		(
				.Dxx_A					(Dxx_A_39),
				.Dxx_B					(Dxx_B_39),
				.Dxx_C					(Dxx_C_39),
				.Dxx_D					(Dxx_D_39),
				.Dxx_E					(Dxx_E_39),
				.Dxx_F					(Dxx_F_39),
				.Dxx_G					(Dxx_G_39),
				.Dxx_H					(Dxx_H_39),
				.Dyy_A					(Dyy_A_39),
				.Dyy_B					(Dyy_B_39),
				.Dyy_C					(Dyy_C_39),
				.Dyy_D					(Dyy_D_39),
				.Dyy_E					(Dyy_E_39),
				.Dyy_F					(Dyy_F_39),
				.Dyy_G					(Dyy_G_39),
				.Dyy_H					(Dyy_H_39),
				.Dxy_A					(Dxy_A_39),
				.Dxy_B					(Dxy_B_39),
				.Dxy_C					(Dxy_C_39),
				.Dxy_D					(Dxy_D_39),
				.Dxy_E					(Dxy_E_39),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_39),
				.Dxy_I					(Dxy_I_39),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_39),
				.Dxy_M					(Dxy_M_39),
				.Dxy_N					(Dxy_N_39),
				.Dxy_O					(Dxy_O_39),
				.Dxy_P					(Dxy_P_39),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_39)
		);
		
		
		/*********************************************
		*45x45hessian计算
		*常数 ： 1047 ----- 0000_0000_0000_0000_0000_0100_0001_0111
		*	     848 ----- 0000_0000_0000_0000_0000_0011_0101_0000
		*********************************************/
		hessian_32f #(.constanta	('d1047),
				      .constantb	('d848))	inst_hessian45
		(
				.Dxx_A					(Dxx_A_45),
				.Dxx_B					(Dxx_B_45),
				.Dxx_C					(Dxx_C_45),
				.Dxx_D					(Dxx_D_45),
				.Dxx_E					(Dxx_E_45),
				.Dxx_F					(Dxx_F_45),
				.Dxx_G					(Dxx_G_45),
				.Dxx_H					(Dxx_H_45),
				.Dyy_A					(Dyy_A_45),
				.Dyy_B					(Dyy_B_45),
				.Dyy_C					(Dyy_C_45),
				.Dyy_D					(Dyy_D_45),
				.Dyy_E					(Dyy_E_45),
				.Dyy_F					(Dyy_F_45),
				.Dyy_G					(Dyy_G_45),
				.Dyy_H					(Dyy_H_45),
				.Dxy_A					(Dxy_A_45),
				.Dxy_B					(Dxy_B_45),
				.Dxy_C					(Dxy_C_45),
				.Dxy_D					(Dxy_D_45),
				.Dxy_E					(Dxy_E_45),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_45),
				.Dxy_I					(Dxy_I_45),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_45),
				.Dxy_M					(Dxy_M_45),
				.Dxy_N					(Dxy_N_45),
				.Dxy_O					(Dxy_O_45),
				.Dxy_P					(Dxy_P_45),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_45)
		);
		
		
		/*********************************************
		*51x51hessian计算
		*常数 ： 635 ----- 0000_0000_0000_0000_0000_0010_0111_1011
		*        514 ----- 0000_0000_0000_0000_0000_0010_0000_0010
		*********************************************/
		hessian_32f #(.constanta	('d635),
		.constantb	('d514))	inst_hessian51
		(
				.Dxx_A					(Dxx_A_51),
				.Dxx_B					(Dxx_B_51),
				.Dxx_C					(Dxx_C_51),
				.Dxx_D					(Dxx_D_51),
				.Dxx_E					(Dxx_E_51),
				.Dxx_F					(Dxx_F_51),
				.Dxx_G					(Dxx_G_51),
				.Dxx_H					(Dxx_H_51),
				.Dyy_A					(Dyy_A_51),
				.Dyy_B					(Dyy_B_51),
				.Dyy_C					(Dyy_C_51),
				.Dyy_D					(Dyy_D_51),
				.Dyy_E					(Dyy_E_51),
				.Dyy_F					(Dyy_F_51),
				.Dyy_G					(Dyy_G_51),
				.Dyy_H					(Dyy_H_51),
				.Dxy_A					(Dxy_A_51),
				.Dxy_B					(Dxy_B_51),
				.Dxy_C					(Dxy_C_51),
				.Dxy_D					(Dxy_D_51),
				.Dxy_E					(Dxy_E_51),
				.Dxy_F					(Dxy_F),
				.Dxy_G					(Dxy_G),
				.Dxy_H					(Dxy_H_51),
				.Dxy_I					(Dxy_I_51),
				.Dxy_J					(Dxy_J),
				.Dxy_K					(Dxy_K),
				.Dxy_L					(Dxy_L_51),
				.Dxy_M					(Dxy_M_51),
				.Dxy_N					(Dxy_N_51),
				.Dxy_O					(Dxy_O_51),
				.Dxy_P					(Dxy_P_51),
				.din_valid				(din_valid),
				.clk					(clk),
				.rst_n					(rst_n),
				.o_d_valid				(),
				.o_d					(o_d_51)
		);
		
endmodule
