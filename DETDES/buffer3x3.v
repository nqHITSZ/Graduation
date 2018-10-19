`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 14:29:22
// Design Name: 
// Module Name: buffer3x3
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


module	buffer3x3 #(parameter DATA_WIDTH = 80,
					parameter IMAGE_WIDTH = 640,
					parameter REGNUM = 3)
		(
			input	wire	[DATA_WIDTH - 1:0]	din,
			input	wire						din_valid,
			input	wire						clk,
			input	wire						rst_n,
			//output	wire						dout_valid,
			/*************************************************
			*输出格式：reg_x_y
			*************************************************/
			output	wire	[DATA_WIDTH - 1:0]	register_1_1,
			output	wire	[DATA_WIDTH - 1:0]	register_1_2,
			output	wire	[DATA_WIDTH - 1:0]	register_1_3,
			output	wire	[DATA_WIDTH - 1:0]	register_2_1,
			output	wire	[DATA_WIDTH - 1:0]	register_2_2,
			output	wire	[DATA_WIDTH - 1:0]	register_2_3,
			output	wire	[DATA_WIDTH - 1:0]	register_3_1,
			output	wire	[DATA_WIDTH - 1:0]	register_3_2,
			output	wire	[DATA_WIDTH - 1:0]	register_3_3
		);
		
		
		wire	[DATA_WIDTH - 1:0]		o_d_rowBuf_1;
		wire	[DATA_WIDTH - 1:0]		o_d_rowBuf_2;
		wire							o_valid_rowBuf_1;
		//wire							o_valid_rowBuf_2;
		wire	[DATA_WIDTH - 1:0]		register1_rowBuf_1;
		wire	[DATA_WIDTH - 1:0]		register2_rowBuf_1;
		wire	[DATA_WIDTH - 1:0]		register3_rowBuf_1;
		wire	[DATA_WIDTH - 1:0]		register1_rowBuf_2;
		wire	[DATA_WIDTH - 1:0]		register2_rowBuf_2;
		wire	[DATA_WIDTH - 1:0]		register3_rowBuf_2;
		
		/****************************************
		*第一行行缓冲模块例化
		****************************************/
		rowBuf3 #(.REGSNUM (REGNUM),
				 .DATA_WIDTH (DATA_WIDTH),
				 .IMAGE_WIDTH (IMAGE_WIDTH))	inst_rowBuf_1
				(
					.din		(din),
					.clk		(clk),
					.rst_n		(rst_n),
					
					
					.dout		(o_d_rowBuf_1),
					.register_1	(register1_rowBuf_1),
					.register_2	(register2_rowBuf_1),
					.register_3	(register3_rowBuf_1)
				);
		
		/****************************************
		*第二行行缓冲模块例化
		****************************************/
		rowBuf3 #(.REGSNUM (REGNUM),
				 .DATA_WIDTH (DATA_WIDTH),
				 .IMAGE_WIDTH (IMAGE_WIDTH))	inst_rowBuf_2
				(
					.din		(o_d_rowBuf_1),
					.clk		(clk),
					.rst_n		(rst_n),
				
					.dout		(o_d_rowBuf_2),
					.register_1	(register1_rowBuf_2),
					.register_2	(register2_rowBuf_2),
					.register_3	(register3_rowBuf_2)
				);
		

		
		
		regs_3  #(.DATA_WIDTH (DATA_WIDTH),
		 .REGDEPTH (REGNUM) )		inst_regs3
		(
			
				.clk		(clk),
				.rst		(!rst_n),
				.din		(o_d_rowBuf_2),
				.reg01	(register_1_3),
				.reg02	(register_2_3),
				.reg03	(register_3_3)
		
		);
		
		assign	register_1_1 = register1_rowBuf_1;
		assign	register_2_1 = register2_rowBuf_1;
		assign	register_3_1 = register3_rowBuf_1;
		assign	register_1_2 = register1_rowBuf_2;
		assign	register_2_2 = register2_rowBuf_2;
		assign	register_3_2 = register3_rowBuf_2;  
		
		
endmodule
