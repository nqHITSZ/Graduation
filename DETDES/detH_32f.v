`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 13:50:32
// Design Name: 
// Module Name: detH_32f
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


module 	detH_32f #(parameter constanta = 1165,
				   parameter constantb = 2595,
				   parameter MULT_IN_DATAWIDTH = 21,
			       parameter MULT_OUT_DATAWIDTH = 42,
			       parameter SUB_IN_DATAWIDTH = 48,
			       parameter DATA_WIDTH = 32)
		(
			input	wire	[MULT_IN_DATAWIDTH - 1:0] 	Dxx_d,
			input	wire	[MULT_IN_DATAWIDTH - 1:0]	Dyy_d,
			input	wire	[MULT_IN_DATAWIDTH - 1:0]	Dxy_d,
			input	wire								clk,
			input	wire								rst_n,
			input	wire								din_valid,
			//output	wire	[SUB_IN_DATAWIDTH - 1:0]	det_d_o,
			output	wire	[DATA_WIDTH - 1:0]			det_d_o,
			output	wire								det_d_o_valid
		);
		
		
		wire		[MULT_OUT_DATAWIDTH - 1:0]			o_d_DxxDyy;   //第一阶段乘法器的结果输出
		wire		[MULT_OUT_DATAWIDTH - 1:0]			o_d_DxyDxy;
		
		wire		[MULT_OUT_DATAWIDTH + 17:0]			o_d_mult_xx;  //第二阶段乘法器的结果输出
		wire		[MULT_OUT_DATAWIDTH + 17:0]			o_d_mult_xy;
		wire											ce_stage2;
		
		wire		[SUB_IN_DATAWIDTH - 1:0]			i_d_sub_xx;   //第三阶段减法器的输入
		wire		[SUB_IN_DATAWIDTH - 1:0]			i_d_sub_xy;
		wire		[SUB_IN_DATAWIDTH - 1:0]			o_S_sub;      //第三阶段减法器的结果输出
		wire											ce_sub;
		
		
		wire		[17:0]								const_xx = constanta; // (1/Sxx)^2保留18位二进制小数位再转成十进制
		wire		[17:0]								const_xy = constantb; // (0.9/Sxy)^2保留18位二进制小数位再转成十进制
		
		wire											rst;
		
		
		reg			[3:0]								delay;        //输入有效信号延时
		
		
		assign rst = ~rst_n;
		
		/*********************************************************
		*阶段1:乘法器例化，该乘法器输入数据位宽位21位，用于计算
		*Dxx * Dyy 、Dxy * Dxy。
		**********************************************************/
		mult_21b inst_mult_DxxDyy (
			  .CLK(clk),    // input wire CLK
			  .A(Dxx_d),        // input wire [20 : 0] A
			  .B(Dyy_d),        // input wire [20 : 0] B
			  .CE(din_valid),      // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .P(o_d_DxxDyy)        // output wire [41 : 0] P
		);
		
		
		mult_21b inst_mult_DxyDxy (
			  .CLK(clk),    // input wire CLK
			  .A(Dxy_d),        // input wire [20 : 0] A
			  .B(Dxy_d),        // input wire [20 : 0] B
			  .CE(din_valid),      // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .P(o_d_DxyDxy)        // output wire [41 : 0] P
		);
		
		
		/*************************************************
		*阶段2：乘法器例化，该乘法器输入为42、18位，其中
		*18位中16位当成小数，用于对Dxx、Dyy、Dxy进行归一
		*化和修正
		*************************************************/
		mult42_18 inst_mult_xxyy (
				  .CLK(clk),    // input wire CLK
				  .A(o_d_DxxDyy),        // input wire [41 : 0] A
				  .B(const_xx),        // input wire [17 : 0] B
				  .CE(ce_stage2),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .P(o_d_mult_xx)        // output wire [59 : 0] P
		);
		
		
		mult42_18 inst_mult_xyxy (
				  .CLK(clk),    // input wire CLK
				  .A(o_d_DxyDxy),        // input wire [41 : 0] A
				  .B(const_xy),        // input wire [17 : 0] B
				  .CE(ce_stage2),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .P(o_d_mult_xy)        // output wire [59 : 0] P
		);
		
		
		/******************************************************
		*第二阶段的乘法器的输出为[59:0],其中[31:0]为
		*小数位，减法器的输入则取符号位[59],整数部分[58:32],
		*小数部分[31:20] ,取12位小数
		******************************************************/
		//assign i_d_sub_xx = {o_d_mult_xx[59],o_d_mult_xx[46:0]};
		//assign i_d_sub_xy = {o_d_mult_xy[59],o_d_mult_xy[46:0]};
		
		/*******************************************************/
		assign i_d_sub_xx = {o_d_mult_xx[59],(o_d_mult_xx[59] == 1'b1)?8'hff:8'h00,o_d_mult_xx[58:20]};
		assign i_d_sub_xy = {o_d_mult_xy[59],(o_d_mult_xy[59] == 1'b1)?8'hff:8'h00,o_d_mult_xy[58:20]};
		
		/**************修改：2017-03-22***********************/
		
		/******************************************************
		*第三阶段：减法器例化，该减法器用于计算最终的响应值，
		*数据宽度为48位。
		******************************************************/
		sub_48b inst_sub (
			  .A(i_d_sub_xx),        // input wire [47 : 0] A
			  .B(i_d_sub_xy),        // input wire [47 : 0] B
			  .CLK(clk),    // input wire CLK
			  .CE(ce_sub),      // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_sub)        // output wire [47 : 0] S
		);
		
		
		/**************************************************
		*输入有效信号延时控制
		**************************************************/
		always @(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						delay <= 'd0;
					end
				else
					begin
						delay <= {delay[2:0],din_valid};
					end
			end
		
		assign ce_stage2 = delay[1];
		assign ce_sub = delay[2];
		assign det_d_o_valid = delay[3];
		//assign det_d_o = (det_d_o_valid == 1'b1)?o_S_sub:'d0;
		assign det_d_o = (det_d_o_valid == 1'b1)?{o_S_sub[47],o_S_sub[30:0]}:'d0;   //只取32位，其中小数位12位

endmodule
