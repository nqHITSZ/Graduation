`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 14:33:24
// Design Name: 
// Module Name: compare
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


module 	compare #(parameter	DATA_WIDTH = 32)
		(
			input										clk,
			input										rst_n,
			input										din_valid,
			/************************************************* 
			*数据输入，命名规则top_register_xx、mid_register_xx
			*low_register_xx
			*************************************************/
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_11,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_12,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_13,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_21,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_22,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_23,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_31,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_32,
			input	wire	signed	[DATA_WIDTH - 1:0]	top_register_33,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_11,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_12,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_13,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_21,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_22,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_23,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_31,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_32,
			input	wire	signed	[DATA_WIDTH - 1:0]	mid_register_33,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_11,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_12,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_13,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_21,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_22,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_23,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_31,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_32,
			input	wire	signed	[DATA_WIDTH - 1:0]	low_register_33,
			
			output	reg		signed	[DATA_WIDTH - 1:0]	o_center_response,
			output	reg									max_flag,    //极大值标志
			output	reg									dout_valid
		);
		
		
		/***************************************************
		*对比中心点mid_register_22与周围8个数据、上下两层18
		*个数据
		***************************************************/
		always @(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						o_center_response <= 'd0;
						max_flag <= 1'b0;
					end
				else if(din_valid == 1'b1)
					begin
						if((mid_register_22 >= top_register_11) &&
							(mid_register_22 >= top_register_12) &&
							(mid_register_22 >= top_register_13) &&
							(mid_register_22 >= top_register_21) &&
							(mid_register_22 >= top_register_22) &&
							(mid_register_22 >= top_register_23) &&
							(mid_register_22 >= top_register_31) &&
							(mid_register_22 >= top_register_32) &&
							(mid_register_22 >= top_register_33) &&
							(mid_register_22 >= mid_register_11) &&
							(mid_register_22 >= mid_register_12) &&
							(mid_register_22 >= mid_register_13) &&
							(mid_register_22 >= mid_register_21) &&
							(mid_register_22 >= mid_register_23) &&
							(mid_register_22 >= mid_register_31) &&
							(mid_register_22 >= mid_register_32) &&
							(mid_register_22 >= mid_register_33) &&
							(mid_register_22 >= low_register_11) &&
							(mid_register_22 >= low_register_12) &&
							(mid_register_22 >= low_register_13) &&
							(mid_register_22 >= low_register_21) &&
							(mid_register_22 >= low_register_22) &&
							(mid_register_22 >= low_register_23) &&
							(mid_register_22 >= low_register_31) &&
							(mid_register_22 >= low_register_32) &&
							(mid_register_22 >= low_register_33) )
						begin
							o_center_response <= mid_register_22;
							max_flag <= 1'b1;
						end
						else
						begin
							o_center_response <= mid_register_22;
							max_flag <= 1'b0;
						end
					end
				else
					begin
						o_center_response <= mid_register_22;
						max_flag <= 1'b0;
					end
			end
	
		/***************************************************
		*输出有效控制，输入有效延时一个周期
		***************************************************/
		always@(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						dout_valid <= 1'b0;
					end
				else
					begin
						dout_valid <= din_valid;
					end
			end
	
	
endmodule
