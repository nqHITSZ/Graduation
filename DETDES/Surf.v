`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/19 09:57:02
// Design Name: 
// Module Name: Surf
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



module Surf #(parameter DATA_WIDTH = 8,
parameter INTEGRAL_DATA_WIDTH = 28,
parameter COL = 640,
parameter ROW = 480,
parameter SW_SIZE = 52,
parameter DATA_WIDTH_4WORDS = 32)
(

input wire [DATA_WIDTH - 1:0] din,
input wire din_valid,
input wire clk,
input wire rst,

input 	wire 	[DATA_WIDTH_4WORDS - 1:0]		constant,

output wire dout_valid,


output	wire max_response15,
output	wire max_response21,
output	wire max_response27,
output	wire max_response33,
output	wire max_response39,
output	wire max_response45,


output wire [DATA_WIDTH_4WORDS - 1:0] o_response15,
output wire [DATA_WIDTH_4WORDS - 1:0] o_response21,
output wire [DATA_WIDTH_4WORDS - 1:0] o_response27,
output wire [DATA_WIDTH_4WORDS - 1:0] o_response33,
output wire [DATA_WIDTH_4WORDS - 1:0] o_response39,
output wire [DATA_WIDTH_4WORDS - 1:0] o_response45,


output	wire [9:0] center_x,
output	wire [9:0] center_y,

output  wire coor_sync_flag,
output wire o_valid_hessian

  );
  
wire [DATA_WIDTH_4WORDS - 1:0] o_response09;
wire [DATA_WIDTH_4WORDS - 1:0] o_response51;
  
wire	[DATA_WIDTH_4WORDS - 1:0]		 o_d_15;
wire    [DATA_WIDTH_4WORDS - 1:0]        o_d_21;
wire    [DATA_WIDTH_4WORDS - 1:0]        o_d_27;
wire    [DATA_WIDTH_4WORDS - 1:0]        o_d_33;
wire    [DATA_WIDTH_4WORDS - 1:0]        o_d_39;
wire    [DATA_WIDTH_4WORDS - 1:0]        o_d_45;
  
wire [INTEGRAL_DATA_WIDTH - 1:0]  o_d_integral;
wire o_d_integral_valid;

wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_10_01;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_43_01;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_12_04;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_41_04;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_14_07;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_39_07;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_09_09;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_09;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_09;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_44_09;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_01_10;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_16_10;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_18_10;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_35_10;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_37_10;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_52_10;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_11_11;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_11;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_11;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_42_11;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_04_12;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_12;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_12;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_49_12;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_13_13;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_18_13;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_13;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_13;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_35_13;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_40_13;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_07_14;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_20_14;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_33_14;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_46_14;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_15_15;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_15;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_15;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_38_15;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_10_16;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_20_16;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_21_16;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_32_16;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_33_16;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_43_16;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_17_17;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_17;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_17;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_36_17;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_10_18;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_13_18;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_22_18;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_31_18;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_40_18;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_43_18;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_12_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_22_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_31_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_41_19;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_14_20;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_16_20;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_23_20;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_30_20;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_37_20;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_39_20;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_16_21;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_21_21;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_21;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_21;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_32_21;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_37_21;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_18_22;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_22;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_24_22;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_29_22;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_22;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_35_22;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_20_23;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_23_23;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_23;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_23;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_30_23;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_33_23;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_22_24;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_25_24;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_28_24;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_31_24;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_24_25;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_29_25;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_09_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_11_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_13_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_15_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_17_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_21_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_23_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_30_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_32_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_36_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_38_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_40_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_42_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_44_26;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_09_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_11_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_13_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_15_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_17_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_21_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_23_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_30_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_32_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_36_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_38_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_40_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_42_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_44_27;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_24_28;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_29_28;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_22_29;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_25_29;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_28_29;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_31_29;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_20_30;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_23_30;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_30;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_30;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_30_30;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_33_30;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_18_31;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_31;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_24_31;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_29_31;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_31;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_35_31;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_16_32;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_21_32;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_32;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_32;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_32_32;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_37_32;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_14_33;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_16_33;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_23_33;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_30_33;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_37_33;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_39_33;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_12_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_22_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_31_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_41_34;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_10_35;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_13_35;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_22_35;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_31_35;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_40_35;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_43_35;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_17_36;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_36;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_36;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_36_36;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_10_37;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_20_37;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_21_37;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_32_37;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_33_37;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_43_37;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_15_38;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_38;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_38;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_38_38;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_07_39;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_20_39;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_33_39;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_46_39;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_13_40;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_18_40;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_40;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_40;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_35_40;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_40_40;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_04_41;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_19_41;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_34_41;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_49_41;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_11_42;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_42;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_42;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_42_42;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_01_43;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_16_43;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_18_43;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_35_43;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_37_43;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_52_43;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_09_44;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_26_44;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_27_44;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_44_44;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_14_46;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_39_46;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_12_49;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_41_49;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_10_52;
wire [INTEGRAL_DATA_WIDTH - 1:0]  reg_43_52;
  
  

  
  
 
  
wire o_d_buf_valid;
reg i_d_hessian_valid;

reg [9:0] data_cnt;
//wire [9:0] row_cnt_IW, col_cnt_IW, row_cnt_WH, col_cnt_WH;

ImgIntergral #
(
  .DIN_DATA_WIDTH(8),
  .DOUT_DATA_WIDTH(28),
  .ROW(ROW),
  .COL(COL)
)
II_u
(
  .clk(clk),
  .rst(rst),
  .din_valid(din_valid),
  .din(din), // input wire [7 : 0] din
  .dout(o_d_integral), // output wire [27 : 0] dout
  .dout_valid(o_d_integral_valid) // output wire dout_valid
//        .o_row_cnt(row_cnt_IW),
//        .o_col_cnt(col_cnt_IW)
);



window52 #
(
.DATA_WIDTH(28),
.IMAGE_WIDTH(COL),
.REGSNUM(52)
)
W52_u
(
.clk(clk),
.rst(rst),
.din(o_d_integral),
.din_valid(o_d_integral_valid),
.dout_valid(o_d_buf_valid),
//.i_row_cnt(row_cnt_IW),
//.i_col_cnt(col_cnt_IW),
//.o_row_cnt(row_cnt_WH),
//.o_col_cnt(col_cnt_WH),
.reg_10_01(reg_10_01),    // output wire [27 : 0] reg_10_01
.reg_43_01(reg_43_01),    // output wire [27 : 0] reg_43_01
.reg_12_04(reg_12_04),    // output wire [27 : 0] reg_12_04
.reg_41_04(reg_41_04),    // output wire [27 : 0] reg_41_04
.reg_14_07(reg_14_07),    // output wire [27 : 0] reg_14_07
.reg_39_07(reg_39_07),    // output wire [27 : 0] reg_39_07
.reg_09_09(reg_09_09),    // output wire [27 : 0] reg_09_09
.reg_26_09(reg_26_09),    // output wire [27 : 0] reg_26_09
.reg_27_09(reg_27_09),    // output wire [27 : 0] reg_27_09
.reg_44_09(reg_44_09),    // output wire [27 : 0] reg_44_09
.reg_01_10(reg_01_10),    // output wire [27 : 0] reg_01_10
.reg_16_10(reg_16_10),    // output wire [27 : 0] reg_16_10
.reg_18_10(reg_18_10),    // output wire [27 : 0] reg_18_10
.reg_35_10(reg_35_10),    // output wire [27 : 0] reg_35_10
.reg_37_10(reg_37_10),    // output wire [27 : 0] reg_37_10
.reg_52_10(reg_52_10),    // output wire [27 : 0] reg_52_10
.reg_11_11(reg_11_11),    // output wire [27 : 0] reg_11_11
.reg_26_11(reg_26_11),    // output wire [27 : 0] reg_26_11
.reg_27_11(reg_27_11),    // output wire [27 : 0] reg_27_11
.reg_42_11(reg_42_11),    // output wire [27 : 0] reg_42_11
.reg_04_12(reg_04_12),    // output wire [27 : 0] reg_04_12
.reg_19_12(reg_19_12),    // output wire [27 : 0] reg_19_12
.reg_34_12(reg_34_12),    // output wire [27 : 0] reg_34_12
.reg_49_12(reg_49_12),    // output wire [27 : 0] reg_49_12
.reg_13_13(reg_13_13),    // output wire [27 : 0] reg_13_13
.reg_18_13(reg_18_13),    // output wire [27 : 0] reg_18_13
.reg_26_13(reg_26_13),    // output wire [27 : 0] reg_26_13
.reg_27_13(reg_27_13),    // output wire [27 : 0] reg_27_13
.reg_35_13(reg_35_13),    // output wire [27 : 0] reg_35_13
.reg_40_13(reg_40_13),    // output wire [27 : 0] reg_40_13
.reg_07_14(reg_07_14),    // output wire [27 : 0] reg_07_14
.reg_20_14(reg_20_14),    // output wire [27 : 0] reg_20_14
.reg_33_14(reg_33_14),    // output wire [27 : 0] reg_33_14
.reg_46_14(reg_46_14),    // output wire [27 : 0] reg_46_14
.reg_15_15(reg_15_15),    // output wire [27 : 0] reg_15_15
.reg_26_15(reg_26_15),    // output wire [27 : 0] reg_26_15
.reg_27_15(reg_27_15),    // output wire [27 : 0] reg_27_15
.reg_38_15(reg_38_15),    // output wire [27 : 0] reg_38_15
.reg_10_16(reg_10_16),    // output wire [27 : 0] reg_10_16
.reg_20_16(reg_20_16),    // output wire [27 : 0] reg_20_16
.reg_21_16(reg_21_16),    // output wire [27 : 0] reg_21_16
.reg_32_16(reg_32_16),    // output wire [27 : 0] reg_32_16
.reg_33_16(reg_33_16),    // output wire [27 : 0] reg_33_16
.reg_43_16(reg_43_16),    // output wire [27 : 0] reg_43_16
.reg_17_17(reg_17_17),    // output wire [27 : 0] reg_17_17
.reg_26_17(reg_26_17),    // output wire [27 : 0] reg_26_17
.reg_27_17(reg_27_17),    // output wire [27 : 0] reg_27_17
.reg_36_17(reg_36_17),    // output wire [27 : 0] reg_36_17
.reg_10_18(reg_10_18),    // output wire [27 : 0] reg_10_18
.reg_13_18(reg_13_18),    // output wire [27 : 0] reg_13_18
.reg_22_18(reg_22_18),    // output wire [27 : 0] reg_22_18
.reg_31_18(reg_31_18),    // output wire [27 : 0] reg_31_18
.reg_40_18(reg_40_18),    // output wire [27 : 0] reg_40_18
.reg_43_18(reg_43_18),    // output wire [27 : 0] reg_43_18
.reg_12_19(reg_12_19),    // output wire [27 : 0] reg_12_19
.reg_19_19(reg_19_19),    // output wire [27 : 0] reg_19_19
.reg_22_19(reg_22_19),    // output wire [27 : 0] reg_22_19
.reg_26_19(reg_26_19),    // output wire [27 : 0] reg_26_19
.reg_27_19(reg_27_19),    // output wire [27 : 0] reg_27_19
.reg_31_19(reg_31_19),    // output wire [27 : 0] reg_31_19
.reg_34_19(reg_34_19),    // output wire [27 : 0] reg_34_19
.reg_41_19(reg_41_19),    // output wire [27 : 0] reg_41_19
.reg_14_20(reg_14_20),    // output wire [27 : 0] reg_14_20
.reg_16_20(reg_16_20),    // output wire [27 : 0] reg_16_20
.reg_23_20(reg_23_20),    // output wire [27 : 0] reg_23_20
.reg_30_20(reg_30_20),    // output wire [27 : 0] reg_30_20
.reg_37_20(reg_37_20),    // output wire [27 : 0] reg_37_20
.reg_39_20(reg_39_20),    // output wire [27 : 0] reg_39_20
.reg_16_21(reg_16_21),    // output wire [27 : 0] reg_16_21
.reg_21_21(reg_21_21),    // output wire [27 : 0] reg_21_21
.reg_26_21(reg_26_21),    // output wire [27 : 0] reg_26_21
.reg_27_21(reg_27_21),    // output wire [27 : 0] reg_27_21
.reg_32_21(reg_32_21),    // output wire [27 : 0] reg_32_21
.reg_37_21(reg_37_21),    // output wire [27 : 0] reg_37_21
.reg_18_22(reg_18_22),    // output wire [27 : 0] reg_18_22
.reg_19_22(reg_19_22),    // output wire [27 : 0] reg_19_22
.reg_24_22(reg_24_22),    // output wire [27 : 0] reg_24_22
.reg_29_22(reg_29_22),    // output wire [27 : 0] reg_29_22
.reg_34_22(reg_34_22),    // output wire [27 : 0] reg_34_22
.reg_35_22(reg_35_22),    // output wire [27 : 0] reg_35_22
.reg_20_23(reg_20_23),    // output wire [27 : 0] reg_20_23
.reg_23_23(reg_23_23),    // output wire [27 : 0] reg_23_23
.reg_26_23(reg_26_23),    // output wire [27 : 0] reg_26_23
.reg_27_23(reg_27_23),    // output wire [27 : 0] reg_27_23
.reg_30_23(reg_30_23),    // output wire [27 : 0] reg_30_23
.reg_33_23(reg_33_23),    // output wire [27 : 0] reg_33_23
.reg_22_24(reg_22_24),    // output wire [27 : 0] reg_22_24
.reg_25_24(reg_25_24),    // output wire [27 : 0] reg_25_24
.reg_28_24(reg_28_24),    // output wire [27 : 0] reg_28_24
.reg_31_24(reg_31_24),    // output wire [27 : 0] reg_31_24
.reg_24_25(reg_24_25),    // output wire [27 : 0] reg_24_25
.reg_29_25(reg_29_25),    // output wire [27 : 0] reg_29_25
.reg_09_26(reg_09_26),    // output wire [27 : 0] reg_09_26
.reg_11_26(reg_11_26),    // output wire [27 : 0] reg_11_26
.reg_13_26(reg_13_26),    // output wire [27 : 0] reg_13_26
.reg_15_26(reg_15_26),    // output wire [27 : 0] reg_15_26
.reg_17_26(reg_17_26),    // output wire [27 : 0] reg_17_26
.reg_19_26(reg_19_26),    // output wire [27 : 0] reg_19_26
.reg_21_26(reg_21_26),    // output wire [27 : 0] reg_21_26
.reg_23_26(reg_23_26),    // output wire [27 : 0] reg_23_26
.reg_26_26(reg_26_26),    // output wire [27 : 0] reg_26_26
.reg_27_26(reg_27_26),    // output wire [27 : 0] reg_27_26
.reg_30_26(reg_30_26),    // output wire [27 : 0] reg_30_26
.reg_32_26(reg_32_26),    // output wire [27 : 0] reg_32_26
.reg_34_26(reg_34_26),    // output wire [27 : 0] reg_34_26
.reg_36_26(reg_36_26),    // output wire [27 : 0] reg_36_26
.reg_38_26(reg_38_26),    // output wire [27 : 0] reg_38_26
.reg_40_26(reg_40_26),    // output wire [27 : 0] reg_40_26
.reg_42_26(reg_42_26),    // output wire [27 : 0] reg_42_26
.reg_44_26(reg_44_26),    // output wire [27 : 0] reg_44_26
.reg_09_27(reg_09_27),    // output wire [27 : 0] reg_09_27
.reg_11_27(reg_11_27),    // output wire [27 : 0] reg_11_27
.reg_13_27(reg_13_27),    // output wire [27 : 0] reg_13_27
.reg_15_27(reg_15_27),    // output wire [27 : 0] reg_15_27
.reg_17_27(reg_17_27),    // output wire [27 : 0] reg_17_27
.reg_19_27(reg_19_27),    // output wire [27 : 0] reg_19_27
.reg_21_27(reg_21_27),    // output wire [27 : 0] reg_21_27
.reg_23_27(reg_23_27),    // output wire [27 : 0] reg_23_27
.reg_26_27(reg_26_27),    // output wire [27 : 0] reg_26_27
.reg_27_27(reg_27_27),    // output wire [27 : 0] reg_27_27
.reg_30_27(reg_30_27),    // output wire [27 : 0] reg_30_27
.reg_32_27(reg_32_27),    // output wire [27 : 0] reg_32_27
.reg_34_27(reg_34_27),    // output wire [27 : 0] reg_34_27
.reg_36_27(reg_36_27),    // output wire [27 : 0] reg_36_27
.reg_38_27(reg_38_27),    // output wire [27 : 0] reg_38_27
.reg_40_27(reg_40_27),    // output wire [27 : 0] reg_40_27
.reg_42_27(reg_42_27),    // output wire [27 : 0] reg_42_27
.reg_44_27(reg_44_27),    // output wire [27 : 0] reg_44_27
.reg_24_28(reg_24_28),    // output wire [27 : 0] reg_24_28
.reg_29_28(reg_29_28),    // output wire [27 : 0] reg_29_28
.reg_22_29(reg_22_29),    // output wire [27 : 0] reg_22_29
.reg_25_29(reg_25_29),    // output wire [27 : 0] reg_25_29
.reg_28_29(reg_28_29),    // output wire [27 : 0] reg_28_29
.reg_31_29(reg_31_29),    // output wire [27 : 0] reg_31_29
.reg_20_30(reg_20_30),    // output wire [27 : 0] reg_20_30
.reg_23_30(reg_23_30),    // output wire [27 : 0] reg_23_30
.reg_26_30(reg_26_30),    // output wire [27 : 0] reg_26_30
.reg_27_30(reg_27_30),    // output wire [27 : 0] reg_27_30
.reg_30_30(reg_30_30),    // output wire [27 : 0] reg_30_30
.reg_33_30(reg_33_30),    // output wire [27 : 0] reg_33_30
.reg_18_31(reg_18_31),    // output wire [27 : 0] reg_18_31
.reg_19_31(reg_19_31),    // output wire [27 : 0] reg_19_31
.reg_24_31(reg_24_31),    // output wire [27 : 0] reg_24_31
.reg_29_31(reg_29_31),    // output wire [27 : 0] reg_29_31
.reg_34_31(reg_34_31),    // output wire [27 : 0] reg_34_31
.reg_35_31(reg_35_31),    // output wire [27 : 0] reg_35_31
.reg_16_32(reg_16_32),    // output wire [27 : 0] reg_16_32
.reg_21_32(reg_21_32),    // output wire [27 : 0] reg_21_32
.reg_26_32(reg_26_32),    // output wire [27 : 0] reg_26_32
.reg_27_32(reg_27_32),    // output wire [27 : 0] reg_27_32
.reg_32_32(reg_32_32),    // output wire [27 : 0] reg_32_32
.reg_37_32(reg_37_32),    // output wire [27 : 0] reg_37_32
.reg_14_33(reg_14_33),    // output wire [27 : 0] reg_14_33
.reg_16_33(reg_16_33),    // output wire [27 : 0] reg_16_33
.reg_23_33(reg_23_33),    // output wire [27 : 0] reg_23_33
.reg_30_33(reg_30_33),    // output wire [27 : 0] reg_30_33
.reg_37_33(reg_37_33),    // output wire [27 : 0] reg_37_33
.reg_39_33(reg_39_33),    // output wire [27 : 0] reg_39_33
.reg_12_34(reg_12_34),    // output wire [27 : 0] reg_12_34
.reg_19_34(reg_19_34),    // output wire [27 : 0] reg_19_34
.reg_22_34(reg_22_34),    // output wire [27 : 0] reg_22_34
.reg_26_34(reg_26_34),    // output wire [27 : 0] reg_26_34
.reg_27_34(reg_27_34),    // output wire [27 : 0] reg_27_34
.reg_31_34(reg_31_34),    // output wire [27 : 0] reg_31_34
.reg_34_34(reg_34_34),    // output wire [27 : 0] reg_34_34
.reg_41_34(reg_41_34),    // output wire [27 : 0] reg_41_34
.reg_10_35(reg_10_35),    // output wire [27 : 0] reg_10_35
.reg_13_35(reg_13_35),    // output wire [27 : 0] reg_13_35
.reg_22_35(reg_22_35),    // output wire [27 : 0] reg_22_35
.reg_31_35(reg_31_35),    // output wire [27 : 0] reg_31_35
.reg_40_35(reg_40_35),    // output wire [27 : 0] reg_40_35
.reg_43_35(reg_43_35),    // output wire [27 : 0] reg_43_35
.reg_17_36(reg_17_36),    // output wire [27 : 0] reg_17_36
.reg_26_36(reg_26_36),    // output wire [27 : 0] reg_26_36
.reg_27_36(reg_27_36),    // output wire [27 : 0] reg_27_36
.reg_36_36(reg_36_36),    // output wire [27 : 0] reg_36_36
.reg_10_37(reg_10_37),    // output wire [27 : 0] reg_10_37
.reg_20_37(reg_20_37),    // output wire [27 : 0] reg_20_37
.reg_21_37(reg_21_37),    // output wire [27 : 0] reg_21_37
.reg_32_37(reg_32_37),    // output wire [27 : 0] reg_32_37
.reg_33_37(reg_33_37),    // output wire [27 : 0] reg_33_37
.reg_43_37(reg_43_37),    // output wire [27 : 0] reg_43_37
.reg_15_38(reg_15_38),    // output wire [27 : 0] reg_15_38
.reg_26_38(reg_26_38),    // output wire [27 : 0] reg_26_38
.reg_27_38(reg_27_38),    // output wire [27 : 0] reg_27_38
.reg_38_38(reg_38_38),    // output wire [27 : 0] reg_38_38
.reg_07_39(reg_07_39),    // output wire [27 : 0] reg_07_39
.reg_20_39(reg_20_39),    // output wire [27 : 0] reg_20_39
.reg_33_39(reg_33_39),    // output wire [27 : 0] reg_33_39
.reg_46_39(reg_46_39),    // output wire [27 : 0] reg_46_39
.reg_13_40(reg_13_40),    // output wire [27 : 0] reg_13_40
.reg_18_40(reg_18_40),    // output wire [27 : 0] reg_18_40
.reg_26_40(reg_26_40),    // output wire [27 : 0] reg_26_40
.reg_27_40(reg_27_40),    // output wire [27 : 0] reg_27_40
.reg_35_40(reg_35_40),    // output wire [27 : 0] reg_35_40
.reg_40_40(reg_40_40),    // output wire [27 : 0] reg_40_40
.reg_04_41(reg_04_41),    // output wire [27 : 0] reg_04_41
.reg_19_41(reg_19_41),    // output wire [27 : 0] reg_19_41
.reg_34_41(reg_34_41),    // output wire [27 : 0] reg_34_41
.reg_49_41(reg_49_41),    // output wire [27 : 0] reg_49_41
.reg_11_42(reg_11_42),    // output wire [27 : 0] reg_11_42
.reg_26_42(reg_26_42),    // output wire [27 : 0] reg_26_42
.reg_27_42(reg_27_42),    // output wire [27 : 0] reg_27_42
.reg_42_42(reg_42_42),    // output wire [27 : 0] reg_42_42
.reg_01_43(reg_01_43),    // output wire [27 : 0] reg_01_43
.reg_16_43(reg_16_43),    // output wire [27 : 0] reg_16_43
.reg_18_43(reg_18_43),    // output wire [27 : 0] reg_18_43
.reg_35_43(reg_35_43),    // output wire [27 : 0] reg_35_43
.reg_37_43(reg_37_43),    // output wire [27 : 0] reg_37_43
.reg_52_43(reg_52_43),    // output wire [27 : 0] reg_52_43
.reg_09_44(reg_09_44),    // output wire [27 : 0] reg_09_44
.reg_26_44(reg_26_44),    // output wire [27 : 0] reg_26_44
.reg_27_44(reg_27_44),    // output wire [27 : 0] reg_27_44
.reg_44_44(reg_44_44),    // output wire [27 : 0] reg_44_44
.reg_14_46(reg_14_46),    // output wire [27 : 0] reg_14_46
.reg_39_46(reg_39_46),    // output wire [27 : 0] reg_39_46
.reg_12_49(reg_12_49),    // output wire [27 : 0] reg_12_49
.reg_41_49(reg_41_49),    // output wire [27 : 0] reg_41_49
.reg_10_52(reg_10_52),    // output wire [27 : 0] reg_10_52
.reg_43_52(reg_43_52)    // output wire [27 : 0] reg_43_52
);
  
  


hessian8Scales inst_hessian (
.rst_n(!rst),          // input wire rst_n
.clk(clk),            // input wire clk
.din_valid(o_d_buf_valid),  // input wire din_valid
//.i_row_cnt(row_cnt_WH),
//.i_col_cnt(col_cnt_WH),
//.o_row_cnt(),
//.o_col_cnt(),
.Dxy_F(reg_27_27),          // input wire [27 : 0] Dxy_F
.Dxy_G(reg_26_27),          // input wire [27 : 0] Dxy_G
.Dxy_J(reg_27_26),          // input wire [27: 0] Dxy_J
.Dxy_K(reg_26_26),          // input wire [27 : 0] Dxy_K
.Dxx_A_09(reg_31_29),    // input wire [27 : 0] Dxx_A_09
.Dxx_B_09(reg_28_29),    // input wire [27 : 0] Dxx_B_09
.Dxx_C_09(reg_25_29),    // input wire [27 : 0] Dxx_C_09
.Dxx_D_09(reg_22_29),    // input wire [27 : 0] Dxx_D_09
.Dxx_E_09(reg_22_24),    // input wire [27 : 0] Dxx_E_09
.Dxx_F_09(reg_25_24),    // input wire [27 : 0] Dxx_F_09
.Dxx_G_09(reg_28_24),    // input wire [27 : 0] Dxx_G_09
.Dxx_H_09(reg_31_24),    // input wire [27 : 0] Dxx_H_09
.Dyy_A_09(reg_29_31),    // input wire [27 : 0] Dyy_A_09
.Dyy_B_09(reg_29_28),    // input wire [27 : 0] Dyy_B_09
.Dyy_C_09(reg_29_25),    // input wire [27 : 0] Dyy_C_09
.Dyy_D_09(reg_29_22),    // input wire [27 : 0] Dyy_D_09
.Dyy_E_09(reg_24_22),    // input wire [27 : 0] Dyy_E_09
.Dyy_F_09(reg_24_25),    // input wire [27 : 0] Dyy_F_09
.Dyy_G_09(reg_24_28),    // input wire [27 : 0] Dyy_G_09
.Dyy_H_09(reg_24_31),    // input wire [27 : 0] Dyy_H_09
.Dxy_A_09(reg_30_30),    // input wire [27 : 0] Dxy_A_09
.Dxy_B_09(reg_27_30),    // input wire [27 : 0] Dxy_B_09
.Dxy_C_09(reg_26_30),    // input wire [27 : 0] Dxy_C_09
.Dxy_D_09(reg_23_30),    // input wire [27 : 0] Dxy_D_09
.Dxy_E_09(reg_30_27),    // input wire [27 : 0] Dxy_E_09
.Dxy_H_09(reg_23_27),    // input wire [27 : 0] Dxy_H_09
.Dxy_I_09(reg_30_26),    // input wire [27 : 0] Dxy_I_09
.Dxy_L_09(reg_23_26),    // input wire [27 : 0] Dxy_L_09
.Dxy_M_09(reg_30_23),    // input wire [27 : 0] Dxy_M_09
.Dxy_N_09(reg_27_23),    // input wire [27 : 0] Dxy_N_09
.Dxy_O_09(reg_26_23),    // input wire [27 : 0] Dxy_O_09
.Dxy_P_09(reg_23_23),    // input wire [27 : 0] Dxy_P_09
.Dxx_A_15(reg_34_31),    // input wire [27 : 0] Dxx_A_15
.Dxx_B_15(reg_29_31),    // input wire [27 : 0] Dxx_B_15
.Dxx_C_15(reg_24_31),    // input wire [27 : 0] Dxx_C_15
.Dxx_D_15(reg_19_31),    // input wire [27 : 0] Dxx_D_15
.Dxx_E_15(reg_19_22),    // input wire [27 : 0] Dxx_E_15
.Dxx_F_15(reg_24_22),    // input wire [27 : 0] Dxx_F_15
.Dxx_G_15(reg_29_22),    // input wire [27 : 0] Dxx_G_15
.Dxx_H_15(reg_34_22),    // input wire [27 : 0] Dxx_H_15
.Dyy_A_15(reg_31_34),    // input wire [27 : 0] Dyy_A_15
.Dyy_B_15(reg_31_29),    // input wire [27 : 0] Dyy_B_15
.Dyy_C_15(reg_31_24),    // input wire [27 : 0] Dyy_C_15
.Dyy_D_15(reg_31_19),    // input wire [27 : 0] Dyy_D_15
.Dyy_E_15(reg_22_19),    // input wire [27 : 0] Dyy_E_15
.Dyy_F_15(reg_22_24),    // input wire [27 : 0] Dyy_F_15
.Dyy_G_15(reg_22_29),    // input wire [27 : 0] Dyy_G_15
.Dyy_H_15(reg_22_34),    // input wire [27 : 0] Dyy_H_15
.Dxy_A_15(reg_32_32),    // input wire [27 : 0] Dxy_A_15
.Dxy_B_15(reg_27_32),    // input wire [27 : 0] Dxy_B_15
.Dxy_C_15(reg_26_32),    // input wire [27 : 0] Dxy_C_15
.Dxy_D_15(reg_21_32),    // input wire [27 : 0] Dxy_D_15
.Dxy_E_15(reg_32_27),    // input wire [27 : 0] Dxy_E_15
.Dxy_H_15(reg_21_27),    // input wire [27 : 0] Dxy_H_15
.Dxy_I_15(reg_32_26),    // input wire [27 : 0] Dxy_I_15
.Dxy_L_15(reg_21_26),    // input wire [27 : 0] Dxy_L_15
.Dxy_M_15(reg_32_21),    // input wire [27 : 0] Dxy_M_15
.Dxy_N_15(reg_27_21),    // input wire [27 : 0] Dxy_N_15
.Dxy_O_15(reg_26_21),    // input wire [27 : 0] Dxy_O_15
.Dxy_P_15(reg_21_21),    // input wire [27 : 0] Dxy_P_15
.Dxx_A_21(reg_37_33),    // input wire [27 : 0] Dxx_A_21
.Dxx_B_21(reg_30_33),    // input wire [27 : 0] Dxx_B_21
.Dxx_C_21(reg_23_33),    // input wire [27 : 0] Dxx_C_21
.Dxx_D_21(reg_16_33),    // input wire [27 : 0] Dxx_D_21
.Dxx_E_21(reg_16_20),    // input wire [27 : 0] Dxx_E_21
.Dxx_F_21(reg_23_20),    // input wire [27 : 0] Dxx_F_21
.Dxx_G_21(reg_30_20),    // input wire [27 : 0] Dxx_G_21
.Dxx_H_21(reg_37_20),    // input wire [27 : 0] Dxx_H_21
.Dyy_A_21(reg_33_37),    // input wire [27 : 0] Dyy_A_21
.Dyy_B_21(reg_33_30),    // input wire [27 : 0] Dyy_B_21
.Dyy_C_21(reg_33_23),    // input wire [27 : 0] Dyy_C_21
.Dyy_D_21(reg_33_16),    // input wire [27 : 0] Dyy_D_21
.Dyy_E_21(reg_20_16),    // input wire [27 : 0] Dyy_E_21
.Dyy_F_21(reg_20_23),    // input wire [27 : 0] Dyy_F_21
.Dyy_G_21(reg_20_30),    // input wire [27 : 0] Dyy_G_21
.Dyy_H_21(reg_20_37),    // input wire [27 : 0] Dyy_H_21
.Dxy_A_21(reg_34_34),    // input wire [27 : 0] Dxy_A_21
.Dxy_B_21(reg_27_34),    // input wire [27 : 0] Dxy_B_21
.Dxy_C_21(reg_26_34),    // input wire [27 : 0] Dxy_C_21
.Dxy_D_21(reg_19_34),    // input wire [27 : 0] Dxy_D_21
.Dxy_E_21(reg_34_27),    // input wire [27 : 0] Dxy_E_21
.Dxy_H_21(reg_19_27),    // input wire [27 : 0] Dxy_H_21
.Dxy_I_21(reg_34_26),    // input wire [27 : 0] Dxy_I_21
.Dxy_L_21(reg_19_26),    // input wire [27 : 0] Dxy_L_21
.Dxy_M_21(reg_34_19),    // input wire [27 : 0] Dxy_M_21
.Dxy_N_21(reg_27_19),    // input wire [27 : 0] Dxy_N_21
.Dxy_O_21(reg_26_19),    // input wire [27 : 0] Dxy_O_21
.Dxy_P_21(reg_19_19),    // input wire [27 : 0] Dxy_P_21
.Dxx_A_27(reg_40_35),    // input wire [27 : 0] Dxx_A_27
.Dxx_B_27(reg_31_35),    // input wire [27 : 0] Dxx_B_27
.Dxx_C_27(reg_22_35),    // input wire [27 : 0] Dxx_C_27
.Dxx_D_27(reg_13_35),    // input wire [27 : 0] Dxx_D_27
.Dxx_E_27(reg_13_18),    // input wire [27 : 0] Dxx_E_27
.Dxx_F_27(reg_22_18),    // input wire [27 : 0] Dxx_F_27
.Dxx_G_27(reg_31_18),    // input wire [27 : 0] Dxx_G_27
.Dxx_H_27(reg_40_18),    // input wire [27 : 0] Dxx_H_27
.Dyy_A_27(reg_35_40),    // input wire [27 : 0] Dyy_A_27
.Dyy_B_27(reg_35_31),    // input wire [27 : 0] Dyy_B_27
.Dyy_C_27(reg_35_22),    // input wire [27 : 0] Dyy_C_27
.Dyy_D_27(reg_35_13),    // input wire [27 : 0] Dyy_D_27
.Dyy_E_27(reg_18_13),    // input wire [27 : 0] Dyy_E_27
.Dyy_F_27(reg_18_22),    // input wire [27 : 0] Dyy_F_27
.Dyy_G_27(reg_18_31),    // input wire [27 : 0] Dyy_G_27
.Dyy_H_27(reg_18_40),    // input wire [27 : 0] Dyy_H_27
.Dxy_A_27(reg_36_36),    // input wire [27 : 0] Dxy_A_27
.Dxy_B_27(reg_27_36),    // input wire [27 : 0] Dxy_B_27
.Dxy_C_27(reg_26_36),    // input wire [27 : 0] Dxy_C_27
.Dxy_D_27(reg_17_36),    // input wire [27 : 0] Dxy_D_27
.Dxy_E_27(reg_36_27),    // input wire [27 : 0] Dxy_E_27
.Dxy_H_27(reg_17_27),    // input wire [27 : 0] Dxy_H_27
.Dxy_I_27(reg_36_26),    // input wire [27 : 0] Dxy_I_27
.Dxy_L_27(reg_17_26),    // input wire [27 : 0] Dxy_L_27
.Dxy_M_27(reg_36_17),    // input wire [27 : 0] Dxy_M_27
.Dxy_N_27(reg_27_17),    // input wire [27 : 0] Dxy_N_27
.Dxy_O_27(reg_26_17),    // input wire [27 : 0] Dxy_O_27
.Dxy_P_27(reg_17_17),    // input wire [27 : 0] Dxy_P_27
.Dxx_A_33(reg_43_37),    // input wire [27 : 0] Dxx_A_33
.Dxx_B_33(reg_32_37),    // input wire [27 : 0] Dxx_B_33
.Dxx_C_33(reg_21_37),    // input wire [27 : 0] Dxx_C_33
.Dxx_D_33(reg_10_37),    // input wire [27 : 0] Dxx_D_33
.Dxx_E_33(reg_10_16),    // input wire [27 : 0] Dxx_E_33
.Dxx_F_33(reg_21_16),    // input wire [27 : 0] Dxx_F_33
.Dxx_G_33(reg_32_16),    // input wire [27 : 0] Dxx_G_33
.Dxx_H_33(reg_43_16),    // input wire [27 : 0] Dxx_H_33
.Dyy_A_33(reg_37_43),    // input wire [27 : 0] Dyy_A_33
.Dyy_B_33(reg_37_32),    // input wire [27 : 0] Dyy_B_33
.Dyy_C_33(reg_37_21),    // input wire [27 : 0] Dyy_C_33
.Dyy_D_33(reg_37_10),    // input wire [27 : 0] Dyy_D_33
.Dyy_E_33(reg_16_10),    // input wire [27 : 0] Dyy_E_33
.Dyy_F_33(reg_16_21),    // input wire [27 : 0] Dyy_F_33
.Dyy_G_33(reg_16_32),    // input wire [27 : 0] Dyy_G_33
.Dyy_H_33(reg_16_43),    // input wire [27 : 0] Dyy_H_33
.Dxy_A_33(reg_38_38),    // input wire [27 : 0] Dxy_A_33
.Dxy_B_33(reg_27_38),    // input wire [27 : 0] Dxy_B_33
.Dxy_C_33(reg_26_38),    // input wire [27 : 0] Dxy_C_33
.Dxy_D_33(reg_15_38),    // input wire [27 : 0] Dxy_D_33
.Dxy_E_33(reg_38_27),    // input wire [27 : 0] Dxy_E_33
.Dxy_H_33(reg_15_27),    // input wire [27 : 0] Dxy_H_33
.Dxy_I_33(reg_38_26),    // input wire [27 : 0] Dxy_I_33
.Dxy_L_33(reg_15_26),    // input wire [27 : 0] Dxy_L_33
.Dxy_M_33(reg_38_15),    // input wire [27 : 0] Dxy_M_33
.Dxy_N_33(reg_27_15),    // input wire [27 : 0] Dxy_N_33
.Dxy_O_33(reg_26_15),    // input wire [27 : 0] Dxy_O_33
.Dxy_P_33(reg_15_15),    // input wire [27 : 0] Dxy_P_33
.Dxx_A_39(reg_46_39),    // input wire [27 : 0] Dxx_A_39
.Dxx_B_39(reg_33_39),    // input wire [27 : 0] Dxx_B_39
.Dxx_C_39(reg_20_39),    // input wire [27 : 0] Dxx_C_39
.Dxx_D_39(reg_07_39),    // input wire [27 : 0] Dxx_D_39
.Dxx_E_39(reg_07_14),    // input wire [27 : 0] Dxx_E_39
.Dxx_F_39(reg_20_14),    // input wire [27 : 0] Dxx_F_39
.Dxx_G_39(reg_33_14),    // input wire [27 : 0] Dxx_G_39
.Dxx_H_39(reg_46_14),    // input wire [27 : 0] Dxx_H_39
.Dyy_A_39(reg_39_46),    // input wire [27 : 0] Dyy_A_39
.Dyy_B_39(reg_39_33),    // input wire [27 : 0] Dyy_B_39
.Dyy_C_39(reg_39_20),    // input wire [27 : 0] Dyy_C_39
.Dyy_D_39(reg_39_07),    // input wire [27 : 0] Dyy_D_39
.Dyy_E_39(reg_14_07),    // input wire [27 : 0] Dyy_E_39
.Dyy_F_39(reg_14_20),    // input wire [27 : 0] Dyy_F_39
.Dyy_G_39(reg_14_33),    // input wire [27 : 0] Dyy_G_39
.Dyy_H_39(reg_14_46),    // input wire [27 : 0] Dyy_H_39
.Dxy_A_39(reg_40_40),    // input wire [27 : 0] Dxy_A_39
.Dxy_B_39(reg_27_40),    // input wire [27 : 0] Dxy_B_39
.Dxy_C_39(reg_26_40),    // input wire [27 : 0] Dxy_C_39
.Dxy_D_39(reg_13_40),    // input wire [27 : 0] Dxy_D_39
.Dxy_E_39(reg_40_27),    // input wire [27 : 0] Dxy_E_39
.Dxy_H_39(reg_13_27),    // input wire [27 : 0] Dxy_H_39
.Dxy_I_39(reg_40_26),    // input wire [27 : 0] Dxy_I_39
.Dxy_L_39(reg_13_26),    // input wire [27 : 0] Dxy_L_39
.Dxy_M_39(reg_40_13),    // input wire [27 : 0] Dxy_M_39
.Dxy_N_39(reg_27_13),    // input wire [27 : 0] Dxy_N_39
.Dxy_O_39(reg_26_13),    // input wire [27 : 0] Dxy_O_39
.Dxy_P_39(reg_13_13),    // input wire [27 : 0] Dxy_P_39
.Dxx_A_45(reg_49_41),    // input wire [27 : 0] Dxx_A_45
.Dxx_B_45(reg_34_41),    // input wire [27 : 0] Dxx_B_45
.Dxx_C_45(reg_19_41),    // input wire [27 : 0] Dxx_C_45
.Dxx_D_45(reg_04_41),    // input wire [27 : 0] Dxx_D_45
.Dxx_E_45(reg_04_12),    // input wire [27 : 0] Dxx_E_45
.Dxx_F_45(reg_19_12),    // input wire [27 : 0] Dxx_F_45
.Dxx_G_45(reg_34_12),    // input wire [27 : 0] Dxx_G_45
.Dxx_H_45(reg_49_12),    // input wire [27 : 0] Dxx_H_45
.Dyy_A_45(reg_41_49),    // input wire [27 : 0] Dyy_A_45
.Dyy_B_45(reg_41_34),    // input wire [27 : 0] Dyy_B_45
.Dyy_C_45(reg_41_19),    // input wire [27 : 0] Dyy_C_45
.Dyy_D_45(reg_41_04),    // input wire [27 : 0] Dyy_D_45
.Dyy_E_45(reg_12_04),    // input wire [27 : 0] Dyy_E_45
.Dyy_F_45(reg_12_19),    // input wire [27 : 0] Dyy_F_45
.Dyy_G_45(reg_12_34),    // input wire [27 : 0] Dyy_G_45
.Dyy_H_45(reg_12_49),    // input wire [27 : 0] Dyy_H_45
.Dxy_A_45(reg_42_42),    // input wire [27 : 0] Dxy_A_45
.Dxy_B_45(reg_27_42),    // input wire [27 : 0] Dxy_B_45
.Dxy_C_45(reg_26_42),    // input wire [27 : 0] Dxy_C_45
.Dxy_D_45(reg_11_42),    // input wire [27 : 0] Dxy_D_45
.Dxy_E_45(reg_42_27),    // input wire [27 : 0] Dxy_E_45
.Dxy_H_45(reg_11_27),    // input wire [27 : 0] Dxy_H_45
.Dxy_I_45(reg_42_26),    // input wire [27 : 0] Dxy_I_45
.Dxy_L_45(reg_11_26),    // input wire [27 : 0] Dxy_L_45
.Dxy_M_45(reg_42_11),    // input wire [27 : 0] Dxy_M_45
.Dxy_N_45(reg_27_11),    // input wire [27 : 0] Dxy_N_45
.Dxy_O_45(reg_26_11),    // input wire [27 : 0] Dxy_O_45
.Dxy_P_45(reg_11_11),    // input wire [27 : 0] Dxy_P_45
.Dxx_A_51(reg_52_43),    // input wire [27 : 0] Dxx_A_51
.Dxx_B_51(reg_35_43),    // input wire [27 : 0] Dxx_B_51
.Dxx_C_51(reg_18_43),    // input wire [27 : 0] Dxx_C_51
.Dxx_D_51(reg_01_43),    // input wire [27 : 0] Dxx_D_51
.Dxx_E_51(reg_01_10),    // input wire [27 : 0] Dxx_E_51
.Dxx_F_51(reg_18_10),    // input wire [27 : 0] Dxx_F_51
.Dxx_G_51(reg_35_10),    // input wire [27 : 0] Dxx_G_51
.Dxx_H_51(reg_52_10),    // input wire [27 : 0] Dxx_H_51
.Dyy_A_51(reg_43_52),    // input wire [27 : 0] Dyy_A_51
.Dyy_B_51(reg_43_35),    // input wire [27 : 0] Dyy_B_51
.Dyy_C_51(reg_43_18),    // input wire [27 : 0] Dyy_C_51
.Dyy_D_51(reg_43_01),    // input wire [27 : 0] Dyy_D_51
.Dyy_E_51(reg_10_01),    // input wire [27 : 0] Dyy_E_51
.Dyy_F_51(reg_10_18),    // input wire [27 : 0] Dyy_F_51
.Dyy_G_51(reg_10_35),    // input wire [27 : 0] Dyy_G_51
.Dyy_H_51(reg_10_52),    // input wire [27 : 0] Dyy_H_51
.Dxy_A_51(reg_44_44),    // input wire [27 : 0] Dxy_A_51
.Dxy_B_51(reg_27_44),    // input wire [27 : 0] Dxy_B_51
.Dxy_C_51(reg_26_44),    // input wire [27 : 0] Dxy_C_51
.Dxy_D_51(reg_09_44),    // input wire [27 : 0] Dxy_D_51
.Dxy_E_51(reg_44_27),    // input wire [27 : 0] Dxy_E_51
.Dxy_H_51(reg_09_27),    // input wire [27 : 0] Dxy_H_51
.Dxy_I_51(reg_44_26),    // input wire [27 : 0] Dxy_I_51
.Dxy_L_51(reg_09_26),    // input wire [27 : 0] Dxy_L_51
.Dxy_M_51(reg_44_09),    // input wire [27 : 0] Dxy_M_51
.Dxy_N_51(reg_27_09),    // input wire [27 : 0] Dxy_N_51
.Dxy_O_51(reg_26_09),    // input wire [27 : 0] Dxy_O_51
.Dxy_P_51(reg_09_09),    // input wire [27 : 0] Dxy_P_51
.o_d_valid(o_valid_hessian),  // output wire o_d_valid
.o_d_09(o_response09),        // output wire [31 : 0] o_d_09
.o_d_15(o_response15),        // output wire [31 : 0] o_d_15
.o_d_21(o_response21),        // output wire [31 : 0] o_d_21
.o_d_27(o_response27),        // output wire [31 : 0] o_d_27
.o_d_33(o_response33),        // output wire [31 : 0] o_d_33
.o_d_39(o_response39),        // output wire [31 : 0] o_d_39
.o_d_45(o_response45),        // output wire [31 : 0] o_d_45
.o_d_51(o_response51)        // output wire [31 : 0] o_d_51
);

non_max_suppersion 
#(.DATA_WIDTH (DATA_WIDTH_4WORDS),
  .IMAGE_WIDTH(COL),
  .IMAGE_HEIGHT(ROW)
  )
inst_non_max_suppersion
(
			  .clk(clk),                            // input wire clk
			  .rst_n(!rst),                          // input wire rst_n
			  .din_valid(o_valid_hessian),                  // input wire din_valid
			  .i_d_scale_09(o_response09),            // input wire [31 : 0] i_d_scale_09
			  .i_d_scale_15(o_response15),            // input wire [31 : 0] i_d_scale_15
			  .i_d_scale_21(o_response21),            // input wire [31 : 0] i_d_scale_21
			  .i_d_scale_27(o_response27),            // input wire [31 : 0] i_d_scale_27
			  .i_d_scale_33(o_response33),            // input wire [31 : 0] i_d_scale_33
			  .i_d_scale_39(o_response39),            // input wire [31 : 0] i_d_scale_39
			  .i_d_scale_45(o_response45),            // input wire [31 : 0] i_d_scale_45
			  .i_d_scale_51(o_response51),            // input wire [31 : 0] i_d_scale_51
			  .constant(constant),                    // input wire [31 : 0] constant
			  .max_response15(o_d_15),        // output wire [31 : 0] max_response15
			  .max_response21(o_d_21),        // output wire [31 : 0] max_response21
			  .max_response27(o_d_27),        // output wire [31 : 0] max_response27
			  .max_response33(o_d_33),        // output wire [31 : 0] max_response33
			  .max_response39(o_d_39),        // output wire [31 : 0] max_response39
			  .max_response45(o_d_45),        // output wire [31 : 0] max_response45
			  .max_flag_scale_15(max_response15),  // output wire max_flag_scale_15
			  .max_flag_scale_21(max_response21),  // output wire max_flag_scale_21
			  .max_flag_scale_27(max_response27),  // output wire max_flag_scale_27
			  .max_flag_scale_33(max_response33),  // output wire max_flag_scale_33
			  .max_flag_scale_39(max_response39),  // output wire max_flag_scale_39
			  .max_flag_scale_45(max_response45),  // output wire max_flag_scale_45
			  .dout_valid (dout_valid),
			  .x (center_x),
			  .y (center_y),
			  .coor_sync_flag(coor_sync_flag)
);



endmodule
