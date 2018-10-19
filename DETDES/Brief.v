`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/06 15:51:24
// Design Name: 
// Module Name: BRIEF
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


module Brief #(
parameter DATA_WIDTH =8,
parameter COL = 640,
parameter ROW = 480)
(
input wire [DATA_WIDTH-1 : 0] din,
input wire din_valid,
input wire clk,
input wire rst,
output wire dout_valid,
output wire [127:0] descriptor
);

wire [DATA_WIDTH-1:0] smooth_reg_1_3;
wire [DATA_WIDTH-1:0] smooth_reg_1_4;
wire [DATA_WIDTH-1:0] smooth_reg_1_5;

wire [DATA_WIDTH-1:0] smooth_reg_2_2;
wire [DATA_WIDTH-1:0] smooth_reg_2_3;
wire [DATA_WIDTH-1:0] smooth_reg_2_4;
wire [DATA_WIDTH-1:0] smooth_reg_2_5;
wire [DATA_WIDTH-1:0] smooth_reg_2_6;

wire [DATA_WIDTH-1:0] smooth_reg_3_1;
wire [DATA_WIDTH-1:0] smooth_reg_3_2;
wire [DATA_WIDTH-1:0] smooth_reg_3_3;
wire [DATA_WIDTH-1:0] smooth_reg_3_4;
wire [DATA_WIDTH-1:0] smooth_reg_3_5;
wire [DATA_WIDTH-1:0] smooth_reg_3_6;
wire [DATA_WIDTH-1:0] smooth_reg_3_7;

wire [DATA_WIDTH-1:0] smooth_reg_4_1;
wire [DATA_WIDTH-1:0] smooth_reg_4_2;
wire [DATA_WIDTH-1:0] smooth_reg_4_3;
wire [DATA_WIDTH-1:0] smooth_reg_4_4;
wire [DATA_WIDTH-1:0] smooth_reg_4_5;
wire [DATA_WIDTH-1:0] smooth_reg_4_6;
wire [DATA_WIDTH-1:0] smooth_reg_4_7;

wire [DATA_WIDTH-1:0] smooth_reg_5_1;
wire [DATA_WIDTH-1:0] smooth_reg_5_2;
wire [DATA_WIDTH-1:0] smooth_reg_5_3;
wire [DATA_WIDTH-1:0] smooth_reg_5_4;
wire [DATA_WIDTH-1:0] smooth_reg_5_5;
wire [DATA_WIDTH-1:0] smooth_reg_5_6;
wire [DATA_WIDTH-1:0] smooth_reg_5_7;

wire [DATA_WIDTH-1:0] smooth_reg_6_2;
wire [DATA_WIDTH-1:0] smooth_reg_6_3;
wire [DATA_WIDTH-1:0] smooth_reg_6_4;
wire [DATA_WIDTH-1:0] smooth_reg_6_5;
wire [DATA_WIDTH-1:0] smooth_reg_6_6;

wire [DATA_WIDTH-1:0] smooth_reg_7_3;
wire [DATA_WIDTH-1:0] smooth_reg_7_4;
wire [DATA_WIDTH-1:0] smooth_reg_7_5;

wire [DATA_WIDTH+5:0] register_17_14;
wire [DATA_WIDTH+5:0] register_20_10;
                    
wire [DATA_WIDTH+5:0] register_17_23;
wire [DATA_WIDTH+5:0] register_21_27;
                    
wire [DATA_WIDTH+5:0] register_20_11;
wire [DATA_WIDTH+5:0] register_28_30;
                    
wire [DATA_WIDTH+5:0] register_23_38;
wire [DATA_WIDTH+5:0] register_25_24;
                    
wire [DATA_WIDTH+5:0] register_19_26;
wire [DATA_WIDTH+5:0] register_32_15;
                    
wire [DATA_WIDTH+5:0] register_27_26;
wire [DATA_WIDTH+5:0] register_23_36;
                
wire [DATA_WIDTH+5:0] register_26_11;
wire [DATA_WIDTH+5:0] register_22_22;
              
wire [DATA_WIDTH+5:0] register_26_23;
wire [DATA_WIDTH+5:0] register_26_32;
                    
wire [DATA_WIDTH+5:0] register_11_24;
wire [DATA_WIDTH+5:0] register_39_20;
                    
wire [DATA_WIDTH+5:0] register_18_39;
wire [DATA_WIDTH+5:0] register_20_33;
                    
wire [DATA_WIDTH+5:0] register_27_03;
wire [DATA_WIDTH+5:0] register_33_14;
                    
wire [DATA_WIDTH+5:0] register_31_18;
wire [DATA_WIDTH+5:0] register_30_30;
                    
wire [DATA_WIDTH+5:0] register_19_28;
wire [DATA_WIDTH+5:0] register_19_30;
                    
wire [DATA_WIDTH+5:0] register_26_22;
wire [DATA_WIDTH+5:0] register_24_33;
                    
wire [DATA_WIDTH+5:0] register_19_13;
wire [DATA_WIDTH+5:0] register_17_15;
                    
wire [DATA_WIDTH+5:0] register_48_19;
wire [DATA_WIDTH+5:0] register_34_33;
                    
wire [DATA_WIDTH+5:0] register_22_15;
wire [DATA_WIDTH+5:0] register_16_29;
                    
wire [DATA_WIDTH+5:0] register_22_27;
wire [DATA_WIDTH+5:0] register_20_34;
                    
wire [DATA_WIDTH+5:0] register_30_29;
wire [DATA_WIDTH+5:0] register_14_25;
                
wire [DATA_WIDTH+5:0] register_32_22;
wire [DATA_WIDTH+5:0] register_43_15;
                
wire [DATA_WIDTH+5:0] register_16_20;
//wire [DATA_WIDTH+5:0] register_26_32;
                
wire [DATA_WIDTH+5:0] register_19_19;
wire [DATA_WIDTH+5:0] register_30_17;
                
wire [DATA_WIDTH+5:0] register_28_32;
wire [DATA_WIDTH+5:0] register_19_47;
                
wire [DATA_WIDTH+5:0] register_16_11;
wire [DATA_WIDTH+5:0] register_25_27;
                
wire [DATA_WIDTH+5:0] register_17_25;
wire [DATA_WIDTH+5:0] register_03_28;
                
wire [DATA_WIDTH+5:0] register_24_13;
wire [DATA_WIDTH+5:0] register_23_13;
                
wire [DATA_WIDTH+5:0] register_29_38;
wire [DATA_WIDTH+5:0] register_29_22;
                
wire [DATA_WIDTH+5:0] register_31_25;
wire [DATA_WIDTH+5:0] register_08_15;
                
wire [DATA_WIDTH+5:0] register_48_32;
wire [DATA_WIDTH+5:0] register_20_20;
                
wire [DATA_WIDTH+5:0] register_26_39;
wire [DATA_WIDTH+5:0] register_17_32;
        
wire [DATA_WIDTH+5:0] register_10_26;
wire [DATA_WIDTH+5:0] register_30_14;
        
wire [DATA_WIDTH+5:0] register_13_25;
wire [DATA_WIDTH+5:0] register_06_22;
        
wire [DATA_WIDTH+5:0] register_32_36;
wire [DATA_WIDTH+5:0] register_24_32;
        
wire [DATA_WIDTH+5:0] register_36_29;
wire [DATA_WIDTH+5:0] register_20_30;
        
wire [DATA_WIDTH+5:0] register_22_33;
wire [DATA_WIDTH+5:0] register_11_25;
        
wire [DATA_WIDTH+5:0] register_31_28;
wire [DATA_WIDTH+5:0] register_40_21;
        
wire [DATA_WIDTH+5:0] register_37_27;
wire [DATA_WIDTH+5:0] register_27_44;
        
wire [DATA_WIDTH+5:0] register_10_32;
wire [DATA_WIDTH+5:0] register_25_20;
        
wire [DATA_WIDTH+5:0] register_08_09;
wire [DATA_WIDTH+5:0] register_15_31;
        
wire [DATA_WIDTH+5:0] register_12_12;
wire [DATA_WIDTH+5:0] register_26_28;
    
wire [DATA_WIDTH+5:0] register_21_35;
wire [DATA_WIDTH+5:0] register_32_29;
        
wire [DATA_WIDTH+5:0] register_32_30;
wire [DATA_WIDTH+5:0] register_20_19;
        
wire [DATA_WIDTH+5:0] register_27_11;
wire [DATA_WIDTH+5:0] register_21_25;
        
wire [DATA_WIDTH+5:0] register_17_31;
wire [DATA_WIDTH+5:0] register_35_30;
        
wire [DATA_WIDTH+5:0] register_42_28;
wire [DATA_WIDTH+5:0] register_23_19;
        
wire [DATA_WIDTH+5:0] register_24_30;
wire [DATA_WIDTH+5:0] register_14_20;
        
wire [DATA_WIDTH+5:0] register_23_22;
wire [DATA_WIDTH+5:0] register_24_39;
        
wire [DATA_WIDTH+5:0] register_13_31;
wire [DATA_WIDTH+5:0] register_22_46;
        
wire [DATA_WIDTH+5:0] register_13_23;
//wire [DATA_WIDTH+5:0] register_40_21;
        
//wire [DATA_WIDTH+5:0] register_39_20;
wire [DATA_WIDTH+5:0] register_20_32;
        
wire [DATA_WIDTH+5:0] register_35_28;
wire [DATA_WIDTH+5:0] register_01_17;
        
wire [DATA_WIDTH+5:0] register_45_44;
wire [DATA_WIDTH+5:0] register_27_42;
        
wire [DATA_WIDTH+5:0] register_32_26;
wire [DATA_WIDTH+5:0] register_28_27;
        
wire [DATA_WIDTH+5:0] register_03_21;
wire [DATA_WIDTH+5:0] register_22_20;
        
wire [DATA_WIDTH+5:0] register_28_24;
wire [DATA_WIDTH+5:0] register_07_25;
        
wire [DATA_WIDTH+5:0] register_25_47;
wire [DATA_WIDTH+5:0] register_43_32;
        
wire [DATA_WIDTH+5:0] register_15_30;
wire [DATA_WIDTH+5:0] register_01_25;
        
wire [DATA_WIDTH+5:0] register_29_18;
wire [DATA_WIDTH+5:0] register_31_40;
        
wire [DATA_WIDTH+5:0] register_21_40;
wire [DATA_WIDTH+5:0] register_24_35;
        
wire [DATA_WIDTH+5:0] register_36_31;
wire [DATA_WIDTH+5:0] register_47_22;
        
//wire [DATA_WIDTH+5:0] register_19_30;
wire [DATA_WIDTH+5:0] register_36_18;
        
wire [DATA_WIDTH+5:0] register_37_17;
wire [DATA_WIDTH+5:0] register_25_30;
        
wire [DATA_WIDTH+5:0] register_12_45;
wire [DATA_WIDTH+5:0] register_20_28;
        
wire [DATA_WIDTH+5:0] register_13_29;
wire [DATA_WIDTH+5:0] register_44_25;
        
wire [DATA_WIDTH+5:0] register_46_27;
wire [DATA_WIDTH+5:0] register_23_28;
        
wire [DATA_WIDTH+5:0] register_26_19;
wire [DATA_WIDTH+5:0] register_30_19;
        
wire [DATA_WIDTH+5:0] register_15_33;
wire [DATA_WIDTH+5:0] register_27_38;
        
wire [DATA_WIDTH+5:0] register_37_06;
wire [DATA_WIDTH+5:0] register_22_29;
        
wire [DATA_WIDTH+5:0] register_26_24;
wire [DATA_WIDTH+5:0] register_22_18;
        
wire [DATA_WIDTH+5:0] register_17_12;
wire [DATA_WIDTH+5:0] register_47_07;
        
wire [DATA_WIDTH+5:0] register_11_12;
wire [DATA_WIDTH+5:0] register_29_29;
        
//wire [DATA_WIDTH+5:0] register_19_28;
wire [DATA_WIDTH+5:0] register_27_47;
        
wire [DATA_WIDTH+5:0] register_36_32;
wire [DATA_WIDTH+5:0] register_13_43;
        
wire [DATA_WIDTH+5:0] register_25_29;
wire [DATA_WIDTH+5:0] register_21_05;
        
wire [DATA_WIDTH+5:0] register_20_07;
wire [DATA_WIDTH+5:0] register_20_21;
        
//wire [DATA_WIDTH+5:0] register_22_29;
wire [DATA_WIDTH+5:0] register_32_44;
        
wire [DATA_WIDTH+5:0] register_15_18;
wire [DATA_WIDTH+5:0] register_19_14;
        
wire [DATA_WIDTH+5:0] register_26_26;
wire [DATA_WIDTH+5:0] register_07_34;
        
//wire [DATA_WIDTH+5:0] register_30_19;
wire [DATA_WIDTH+5:0] register_26_13;
        
//wire [DATA_WIDTH+5:0] register_32_29;
wire [DATA_WIDTH+5:0] register_09_25;
       
wire [DATA_WIDTH+5:0] register_31_17;
wire [DATA_WIDTH+5:0] register_13_24;
        
wire [DATA_WIDTH+5:0] register_34_42;
//wire [DATA_WIDTH+5:0] register_17_23;
       
wire [DATA_WIDTH+5:0] register_23_18;
//wire [DATA_WIDTH+5:0] register_19_26;
        
wire [DATA_WIDTH+5:0] register_22_42;
wire [DATA_WIDTH+5:0] register_33_27;
        
wire [DATA_WIDTH+5:0] register_24_21;
wire [DATA_WIDTH+5:0] register_12_11;
        
wire [DATA_WIDTH+5:0] register_19_07;
//wire [DATA_WIDTH+5:0] register_22_18;
        
wire [DATA_WIDTH+5:0] register_10_27;
wire [DATA_WIDTH+5:0] register_36_44;
        
wire [DATA_WIDTH+5:0] register_08_05;
wire [DATA_WIDTH+5:0] register_18_07;
        
wire [DATA_WIDTH+5:0] register_27_17;
//wire [DATA_WIDTH+5:0] register_13_24;
        
//wire [DATA_WIDTH+5:0] register_29_18;
wire [DATA_WIDTH+5:0] register_32_42;
        
//wire [DATA_WIDTH+5:0] register_26_11;
wire [DATA_WIDTH+5:0] register_27_28;
        
wire [DATA_WIDTH+5:0] register_03_25;
//wire [DATA_WIDTH+5:0] register_40_21;
        
//wire [DATA_WIDTH+5:0] register_34_33;
wire [DATA_WIDTH+5:0] register_25_40;
        
wire [DATA_WIDTH+5:0] register_26_17;
wire [DATA_WIDTH+5:0] register_34_18;
        
wire [DATA_WIDTH+5:0] register_18_23;
//wire [DATA_WIDTH+5:0] register_17_31;
        
wire [DATA_WIDTH+5:0] register_21_23;
wire [DATA_WIDTH+5:0] register_19_24;
        
wire [DATA_WIDTH+5:0] register_28_19;
wire [DATA_WIDTH+5:0] register_24_27;
        
wire [DATA_WIDTH+5:0] register_31_19;
wire [DATA_WIDTH+5:0] register_18_10;
        
//wire [DATA_WIDTH+5:0] register_23_19;
//wire [DATA_WIDTH+5:0] register_15_31;
        
wire [DATA_WIDTH+5:0] register_31_27;
wire [DATA_WIDTH+5:0] register_45_28;
        
wire [DATA_WIDTH+5:0] register_36_30;
wire [DATA_WIDTH+5:0] register_31_16;
        
wire [DATA_WIDTH+5:0] register_29_36;
//wire [DATA_WIDTH+5:0] register_17_25;
        
wire [DATA_WIDTH+5:0] register_12_20;
wire [DATA_WIDTH+5:0] register_14_17;
        
//wire [DATA_WIDTH+5:0] register_32_30;
wire [DATA_WIDTH+5:0] register_18_32;
        
wire [DATA_WIDTH+5:0] register_15_17;
wire [DATA_WIDTH+5:0] register_27_14;
        
wire [DATA_WIDTH+5:0] register_39_02;
wire [DATA_WIDTH+5:0] register_44_12;
        
wire [DATA_WIDTH+5:0] register_25_44;
wire [DATA_WIDTH+5:0] register_42_30;
        
wire [DATA_WIDTH+5:0] register_14_47;
wire [DATA_WIDTH+5:0] register_28_25;
        
wire [DATA_WIDTH+5:0] register_25_09;
//wire [DATA_WIDTH+5:0] register_17_31;
        
wire [DATA_WIDTH+5:0] register_32_25;
//wire [DATA_WIDTH+5:0] register_26_24;
        
wire [DATA_WIDTH+5:0] register_37_32;
wire [DATA_WIDTH+5:0] register_20_39;
        
wire [DATA_WIDTH+5:0] register_25_36;
//wire [DATA_WIDTH+5:0] register_23_22;
        
wire [DATA_WIDTH+5:0] register_38_18;
wire [DATA_WIDTH+5:0] register_15_12;
        
//wire [DATA_WIDTH+5:0] register_31_28;
wire [DATA_WIDTH+5:0] register_43_35;
        
//wire [DATA_WIDTH+5:0] register_26_22;
wire [DATA_WIDTH+5:0] register_35_32;
        
wire [DATA_WIDTH+5:0] register_30_24;
wire [DATA_WIDTH+5:0] register_23_40;
        
wire [DATA_WIDTH+5:0] register_18_29;
wire [DATA_WIDTH+5:0] register_26_33;
        
//wire [DATA_WIDTH+5:0] register_24_13;
wire [DATA_WIDTH+5:0] register_30_20;
        
//wire [DATA_WIDTH+5:0] register_32_26;
wire [DATA_WIDTH+5:0] register_25_39;
        
//wire [DATA_WIDTH+5:0] register_19_14;
wire [DATA_WIDTH+5:0] register_12_15;
        
wire [DATA_WIDTH+5:0] register_16_28;
wire [DATA_WIDTH+5:0] register_23_33;
        
wire [DATA_WIDTH+5:0] register_11_27;
wire [DATA_WIDTH+5:0] register_18_33;
        
wire [DATA_WIDTH+5:0] register_27_23;
wire [DATA_WIDTH+5:0] register_35_33;
        
wire [DATA_WIDTH+5:0] register_30_28;
wire [DATA_WIDTH+5:0] register_30_26;
        
//wire [DATA_WIDTH+5:0] register_27_26;
wire [DATA_WIDTH+5:0] register_32_37;
        
wire [DATA_WIDTH+5:0] register_38_21;
//wire [DATA_WIDTH+5:0] register_24_32;
        
wire [DATA_WIDTH+5:0] register_11_06;
wire [DATA_WIDTH+5:0] register_39_33;
        
//wire [DATA_WIDTH+5:0] register_26_26;
wire [DATA_WIDTH+5:0] register_35_38;

///////////////////////////////////////////
wire smooth_window_valid;

window7 #(
.DATA_WIDTH(DATA_WIDTH),
.IMAGE_WIDTH(COL)
)
smooth_window
(
.clk(clk),
.rst(rst),
.din(din),
.din_valid(din_valid),
.dout_valid(smooth_window_valid),


.reg_1_3(smooth_reg_1_3),
.reg_1_4(smooth_reg_1_4),
.reg_1_5(smooth_reg_1_5),

.reg_2_2(smooth_reg_2_2),
.reg_2_3(smooth_reg_2_3),
.reg_2_4(smooth_reg_2_4),
.reg_2_5(smooth_reg_2_5),
.reg_2_6(smooth_reg_2_6),

.reg_3_1(smooth_reg_3_1),
.reg_3_2(smooth_reg_3_2),
.reg_3_3(smooth_reg_3_3),
.reg_3_4(smooth_reg_3_4),
.reg_3_5(smooth_reg_3_5),
.reg_3_6(smooth_reg_3_6),
.reg_3_7(smooth_reg_3_7),

.reg_4_1(smooth_reg_4_1),
.reg_4_2(smooth_reg_4_2),
.reg_4_3(smooth_reg_4_3),
.reg_4_4(smooth_reg_4_4),
.reg_4_5(smooth_reg_4_5),
.reg_4_6(smooth_reg_4_6),
.reg_4_7(smooth_reg_4_7),

.reg_5_1(smooth_reg_5_1),
.reg_5_2(smooth_reg_5_2),
.reg_5_3(smooth_reg_5_3),
.reg_5_4(smooth_reg_5_4),
.reg_5_5(smooth_reg_5_5),
.reg_5_6(smooth_reg_5_6),
.reg_5_7(smooth_reg_5_7),

.reg_6_2(smooth_reg_6_2),
.reg_6_3(smooth_reg_6_3),
.reg_6_4(smooth_reg_6_4),
.reg_6_5(smooth_reg_6_5),
.reg_6_6(smooth_reg_6_6),

.reg_7_3(smooth_reg_7_3),
.reg_7_4(smooth_reg_7_4),
.reg_7_5(smooth_reg_7_5)
);


/////////////////////////////////////////////////
localparam AdderTreePiplineLayer = 6;
wire smooth_valid;
wire [DATA_WIDTH+AdderTreePiplineLayer-1:0] smooth_data;

AdderTree #(
.DATA_WIDTH(DATA_WIDTH),
.RESULT_WIDTH(DATA_WIDTH+AdderTreePiplineLayer)
)
smooth
(
.clk(clk),
.din_valid(smooth_window_valid),
.dout_valid(smooth_valid),
.sum(smooth_data),
.i_0 (smooth_reg_1_3),
.i_1 (smooth_reg_1_4),
.i_2 (smooth_reg_1_5),
.i_3 (smooth_reg_2_2),
.i_4 (smooth_reg_2_3),
.i_5 (smooth_reg_2_4),
.i_6 (smooth_reg_2_5),
.i_7 (smooth_reg_2_6),
.i_8 (smooth_reg_3_1),
.i_9 (smooth_reg_3_2),
.i_10(smooth_reg_3_3),
.i_11(smooth_reg_3_4),
.i_12(smooth_reg_3_5),
.i_13(smooth_reg_3_6),
.i_14(smooth_reg_3_7),
.i_15(smooth_reg_4_1),
.i_16(smooth_reg_4_2),
.i_17(smooth_reg_4_3),
.i_18(smooth_reg_4_4),
.i_19(smooth_reg_4_5),
.i_20(smooth_reg_4_6),
.i_21(smooth_reg_4_7),
.i_22(smooth_reg_5_1),
.i_23(smooth_reg_5_2),
.i_24(smooth_reg_5_3),
.i_25(smooth_reg_5_4),
.i_26(smooth_reg_5_5),
.i_27(smooth_reg_5_6),
.i_28(smooth_reg_5_7),
.i_29(smooth_reg_6_2),
.i_30(smooth_reg_6_3),
.i_31(smooth_reg_6_4),
.i_32(smooth_reg_6_5),
.i_33(smooth_reg_6_6),
.i_34(smooth_reg_7_3),
.i_35(smooth_reg_7_4),
.i_36(smooth_reg_7_5)
);

///////////////////////////////////////////////
wire descriptor_window_valid;
window49 #(
.IMAGE_WIDTH(COL)
)
descriptor_window
(
.clk(clk),
.rst(rst),

.din_valid(smooth_valid),
.dout_valid(descriptor_window_valid),

.din(smooth_data),

.register_17_14(register_17_14),
.register_20_10(register_20_10),

.register_17_23(register_17_23),
.register_21_27(register_21_27),

.register_20_11(register_20_11),
.register_28_30(register_28_30),

.register_23_38(register_23_38),
.register_25_24(register_25_24),

.register_19_26(register_19_26),
.register_32_15(register_32_15),

.register_27_26(register_27_26),
.register_23_36(register_23_36),

.register_26_11(register_26_11),
.register_22_22(register_22_22),

.register_26_23(register_26_23),
.register_26_32(register_26_32),

.register_11_24(register_11_24),
.register_39_20(register_39_20),

.register_18_39(register_18_39),
.register_20_33(register_20_33),

.register_27_03(register_27_03),
.register_33_14(register_33_14),

.register_31_18(register_31_18),
.register_30_30(register_30_30),

.register_19_28(register_19_28),
.register_19_30(register_19_30),

.register_26_22(register_26_22),
.register_24_33(register_24_33),

.register_19_13(register_19_13),
.register_17_15(register_17_15),

.register_48_19(register_48_19),
.register_34_33(register_34_33),

.register_22_15(register_22_15),
.register_16_29(register_16_29),

.register_22_27(register_22_27),
.register_20_34(register_20_34),

.register_30_29(register_30_29),
.register_14_25(register_14_25),

.register_32_22(register_32_22),
.register_43_15(register_43_15),

.register_16_20(register_16_20),
//.register_26_32(),

.register_19_19(register_19_19),
.register_30_17(register_30_17),

.register_28_32(register_28_32),
.register_19_47(register_19_47),

.register_16_11(register_16_11),
.register_25_27(register_25_27),

.register_17_25(register_17_25),
.register_03_28(register_03_28),

.register_24_13(register_24_13),
.register_23_13(register_23_13),

.register_29_38(register_29_38),
.register_29_22(register_29_22),

.register_31_25(register_31_25),
.register_08_15(register_08_15),

.register_48_32(register_48_32),
.register_20_20(register_20_20),

.register_26_39(register_26_39),
.register_17_32(register_17_32),

.register_10_26(register_10_26),
.register_30_14(register_30_14),

.register_13_25(register_13_25),
.register_06_22(register_06_22),

.register_32_36(register_32_36),
.register_24_32(register_24_32),

.register_36_29(register_36_29),
.register_20_30(register_20_30),

.register_22_33(register_22_33),
.register_11_25(register_11_25),

.register_31_28(register_31_28),
.register_40_21(register_40_21),

.register_37_27(register_37_27),
.register_27_44(register_27_44),

.register_10_32(register_10_32),
.register_25_20(register_25_20),

.register_08_09(register_08_09),
.register_15_31(register_15_31),

.register_12_12(register_12_12),
.register_26_28(register_26_28),

.register_21_35(register_21_35),
.register_32_29(register_32_29),

.register_32_30(register_32_30),
.register_20_19(register_20_19),

.register_27_11(register_27_11),
.register_21_25(register_21_25),

.register_17_31(register_17_31),
.register_35_30(register_35_30),

.register_42_28(register_42_28),
.register_23_19(register_23_19),

.register_24_30(register_24_30),
.register_14_20(register_14_20),

.register_23_22(register_23_22),
.register_24_39(register_24_39),

.register_13_31(register_13_31),
.register_22_46(register_22_46),

.register_13_23(register_13_23),
//.register_40_21(),

//.register_39_20(),
.register_20_32(register_20_32),

.register_35_28(register_35_28),
.register_01_17(register_01_17),

.register_45_44(register_45_44),
.register_27_42(register_27_42),

.register_32_26(register_32_26),
.register_28_27(register_28_27),

.register_03_21(register_03_21),
.register_22_20(register_22_20),

.register_28_24(register_28_24),
.register_07_25(register_07_25),

.register_25_47(register_25_47),
.register_43_32(register_43_32),

.register_15_30(register_15_30),
.register_01_25(register_01_25),

.register_29_18(register_29_18),
.register_31_40(register_31_40),

.register_21_40(register_21_40),
.register_24_35(register_24_35),

.register_36_31(register_36_31),
.register_47_22(register_47_22),

//.register_19_30(),
.register_36_18(register_36_18),

.register_37_17(register_37_17),
.register_25_30(register_25_30),

.register_12_45(register_12_45),
.register_20_28(register_20_28),

.register_13_29(register_13_29),
.register_44_25(register_44_25),

.register_46_27(register_46_27),
.register_23_28(register_23_28),

.register_26_19(register_26_19),
.register_30_19(register_30_19),

.register_15_33(register_15_33),
.register_27_38(register_27_38),

.register_37_06(register_37_06),
.register_22_29(register_22_29),

.register_26_24(register_26_24),
.register_22_18(register_22_18),

.register_17_12(register_17_12),
.register_47_07(register_47_07),

.register_11_12(register_11_12),
.register_29_29(register_29_29),

//.register_19_28(),
.register_27_47(register_27_47),

.register_36_32(register_36_32),
.register_13_43(register_13_43),

.register_25_29(register_25_29),
.register_21_05(register_21_05),

.register_20_07(register_20_07),
.register_20_21(register_20_21),

//.register_22_29(),
.register_32_44(register_32_44),

.register_15_18(register_15_18),
.register_19_14(register_19_14),

.register_26_26(register_26_26),
.register_07_34(register_07_34),

//.register_30_19(),
.register_26_13(register_26_13),

//.register_32_29(),
.register_09_25(register_09_25),

.register_31_17(register_31_17),
.register_13_24(register_13_24),

.register_34_42(register_34_42),
//.register_17_23(),

.register_23_18(register_23_18),
//.register_19_26(),

.register_22_42(register_22_42),
.register_33_27(register_33_27),

.register_24_21(register_24_21),
.register_12_11(register_12_11),

.register_19_07(register_19_07),
//.register_22_18(),

.register_10_27(register_10_27),
.register_36_44(register_36_44),

.register_08_05(register_08_05),
.register_18_07(register_18_07),

.register_27_17(register_27_17),
//.register_13_24(),

//.register_29_18(),
.register_32_42(register_32_42),

//.register_26_11(),
.register_27_28(register_27_28),

.register_03_25(register_03_25),
//.register_40_21(),

//.register_34_33(),
.register_25_40(register_25_40),

.register_26_17(register_26_17),
.register_34_18(register_34_18),

.register_18_23(register_18_23),
//.register_17_31(),

.register_21_23(register_21_23),
.register_19_24(register_19_24),

.register_28_19(register_28_19),
.register_24_27(register_24_27),

.register_31_19(register_31_19),
.register_18_10(register_18_10),

//.register_23_19(),
//.register_15_31(),

.register_31_27(register_31_27),
.register_45_28(register_45_28),

.register_36_30(register_36_30),
.register_31_16(register_31_16),

.register_29_36(register_29_36),
//.register_17_25(),

.register_12_20(register_12_20),
.register_14_17(register_14_17),

//.register_32_30(),
.register_18_32(register_18_32),

.register_15_17(register_15_17),
.register_27_14(register_27_14),

.register_39_02(register_39_02),
.register_44_12(register_44_12),

.register_25_44(register_25_44),
.register_42_30(register_42_30),

.register_14_47(register_14_47),
.register_28_25(register_28_25),

.register_25_09(register_25_09),
//.register_17_31(),

.register_32_25(register_32_25),
//.register_26_24(),

.register_37_32(register_37_32),
.register_20_39(register_20_39),

.register_25_36(register_25_36),
//.register_23_22(),

.register_38_18(register_38_18),
.register_15_12(register_15_12),

//.register_31_28(),
.register_43_35(register_43_35),

//.register_26_22(),
.register_35_32(register_35_32),

.register_30_24(register_30_24),
.register_23_40(register_23_40),

.register_18_29(register_18_29),
.register_26_33(register_26_33),

//.register_24_13(),
.register_30_20(register_30_20),

//.register_32_26(),
.register_25_39(register_25_39),

//.register_19_14(),
.register_12_15(register_12_15),

.register_16_28(register_16_28),
.register_23_33(register_23_33),

.register_11_27(register_11_27),
.register_18_33(register_18_33),

.register_27_23(register_27_23),
.register_35_33(register_35_33),

.register_30_28(register_30_28),
.register_30_26(register_30_26),

//.register_27_26(),
.register_32_37(register_32_37),

.register_38_21(register_38_21),
//.register_24_32(),

.register_11_06(register_11_06),
.register_39_33(register_39_33),

//.register_26_26(),
.register_35_38(register_35_38)
);

/////////////////////////////////
DescriptorGenerate #(
.IMAGE_WIDTH(COL),
.IMAGE_HEIGHT(ROW)
)
brief_descriptor
(
.din_valid(descriptor_window_valid),
.clk(clk),
.rst(rst),
.dout_valid(dout_valid),


.descriptor(descriptor),

.compare_0_L(register_17_14),
.compare_0_H(register_20_10),
     
.compare_1_L(register_17_23),
.compare_1_H(register_21_27),
     
.compare_2_L(register_20_11),
.compare_2_H(register_28_30),
    
.compare_3_L(register_23_38),
.compare_3_H(register_25_24),
     
.compare_4_L(register_19_26),
.compare_4_H(register_32_15),
     
.compare_5_L(register_27_26),
.compare_5_H(register_23_36),
 
.compare_6_L(register_26_11),
.compare_6_H(register_22_22),

.compare_7_L(register_26_23),
.compare_7_H(register_26_32),
    
.compare_8_L(register_11_24),
.compare_8_H(register_39_20),
     
.compare_9_L(register_18_39),
.compare_9_H(register_20_33),
     
.compare_10_L(register_27_03),
.compare_10_H(register_33_14),
     
.compare_11_L(register_31_18),
.compare_11_H(register_30_30),
     
.compare_12_L(register_19_28),
.compare_12_H(register_19_30),
     
.compare_13_L(register_26_22),
.compare_13_H(register_24_33),
     
.compare_14_L(register_19_13),
.compare_14_H(register_17_15),
     
.compare_15_L(register_48_19),
.compare_15_H(register_34_33),
     
.compare_16_L(register_22_15),
.compare_16_H(register_16_29),
     
.compare_17_L(register_22_27),
.compare_17_H(register_20_34),
     
.compare_18_L(register_30_29),
.compare_18_H(register_14_25),
 
.compare_19_L(register_32_22),
.compare_19_H(register_43_15),
 
.compare_20_L(register_16_20),
.compare_20_H(register_26_32),
 
.compare_21_L(register_19_19),
.compare_21_H(register_30_17),
 
.compare_22_L(register_28_32),
.compare_22_H(register_19_47),
 
.compare_23_L(register_16_11),
.compare_23_H(register_25_27),
 
.compare_24_L(register_17_25),
.compare_24_H(register_03_28),
 
.compare_25_L(register_24_13),
.compare_25_H(register_23_13),
 
.compare_26_L(register_29_38),
.compare_26_H(register_29_22),
 
.compare_27_L(register_31_25),
.compare_27_H(register_08_15),
 
.compare_28_L(register_48_32),
.compare_28_H(register_20_20),
 
.compare_29_L(register_26_39),
.compare_29_H(register_17_32),

.compare_30_L(register_10_26),
.compare_30_H(register_30_14),

.compare_31_L(register_13_25),
.compare_31_H(register_06_22),

.compare_32_L(register_32_36),
.compare_32_H(register_24_32),

.compare_33_L(register_36_29),
.compare_33_H(register_20_30),

.compare_34_L(register_22_33),
.compare_34_H(register_11_25),

.compare_35_L(register_31_28),
.compare_35_H(register_40_21),

.compare_36_L(register_37_27),
.compare_36_H(register_27_44),

.compare_37_L(register_10_32),
.compare_37_H(register_25_20),

.compare_38_L(register_08_09),
.compare_38_H(register_15_31),

.compare_39_L(register_12_12),
.compare_39_H(register_26_28),

.compare_40_L(register_21_35),
.compare_40_H(register_32_29),

.compare_41_L(register_32_30),
.compare_41_H(register_20_19),

.compare_42_L(register_27_11),
.compare_42_H(register_21_25),

.compare_43_L(register_17_31),
.compare_43_H(register_35_30),

.compare_44_L(register_42_28),
.compare_44_H(register_23_19),

.compare_45_L(register_24_30),
.compare_45_H(register_14_20),

.compare_46_L(register_23_22),
.compare_46_H(register_24_39),

.compare_47_L(register_13_31),
.compare_47_H(register_22_46),

.compare_48_L(register_13_23),
.compare_48_H(register_40_21),

.compare_49_L(register_39_20),
.compare_49_H(register_20_32),

.compare_50_L(register_35_28),
.compare_50_H(register_01_17),

.compare_51_L(register_45_44),
.compare_51_H(register_27_42),

.compare_52_L(register_32_26),
.compare_52_H(register_28_27),

.compare_53_L(register_03_21),
.compare_53_H(register_22_20),

.compare_54_L(register_28_24),
.compare_54_H(register_07_25),

.compare_55_L(register_25_47),
.compare_55_H(register_43_32),

.compare_56_L(register_15_30),
.compare_56_H(register_01_25),

.compare_57_L(register_29_18),
.compare_57_H(register_31_40),

.compare_58_L(register_21_40),
.compare_58_H(register_24_35),

.compare_59_L(register_36_31),
.compare_59_H(register_47_22),

.compare_60_L(register_19_30),
.compare_60_H(register_36_18),

.compare_61_L(register_37_17),
.compare_61_H(register_25_30),

.compare_62_L(register_12_45),
.compare_62_H(register_20_28),

.compare_63_L(register_13_29),
.compare_63_H(register_44_25),

.compare_64_L(register_46_27),
.compare_64_H(register_23_28),

.compare_65_L(register_26_19),
.compare_65_H(register_30_19),

.compare_66_L(register_15_33),
.compare_66_H(register_27_38),

.compare_67_L(register_37_06),
.compare_67_H(register_22_29),

.compare_68_L(register_26_24),
.compare_68_H(register_22_18),

.compare_69_L(register_17_12),
.compare_69_H(register_47_07),

.compare_70_L(register_11_12),
.compare_70_H(register_29_29),

.compare_71_L(register_19_28),
.compare_71_H(register_27_47),

.compare_72_L(register_36_32),
.compare_72_H(register_13_43),

.compare_73_L(register_25_29),
.compare_73_H(register_21_05),

.compare_74_L(register_20_07),
.compare_74_H(register_20_21),

.compare_75_L(register_22_29),
.compare_75_H(register_32_44),

.compare_76_L(register_15_18),
.compare_76_H(register_19_14),

.compare_77_L(register_26_26),
.compare_77_H(register_07_34),

.compare_78_L(register_30_19),
.compare_78_H(register_26_13),

.compare_79_L(register_32_29),
.compare_79_H(register_09_25),

.compare_80_L(register_31_17),
.compare_80_H(register_13_24),

.compare_81_L(register_34_42),
.compare_81_H(register_17_23),

.compare_82_L(register_23_18),
.compare_82_H(register_19_26),

.compare_83_L(register_22_42),
.compare_83_H(register_33_27),

.compare_84_L(register_24_21),
.compare_84_H(register_12_11),

.compare_85_L(register_19_07),
.compare_85_H(register_22_18),

.compare_86_L(register_10_27),
.compare_86_H(register_36_44),

.compare_87_L(register_08_05),
.compare_87_H(register_18_07),

.compare_88_L(register_27_17),
.compare_88_H(register_13_24),

.compare_89_L(register_29_18),
.compare_89_H(register_32_42),

.compare_90_L(register_26_11),
.compare_90_H(register_27_28),

.compare_91_L(register_03_25),
.compare_91_H(register_40_21),

.compare_92_L(register_34_33),
.compare_92_H(register_25_40),

.compare_93_L(register_26_17),
.compare_93_H(register_34_18),

.compare_94_L(register_18_23),
.compare_94_H(register_17_31),

.compare_95_L(register_21_23),
.compare_95_H(register_19_24),

.compare_96_L(register_28_19),
.compare_96_H(register_24_27),

.compare_97_L(register_31_19),
.compare_97_H(register_18_10),

.compare_98_L(register_23_19),
.compare_98_H(register_15_31),

.compare_99_L(register_31_27),
.compare_99_H(register_45_28),

.compare_100_L(register_36_30),
.compare_100_H(register_31_16),

.compare_101_L(register_29_36),
.compare_101_H(register_17_25),

.compare_102_L(register_12_20),
.compare_102_H(register_14_17),

.compare_103_L(register_32_30),
.compare_103_H(register_18_32),

.compare_104_L(register_15_17),
.compare_104_H(register_27_14),

.compare_105_L(register_39_02),
.compare_105_H(register_44_12),

.compare_106_L(register_25_44),
.compare_106_H(register_42_30),

.compare_107_L(register_14_47),
.compare_107_H(register_28_25),

.compare_108_L(register_25_09),
.compare_108_H(register_17_31),

.compare_109_L(register_32_25),
.compare_109_H(register_26_24),

.compare_110_L(register_37_32),
.compare_110_H(register_20_39),

.compare_111_L(register_25_36),
.compare_111_H(register_23_22),

.compare_112_L(register_38_18),
.compare_112_H(register_15_12),

.compare_113_L(register_31_28),
.compare_113_H(register_43_35),

.compare_114_L(register_26_22),
.compare_114_H(register_35_32),

.compare_115_L(register_30_24),
.compare_115_H(register_23_40),

.compare_116_L(register_18_29),
.compare_116_H(register_26_33),

.compare_117_L(register_24_13),
.compare_117_H(register_30_20),

.compare_118_L(register_32_26),
.compare_118_H(register_25_39),

.compare_119_L(register_19_14),
.compare_119_H(register_12_15),

.compare_120_L(register_16_28),
.compare_120_H(register_23_33),

.compare_121_L(register_11_27),
.compare_121_H(register_18_33),

.compare_122_L(register_27_23),
.compare_122_H(register_35_33),

.compare_123_L(register_30_28),
.compare_123_H(register_30_26),

.compare_124_L(register_27_26),
.compare_124_H(register_32_37),

.compare_125_L(register_38_21),
.compare_125_H(register_24_32),

.compare_126_L(register_11_06),
.compare_126_H(register_39_33),

.compare_127_L(register_26_26),
.compare_127_H(register_35_38)
);

endmodule
