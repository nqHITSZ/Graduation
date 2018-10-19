`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/9/18 21:58:15
// Design Name: 
// Module Name: rowBuf3
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


module	rowBuf3 #(parameter	REGSNUM = 'd3,
				 parameter	DATA_WIDTH = 'd32,
				 parameter IMAGE_WIDTH = 640,
				 parameter	SW_SIZE = 52)
		(
				input	wire	[DATA_WIDTH - 1:0]		din,
				input	wire							clk,
				input	wire							rst_n,
				output	wire	[DATA_WIDTH - 1:0]		dout,
				output	wire	[DATA_WIDTH - 1:0]		register_1,
				output	wire	[DATA_WIDTH - 1:0]		register_2,
				output	wire	[DATA_WIDTH - 1:0]		register_3
				
		);
		
		
	
		wire							rst;
		wire	[DATA_WIDTH - 1:0]		o_d_fifo; 

		
		

		
		regs_3  #(.DATA_WIDTH (DATA_WIDTH),
		 .REGDEPTH (REGSNUM) )		inst_regs_3
		(
			
				.clk		(clk),
				.rst		(!rst_n),
				.din		(din),
				.reg01	(register_1),
				.reg02	(register_2),
				.reg03	(register_3)
		
		);
		
		
		
		
		
		assign	rst = ~rst_n;

		
		ShiftRegisterBRAM //FIFO STYLE
		#(
		    .DATA_DEPTH(IMAGE_WIDTH-REGSNUM),
		    .DATA_WIDTH(DATA_WIDTH)
		)
		SRB_u
		(
		    .clk(clk),
		    .rst(rst),
		    .shift_in(register_3),
		    .shift_out(o_d_fifo)
		);

		
		assign dout = o_d_fifo;
		
endmodule
