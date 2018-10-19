`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: NQ
// 
// Create Date: 2017/9/18 22:07:07
// Design Name: 
// Module Name: non_max_suppersion
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


module non_max_suppersion #(parameter DATA_WIDTH = 32,
							parameter IMAGE_WIDTH = 640,
							parameter IMAGE_HEIGHT = 480,
							parameter SW_SIZE = 52,
							parameter HALF_SW_SIZE = 26)
		(
			input	wire						clk,
			input	wire						rst_n,
			input	wire						din_valid,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_09,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_15,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_21,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_27,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_33,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_39,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_45,
			input	wire	[DATA_WIDTH - 1:0]	i_d_scale_51,
			
			input	wire	[DATA_WIDTH - 1:0]	constant,
			output	wire	[DATA_WIDTH - 1:0]	max_response15,
			output	wire	[DATA_WIDTH	- 1:0]	max_response21,
			output	wire	[DATA_WIDTH - 1:0]	max_response27,
			output	wire	[DATA_WIDTH - 1:0]	max_response33,
			output	wire	[DATA_WIDTH - 1:0]	max_response39,
			output	wire	[DATA_WIDTH	- 1:0]	max_response45,
			output	wire						max_flag_scale_15,
			output	wire						max_flag_scale_21,
			output	wire						max_flag_scale_27,
			output	wire						max_flag_scale_33,
			output	wire						max_flag_scale_39,
			output	wire						max_flag_scale_45,
			output	wire						dout_valid,
			output  wire                       	coor_sync_flag,
			output	wire	[9:0]				x,
			output	wire	[9:0]				y
			
			
		);
		
		genvar	i;
		
		reg		signed	[DATA_WIDTH - 1:0]	constant_reg;
		//reg				[9:0]				x_reg;
		//reg				[9:0]				y_reg;
		
		wire			[DATA_WIDTH - 1:0]	i_d[8:1];
		wire								o_valid_buf[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_1_1[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_1_2[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_1_3[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_2_1[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_2_2[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_2_3[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_3_1[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_3_2[8:1];
		wire			[DATA_WIDTH - 1:0]	o_buf_3_3[8:1];
		wire	signed	[DATA_WIDTH - 1:0]	o_compare_response[6:1];
		wire								local_max_flag[6:1];
        wire    							o_valid_compare[6:1];
		wire								compare_flag;
		wire			[9:0]				center_x;
		wire			[9:0]				center_y;
		
		
		wire window_valid;
		localparam maxValidLatency = IMAGE_WIDTH+2;	
		integer j;
		
		reg [maxValidLatency-1:0] valid_delay;
		always @(posedge clk) begin
		    for(j=0; j<maxValidLatency-1; j=j+1)
		        valid_delay[j+1] <= valid_delay[j];
		    valid_delay[0] <= din_valid;
		end
		assign window_valid = valid_delay[maxValidLatency-1];
		
		
		assign	i_d[1] = i_d_scale_09;
		assign	i_d[2] = i_d_scale_15;
		assign	i_d[3] = i_d_scale_21;
		assign	i_d[4] = i_d_scale_27;
		assign	i_d[5] = i_d_scale_33;
		assign	i_d[6] = i_d_scale_39;
		assign	i_d[7] = i_d_scale_45;
		assign  i_d[8] = i_d_scale_51;
		
		/****************************************
		*例化产生8个缓冲模块
		****************************************/
		generate
			for(i = 1; i < 9;i = i + 1)
				begin : inst_buffer3x3
					buffer3x3 #(.DATA_WIDTH (DATA_WIDTH),
								.IMAGE_WIDTH (IMAGE_WIDTH))  inst_buffer3x3
						(
							.din			(i_d[i]),
							.din_valid		(din_valid),
							.clk			(clk),
							.rst_n			(rst_n),
							//.dout_valid		(o_valid_buf[i]),
							.register_1_1	(o_buf_1_1[i]),
							.register_1_2	(o_buf_1_2[i]),
							.register_1_3	(o_buf_1_3[i]),
							.register_2_1	(o_buf_2_1[i]),
							.register_2_2	(o_buf_2_2[i]),
							.register_2_3	(o_buf_2_3[i]),
							.register_3_1	(o_buf_3_1[i]),
							.register_3_2	(o_buf_3_2[i]),
							.register_3_3	(o_buf_3_3[i])
						);
				end
		endgenerate
		
		
		
		/********************************************
		*例化产生6个数据对比模块
		********************************************/
		generate	
			for(i = 2;i < 8;i = i + 1)
				begin : inst_compare
					compare #(.DATA_WIDTH (DATA_WIDTH) )  inst_compare
						(
							.clk				(clk),
							.rst_n				(rst_n),
							.din_valid			(window_valid),
							.top_register_11	(o_buf_1_1[i + 1]),
							.top_register_12	(o_buf_1_2[i + 1]),
							.top_register_13	(o_buf_1_3[i + 1]),
							.top_register_21	(o_buf_2_1[i + 1]),
							.top_register_22	(o_buf_2_2[i + 1]),
							.top_register_23	(o_buf_2_3[i + 1]),
							.top_register_31	(o_buf_3_1[i + 1]),
							.top_register_32	(o_buf_3_2[i + 1]),
							.top_register_33	(o_buf_3_3[i + 1]),
							.mid_register_11	(o_buf_1_1[i]),
							.mid_register_12	(o_buf_1_2[i]),
							.mid_register_13	(o_buf_1_3[i]),
							.mid_register_21	(o_buf_2_1[i]),
							.mid_register_22	(o_buf_2_2[i]),
							.mid_register_23	(o_buf_2_3[i]),
							.mid_register_31	(o_buf_3_1[i]),
							.mid_register_32	(o_buf_3_2[i]),
							.mid_register_33	(o_buf_3_3[i]),
							.low_register_11	(o_buf_1_1[i - 1]),
							.low_register_12	(o_buf_1_2[i - 1]),
							.low_register_13	(o_buf_1_3[i - 1]),
							.low_register_21	(o_buf_2_1[i - 1]),
							.low_register_22	(o_buf_2_2[i - 1]),
							.low_register_23	(o_buf_2_3[i - 1]),
							.low_register_31	(o_buf_3_1[i - 1]),
							.low_register_32	(o_buf_3_2[i - 1]),
							.low_register_33	(o_buf_3_3[i - 1]),
							.o_center_response	(o_compare_response[i - 1]),
							.max_flag			(local_max_flag[i - 1]),
							.dout_valid			(o_valid_compare[i - 1])
						);
				end
		endgenerate
		

		
		CoordinateGen#
		(
		    .ROW(IMAGE_HEIGHT),
		    .COL(IMAGE_WIDTH)
		)
		IBF_uu
		(
		    .clk(clk),
		    .rst(!rst_n),
		    .din_valid(dout_valid),
		    .col_cnt(center_x), 
		    .row_cnt(center_y)
		 );
		
		
		always @(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						constant_reg <= 80'h640000;   
					end
				else
					begin
						constant_reg <= constant;
					end
			end

		
		assign	compare_flag = (center_x > 26 && center_x < (IMAGE_WIDTH - HALF_SW_SIZE ) &&
								center_y > 26 && center_y < (IMAGE_HEIGHT - HALF_SW_SIZE ))?1'b1:1'b0;
		
		assign	max_flag_scale_15 = ((local_max_flag[1] == 1'b1) && (compare_flag == 1'b1) &&
									 (o_compare_response[1] >= constant_reg))?1'b1:1'b0;
		assign  max_flag_scale_21 = ((local_max_flag[2] == 1'b1) && (compare_flag == 1'b1) &&
									 (o_compare_response[2] >= constant_reg))?1'b1:1'b0;
		assign	max_flag_scale_27 = ((local_max_flag[3] == 1'b1) && (compare_flag == 1'b1) &&
									 (o_compare_response[3] >= constant_reg))?1'b1:1'b0;
		assign  max_flag_scale_33 = ((local_max_flag[4] == 1'b1) && (compare_flag == 1'b1) &&
									 (o_compare_response[4] >= constant_reg))?1'b1:1'b0;
		assign	max_flag_scale_39 = ((local_max_flag[5] == 1'b1) && (compare_flag == 1'b1) &&
									 (o_compare_response[5] >= constant_reg))?1'b1:1'b0;
		assign  max_flag_scale_45 = ((local_max_flag[6] == 1'b1) && (compare_flag == 1'b1) &&
									 (o_compare_response[6] >= constant_reg))?1'b1:1'b0;
									 
		assign	max_response15 = o_compare_response[1];
		assign	max_response21 = o_compare_response[2];
		assign	max_response27 = o_compare_response[3];
		assign	max_response33 = o_compare_response[4];
		assign	max_response39 = o_compare_response[5];
		assign	max_response45 = o_compare_response[6];
		
		assign	dout_valid = o_valid_compare[1];
		assign x = center_x;
        assign y = center_y;
	
		
endmodule
