`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/09 14:14:56
// Design Name: 
// Module Name: descriptor_generate
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


module DescriptorGenerate#(  parameter DATA_WIDTH = 14,
                              parameter IMAGE_WIDTH = 640,
                              parameter IMAGE_HEIGHT = 480 )
   (
      input wire din_valid,
      input wire clk,
      input wire rst,
      input wire [DATA_WIDTH-1 : 0] compare_0_L,
      input wire [DATA_WIDTH-1 : 0] compare_0_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_1_L,
      input wire [DATA_WIDTH-1 : 0] compare_1_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_2_L,
      input wire [DATA_WIDTH-1 : 0] compare_2_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_3_L,
      input wire [DATA_WIDTH-1 : 0] compare_3_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_4_L,
      input wire [DATA_WIDTH-1 : 0] compare_4_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_5_L,
      input wire [DATA_WIDTH-1 : 0] compare_5_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_6_L,
      input wire [DATA_WIDTH-1 : 0] compare_6_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_7_L,
      input wire [DATA_WIDTH-1 : 0] compare_7_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_8_L,
      input wire [DATA_WIDTH-1 : 0] compare_8_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_9_L,
      input wire [DATA_WIDTH-1 : 0] compare_9_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_10_L,
      input wire [DATA_WIDTH-1 : 0] compare_10_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_11_L,
      input wire [DATA_WIDTH-1 : 0] compare_11_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_12_L,
      input wire [DATA_WIDTH-1 : 0] compare_12_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_13_L,
      input wire [DATA_WIDTH-1 : 0] compare_13_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_14_L,
      input wire [DATA_WIDTH-1 : 0] compare_14_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_15_L,
      input wire [DATA_WIDTH-1 : 0] compare_15_H,      
      
      input wire [DATA_WIDTH-1 : 0] compare_16_L,
      input wire [DATA_WIDTH-1 : 0] compare_16_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_17_L,
      input wire [DATA_WIDTH-1 : 0] compare_17_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_18_L,
      input wire [DATA_WIDTH-1 : 0] compare_18_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_19_L,
      input wire [DATA_WIDTH-1 : 0] compare_19_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_20_L,
      input wire [DATA_WIDTH-1 : 0] compare_20_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_21_L,
      input wire [DATA_WIDTH-1 : 0] compare_21_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_22_L,
      input wire [DATA_WIDTH-1 : 0] compare_22_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_23_L,
      input wire [DATA_WIDTH-1 : 0] compare_23_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_24_L,
      input wire [DATA_WIDTH-1 : 0] compare_24_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_25_L,
      input wire [DATA_WIDTH-1 : 0] compare_25_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_26_L,
      input wire [DATA_WIDTH-1 : 0] compare_26_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_27_L,
      input wire [DATA_WIDTH-1 : 0] compare_27_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_28_L,
      input wire [DATA_WIDTH-1 : 0] compare_28_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_29_L,
      input wire [DATA_WIDTH-1 : 0] compare_29_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_30_L,
      input wire [DATA_WIDTH-1 : 0] compare_30_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_31_L,
      input wire [DATA_WIDTH-1 : 0] compare_31_H,       
      
      input wire [DATA_WIDTH-1 : 0] compare_32_L,
      input wire [DATA_WIDTH-1 : 0] compare_32_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_33_L,
      input wire [DATA_WIDTH-1 : 0] compare_33_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_34_L,
      input wire [DATA_WIDTH-1 : 0] compare_34_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_35_L,
      input wire [DATA_WIDTH-1 : 0] compare_35_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_36_L,
      input wire [DATA_WIDTH-1 : 0] compare_36_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_37_L,
      input wire [DATA_WIDTH-1 : 0] compare_37_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_38_L,
      input wire [DATA_WIDTH-1 : 0] compare_38_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_39_L,
      input wire [DATA_WIDTH-1 : 0] compare_39_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_40_L,
      input wire [DATA_WIDTH-1 : 0] compare_40_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_41_L,
      input wire [DATA_WIDTH-1 : 0] compare_41_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_42_L,
      input wire [DATA_WIDTH-1 : 0] compare_42_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_43_L,
      input wire [DATA_WIDTH-1 : 0] compare_43_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_44_L,
      input wire [DATA_WIDTH-1 : 0] compare_44_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_45_L,
      input wire [DATA_WIDTH-1 : 0] compare_45_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_46_L,
      input wire [DATA_WIDTH-1 : 0] compare_46_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_47_L,
      input wire [DATA_WIDTH-1 : 0] compare_47_H,      
      
      input wire [DATA_WIDTH-1 : 0] compare_48_L,
      input wire [DATA_WIDTH-1 : 0] compare_48_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_49_L,
      input wire [DATA_WIDTH-1 : 0] compare_49_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_50_L,
      input wire [DATA_WIDTH-1 : 0] compare_50_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_51_L,
      input wire [DATA_WIDTH-1 : 0] compare_51_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_52_L,
      input wire [DATA_WIDTH-1 : 0] compare_52_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_53_L,
      input wire [DATA_WIDTH-1 : 0] compare_53_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_54_L,
      input wire [DATA_WIDTH-1 : 0] compare_54_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_55_L,
      input wire [DATA_WIDTH-1 : 0] compare_55_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_56_L,
      input wire [DATA_WIDTH-1 : 0] compare_56_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_57_L,
      input wire [DATA_WIDTH-1 : 0] compare_57_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_58_L,
      input wire [DATA_WIDTH-1 : 0] compare_58_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_59_L,
      input wire [DATA_WIDTH-1 : 0] compare_59_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_60_L,
      input wire [DATA_WIDTH-1 : 0] compare_60_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_61_L,
      input wire [DATA_WIDTH-1 : 0] compare_61_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_62_L,
      input wire [DATA_WIDTH-1 : 0] compare_62_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_63_L,
      input wire [DATA_WIDTH-1 : 0] compare_63_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_64_L,
      input wire [DATA_WIDTH-1 : 0] compare_64_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_65_L,
      input wire [DATA_WIDTH-1 : 0] compare_65_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_66_L,
      input wire [DATA_WIDTH-1 : 0] compare_66_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_67_L,
      input wire [DATA_WIDTH-1 : 0] compare_67_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_68_L,
      input wire [DATA_WIDTH-1 : 0] compare_68_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_69_L,
      input wire [DATA_WIDTH-1 : 0] compare_69_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_70_L,
      input wire [DATA_WIDTH-1 : 0] compare_70_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_71_L,
      input wire [DATA_WIDTH-1 : 0] compare_71_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_72_L,
      input wire [DATA_WIDTH-1 : 0] compare_72_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_73_L,
      input wire [DATA_WIDTH-1 : 0] compare_73_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_74_L,
      input wire [DATA_WIDTH-1 : 0] compare_74_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_75_L,
      input wire [DATA_WIDTH-1 : 0] compare_75_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_76_L,
      input wire [DATA_WIDTH-1 : 0] compare_76_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_77_L,
      input wire [DATA_WIDTH-1 : 0] compare_77_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_78_L,
      input wire [DATA_WIDTH-1 : 0] compare_78_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_79_L,
      input wire [DATA_WIDTH-1 : 0] compare_79_H,      
      
      input wire [DATA_WIDTH-1 : 0] compare_80_L,
      input wire [DATA_WIDTH-1 : 0] compare_80_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_81_L,
      input wire [DATA_WIDTH-1 : 0] compare_81_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_82_L,
      input wire [DATA_WIDTH-1 : 0] compare_82_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_83_L,
      input wire [DATA_WIDTH-1 : 0] compare_83_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_84_L,
      input wire [DATA_WIDTH-1 : 0] compare_84_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_85_L,
      input wire [DATA_WIDTH-1 : 0] compare_85_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_86_L,
      input wire [DATA_WIDTH-1 : 0] compare_86_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_87_L,
      input wire [DATA_WIDTH-1 : 0] compare_87_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_88_L,
      input wire [DATA_WIDTH-1 : 0] compare_88_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_89_L,
      input wire [DATA_WIDTH-1 : 0] compare_89_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_90_L,
      input wire [DATA_WIDTH-1 : 0] compare_90_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_91_L,
      input wire [DATA_WIDTH-1 : 0] compare_91_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_92_L,
      input wire [DATA_WIDTH-1 : 0] compare_92_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_93_L,
      input wire [DATA_WIDTH-1 : 0] compare_93_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_94_L,
      input wire [DATA_WIDTH-1 : 0] compare_94_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_95_L,
      input wire [DATA_WIDTH-1 : 0] compare_95_H,       
      
      input wire [DATA_WIDTH-1 : 0] compare_96_L,
      input wire [DATA_WIDTH-1 : 0] compare_96_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_97_L,
      input wire [DATA_WIDTH-1 : 0] compare_97_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_98_L,
      input wire [DATA_WIDTH-1 : 0] compare_98_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_99_L,
      input wire [DATA_WIDTH-1 : 0] compare_99_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_100_L,
      input wire [DATA_WIDTH-1 : 0] compare_100_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_101_L,
      input wire [DATA_WIDTH-1 : 0] compare_101_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_102_L,
      input wire [DATA_WIDTH-1 : 0] compare_102_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_103_L,
      input wire [DATA_WIDTH-1 : 0] compare_103_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_104_L,
      input wire [DATA_WIDTH-1 : 0] compare_104_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_105_L,
      input wire [DATA_WIDTH-1 : 0] compare_105_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_106_L,
      input wire [DATA_WIDTH-1 : 0] compare_106_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_107_L,
      input wire [DATA_WIDTH-1 : 0] compare_107_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_108_L,
      input wire [DATA_WIDTH-1 : 0] compare_108_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_109_L,
      input wire [DATA_WIDTH-1 : 0] compare_109_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_110_L,
      input wire [DATA_WIDTH-1 : 0] compare_110_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_111_L,
      input wire [DATA_WIDTH-1 : 0] compare_111_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_112_L,
      input wire [DATA_WIDTH-1 : 0] compare_112_H,      
      
      input wire [DATA_WIDTH-1 : 0] compare_113_L,
      input wire [DATA_WIDTH-1 : 0] compare_113_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_114_L,
      input wire [DATA_WIDTH-1 : 0] compare_114_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_115_L,
      input wire [DATA_WIDTH-1 : 0] compare_115_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_116_L,
      input wire [DATA_WIDTH-1 : 0] compare_116_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_117_L,
      input wire [DATA_WIDTH-1 : 0] compare_117_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_118_L,
      input wire [DATA_WIDTH-1 : 0] compare_118_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_119_L,
      input wire [DATA_WIDTH-1 : 0] compare_119_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_120_L,
      input wire [DATA_WIDTH-1 : 0] compare_120_H, 
      
      input wire [DATA_WIDTH-1 : 0] compare_121_L,
      input wire [DATA_WIDTH-1 : 0] compare_121_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_122_L,
      input wire [DATA_WIDTH-1 : 0] compare_122_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_123_L,
      input wire [DATA_WIDTH-1 : 0] compare_123_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_124_L,
      input wire [DATA_WIDTH-1 : 0] compare_124_H,  
      
      input wire [DATA_WIDTH-1 : 0] compare_125_L,
      input wire [DATA_WIDTH-1 : 0] compare_125_H,
   
      input wire [DATA_WIDTH-1 : 0] compare_126_L,
      input wire [DATA_WIDTH-1 : 0] compare_126_H,
      
      input wire [DATA_WIDTH-1 : 0] compare_127_L,
      input wire [DATA_WIDTH-1 : 0] compare_127_H,
      
      output wire dout_valid,
      output wire [127 : 0] descriptor
    );
    wire [127 : 0] compare_out;

    wire o_valid_coor_generate;

              
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit0(
        
        .clk(clk),
        
        .compare_A(compare_0_L),
        .compare_B(compare_0_H),
        .compare_out(compare_out[0])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit1(
        
        .clk(clk),
        
        .compare_A(compare_1_L),
        .compare_B(compare_1_H),
        .compare_out(compare_out[1])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit2(
        
        .clk(clk),
        
        .compare_A(compare_2_L),
        .compare_B(compare_2_H),
        .compare_out(compare_out[2])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit3(
        
        .clk(clk),
        
        .compare_A(compare_3_L),
        .compare_B(compare_3_H),
        .compare_out(compare_out[3])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit4(
        
        .clk(clk),
        
        .compare_A(compare_4_L),
        .compare_B(compare_4_H),
        .compare_out(compare_out[4])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit5(
        
        .clk(clk),
        
        .compare_A(compare_5_L),
        .compare_B(compare_5_H),
        .compare_out(compare_out[5])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit6(
        
        .clk(clk),
        
        .compare_A(compare_6_L),
        .compare_B(compare_6_H),
        .compare_out(compare_out[6])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit7(
        
        .clk(clk),
        
        .compare_A(compare_7_L),
        .compare_B(compare_7_H),
        .compare_out(compare_out[7])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit8(
        
        .clk(clk),
        
        .compare_A(compare_8_L),
        .compare_B(compare_8_H),
        .compare_out(compare_out[8])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit9(
        
        .clk(clk),
        
        .compare_A(compare_9_L),
        .compare_B(compare_9_H),
        .compare_out(compare_out[9])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit10(
        
        .clk(clk),
        
        .compare_A(compare_10_L),
        .compare_B(compare_10_H),
        .compare_out(compare_out[10])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit11(
        
        .clk(clk),
        
        .compare_A(compare_11_L),
        .compare_B(compare_11_H),
        .compare_out(compare_out[11])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit12(
        
        .clk(clk),
        
        .compare_A(compare_12_L),
        .compare_B(compare_12_H),
        .compare_out(compare_out[12])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit13(
        
        .clk(clk),
        
        .compare_A(compare_13_L),
        .compare_B(compare_13_H),
        .compare_out(compare_out[13])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit14(
        
        .clk(clk),
        
        .compare_A(compare_14_L),
        .compare_B(compare_14_H),
        .compare_out(compare_out[14])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit15(
        
        .clk(clk),
        
        .compare_A(compare_15_L),
        .compare_B(compare_15_H),
        .compare_out(compare_out[15])
        );   
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit16(
        
        .clk(clk),
        
        .compare_A(compare_16_L),
        .compare_B(compare_16_H),
        .compare_out(compare_out[16])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit17(
        
        .clk(clk),
        
        .compare_A(compare_17_L),
        .compare_B(compare_17_H),
        .compare_out(compare_out[17])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit18(
        
        .clk(clk),
        
        .compare_A(compare_18_L),
        .compare_B(compare_18_H),
        .compare_out(compare_out[18])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit19(
        
        .clk(clk),
        
        .compare_A(compare_19_L),
        .compare_B(compare_19_H),
        .compare_out(compare_out[19])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit20(
        
        .clk(clk),
        
        .compare_A(compare_20_L),
        .compare_B(compare_20_H),
        .compare_out(compare_out[20])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit21(
        
        .clk(clk),
        
        .compare_A(compare_21_L),
        .compare_B(compare_21_H),
        .compare_out(compare_out[21])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit22(
        
        .clk(clk),
        
        .compare_A(compare_22_L),
        .compare_B(compare_22_H),
        .compare_out(compare_out[22])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit23(
        
        .clk(clk),
        
        .compare_A(compare_23_L),
        .compare_B(compare_23_H),
        .compare_out(compare_out[23])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit24(
        
        .clk(clk),
        
        .compare_A(compare_24_L),
        .compare_B(compare_24_H),
        .compare_out(compare_out[24])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit25(
        
        .clk(clk),
        
        .compare_A(compare_25_L),
        .compare_B(compare_25_H),
        .compare_out(compare_out[25])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit26(
        
        .clk(clk),
        
        .compare_A(compare_26_L),
        .compare_B(compare_26_H),
        .compare_out(compare_out[26])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit27(
        
        .clk(clk),
        
        .compare_A(compare_27_L),
        .compare_B(compare_27_H),
        .compare_out(compare_out[27])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit28(
        
        .clk(clk),
        
        .compare_A(compare_28_L),
        .compare_B(compare_28_H),
        .compare_out(compare_out[28])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit29(
        
        .clk(clk),
        
        .compare_A(compare_29_L),
        .compare_B(compare_29_H),
        .compare_out(compare_out[29])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit30(
        
        .clk(clk),
        
        .compare_A(compare_30_L),
        .compare_B(compare_30_H),
        .compare_out(compare_out[30])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit31(
        
        .clk(clk),
        
        .compare_A(compare_31_L),
        .compare_B(compare_31_H),
        .compare_out(compare_out[31])
        );   
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit32(
        
        .clk(clk),
        
        .compare_A(compare_32_L),
        .compare_B(compare_32_H),
        .compare_out(compare_out[32])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit33(
        
        .clk(clk),
        
        .compare_A(compare_33_L),
        .compare_B(compare_33_H),
        .compare_out(compare_out[33])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit34(
        
        .clk(clk),
        
        .compare_A(compare_34_L),
        .compare_B(compare_34_H),
        .compare_out(compare_out[34])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit35(
        
        .clk(clk),
        
        .compare_A(compare_35_L),
        .compare_B(compare_35_H),
        .compare_out(compare_out[35])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit36(
        
        .clk(clk),
        
        .compare_A(compare_36_L),
        .compare_B(compare_36_H),
        .compare_out(compare_out[36])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit37(
        
        .clk(clk),
        
        .compare_A(compare_37_L),
        .compare_B(compare_37_H),
        .compare_out(compare_out[37])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit38(
        
        .clk(clk),
        
        .compare_A(compare_38_L),
        .compare_B(compare_38_H),
        .compare_out(compare_out[38])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit39(
        
        .clk(clk),
        
        .compare_A(compare_39_L),
        .compare_B(compare_39_H),
        .compare_out(compare_out[39])
        );                     
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit40(
        
        .clk(clk),
        
        .compare_A(compare_40_L),
        .compare_B(compare_40_H),
        .compare_out(compare_out[40])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit41(
        
        .clk(clk),
        
        .compare_A(compare_41_L),
        .compare_B(compare_41_H),
        .compare_out(compare_out[41])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit42(
        
        .clk(clk),
        
        .compare_A(compare_42_L),
        .compare_B(compare_42_H),
        .compare_out(compare_out[42])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit43(
        
        .clk(clk),
        
        .compare_A(compare_43_L),
        .compare_B(compare_43_H),
        .compare_out(compare_out[43])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit44(
        
        .clk(clk),
        
        .compare_A(compare_44_L),
        .compare_B(compare_44_H),
        .compare_out(compare_out[44])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit45(
        
        .clk(clk),
        
        .compare_A(compare_45_L),
        .compare_B(compare_45_H),
        .compare_out(compare_out[45])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit46(
        
        .clk(clk),
        
        .compare_A(compare_46_L),
        .compare_B(compare_46_H),
        .compare_out(compare_out[46])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit47(
        
        .clk(clk),
        
        .compare_A(compare_47_L),
        .compare_B(compare_47_H),
        .compare_out(compare_out[47])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit48(
        
        .clk(clk),
        
        .compare_A(compare_48_L),
        .compare_B(compare_48_H),
        .compare_out(compare_out[48])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit49(
        
        .clk(clk),
        
        .compare_A(compare_49_L),
        .compare_B(compare_49_H),
        .compare_out(compare_out[49])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit50(
        
        .clk(clk),
        
        .compare_A(compare_50_L),
        .compare_B(compare_50_H),
        .compare_out(compare_out[50])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit51(
        
        .clk(clk),
        
        .compare_A(compare_51_L),
        .compare_B(compare_51_H),
        .compare_out(compare_out[51])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit52(
        
        .clk(clk),
        
        .compare_A(compare_52_L),
        .compare_B(compare_52_H),
        .compare_out(compare_out[52])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit53(
        
        .clk(clk),
        
        .compare_A(compare_53_L),
        .compare_B(compare_53_H),
        .compare_out(compare_out[53])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit54(
        
        .clk(clk),
        
        .compare_A(compare_54_L),
        .compare_B(compare_54_H),
        .compare_out(compare_out[54])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit55(
        
        .clk(clk),
        
        .compare_A(compare_55_L),
        .compare_B(compare_55_H),
        .compare_out(compare_out[55])
        );   
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit56(
        
        .clk(clk),
        
        .compare_A(compare_56_L),
        .compare_B(compare_56_H),
        .compare_out(compare_out[56])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit57(
        
        .clk(clk),
        
        .compare_A(compare_57_L),
        .compare_B(compare_57_H),
        .compare_out(compare_out[57])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit58(
        
        .clk(clk),
        
        .compare_A(compare_58_L),
        .compare_B(compare_58_H),
        .compare_out(compare_out[58])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit59(
        
        .clk(clk),
        
        .compare_A(compare_59_L),
        .compare_B(compare_59_H),
        .compare_out(compare_out[59])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit60(
        
        .clk(clk),
        
        .compare_A(compare_60_L),
        .compare_B(compare_60_H),
        .compare_out(compare_out[60])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit61(
        
        .clk(clk),
        
        .compare_A(compare_61_L),
        .compare_B(compare_61_H),
        .compare_out(compare_out[61])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit62(
        
        .clk(clk),
        
        .compare_A(compare_62_L),
        .compare_B(compare_62_H),
        .compare_out(compare_out[62])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit63(
        
        .clk(clk),
        
        .compare_A(compare_63_L),
        .compare_B(compare_63_H),
        .compare_out(compare_out[63])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit64(
        
        .clk(clk),
        
        .compare_A(compare_64_L),
        .compare_B(compare_64_H),
        .compare_out(compare_out[64])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit65(
        
        .clk(clk),
        
        .compare_A(compare_65_L),
        .compare_B(compare_65_H),
        .compare_out(compare_out[65])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit66(
        
        .clk(clk),
        
        .compare_A(compare_66_L),
        .compare_B(compare_66_H),
        .compare_out(compare_out[66])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit67(
        
        .clk(clk),
        
        .compare_A(compare_67_L),
        .compare_B(compare_67_H),
        .compare_out(compare_out[67])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit68(
        
        .clk(clk),
        
        .compare_A(compare_68_L),
        .compare_B(compare_68_H),
        .compare_out(compare_out[68])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit69(
        
        .clk(clk),
        
        .compare_A(compare_69_L),
        .compare_B(compare_69_H),
        .compare_out(compare_out[69])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit70(
        
        .clk(clk),
        
        .compare_A(compare_70_L),
        .compare_B(compare_70_H),
        .compare_out(compare_out[70])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit71(
        
        .clk(clk),
        
        .compare_A(compare_71_L),
        .compare_B(compare_71_H),
        .compare_out(compare_out[71])
        );   
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit72(
        
        .clk(clk),
        
        .compare_A(compare_72_L),
        .compare_B(compare_72_H),
        .compare_out(compare_out[72])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit73(
        
        .clk(clk),
        
        .compare_A(compare_73_L),
        .compare_B(compare_73_H),
        .compare_out(compare_out[73])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit74(
        
        .clk(clk),
        
        .compare_A(compare_74_L),
        .compare_B(compare_74_H),
        .compare_out(compare_out[74])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit75(
        
        .clk(clk),
        
        .compare_A(compare_75_L),
        .compare_B(compare_75_H),
        .compare_out(compare_out[75])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit76(
        
        .clk(clk),
        
        .compare_A(compare_76_L),
        .compare_B(compare_76_H),
        .compare_out(compare_out[76])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit77(
        
        .clk(clk),
        
        .compare_A(compare_77_L),
        .compare_B(compare_77_H),
        .compare_out(compare_out[77])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit78(
        
        .clk(clk),
        
        .compare_A(compare_78_L),
        .compare_B(compare_78_H),
        .compare_out(compare_out[78])
        );            
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit79(
        
        .clk(clk),
        
        .compare_A(compare_79_L),
        .compare_B(compare_79_H),
        .compare_out(compare_out[79])
        );                                         
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit80(
        
        .clk(clk),
        
        .compare_A(compare_80_L),
        .compare_B(compare_80_H),
        .compare_out(compare_out[80])
        );
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit81(
        
        .clk(clk),
        
        .compare_A(compare_81_L),
        .compare_B(compare_81_H),
        .compare_out(compare_out[81])
         );        
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit82(
        
        .clk(clk),
        
        .compare_A(compare_82_L),
        .compare_B(compare_82_H),
        .compare_out(compare_out[82])
        );            
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit83(
        
        .clk(clk),
        
        .compare_A(compare_83_L),
        .compare_B(compare_83_H),
        .compare_out(compare_out[83])
        ); 
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit84(
        
        .clk(clk),
        
        .compare_A(compare_84_L),
        .compare_B(compare_84_H),
        .compare_out(compare_out[84])
        );
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit85(
        
        .clk(clk),
        
        .compare_A(compare_85_L),
        .compare_B(compare_85_H),
        .compare_out(compare_out[85])
        );        
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit86(
        
        .clk(clk),
        
        .compare_A(compare_86_L),
        .compare_B(compare_86_H),
        .compare_out(compare_out[86])
        );            
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit87(
        
        .clk(clk),
        
        .compare_A(compare_87_L),
        .compare_B(compare_87_H),
        .compare_out(compare_out[87])
        );
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit88(
        
        .clk(clk),
        
        .compare_A(compare_88_L),
        .compare_B(compare_88_H),
        .compare_out(compare_out[88])
        );
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit89(
        
        .clk(clk),
        
        .compare_A(compare_89_L),
        .compare_B(compare_89_H),
        .compare_out(compare_out[89])
        );                                                                        
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit90(
        
        .clk(clk),
        
        .compare_A(compare_90_L),
        .compare_B(compare_90_H),
        .compare_out(compare_out[90])
        );
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit91(
        
        .clk(clk),
        
        .compare_A(compare_91_L),
        .compare_B(compare_91_H),
        .compare_out(compare_out[91])
        );        
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit92(
        
        .clk(clk),
        
        .compare_A(compare_92_L),
        .compare_B(compare_92_H),
        .compare_out(compare_out[92])
        );            
   brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit93(
        
        .clk(clk),
        
        .compare_A(compare_93_L),
        .compare_B(compare_93_H),
        .compare_out(compare_out[93])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit94(
        
        .clk(clk),
        
        .compare_A(compare_94_L),
        .compare_B(compare_94_H),
        .compare_out(compare_out[94])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit95(
        
        .clk(clk),
        
        .compare_A(compare_95_L),
        .compare_B(compare_95_H),
        .compare_out(compare_out[95])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit96(
        
        .clk(clk),
        
        .compare_A(compare_96_L),
        .compare_B(compare_96_H),
        .compare_out(compare_out[96])
        );            
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit97(
        
        .clk(clk),
        
        .compare_A(compare_97_L),
        .compare_B(compare_97_H),
        .compare_out(compare_out[97])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit98(
        
        .clk(clk),
        
        .compare_A(compare_98_L),
        .compare_B(compare_98_H),
        .compare_out(compare_out[98])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit99(
        
        .clk(clk),
        
        .compare_A(compare_99_L),
        .compare_B(compare_99_H),
        .compare_out(compare_out[99])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit100(
        
        .clk(clk),
        
        .compare_A(compare_100_L),
        .compare_B(compare_100_H),
        .compare_out(compare_out[100])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit101(
        
        .clk(clk),
        
        .compare_A(compare_101_L),
        .compare_B(compare_101_H),
        .compare_out(compare_out[101])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit102(
        
        .clk(clk),
        
        .compare_A(compare_102_L),
        .compare_B(compare_102_H),
        .compare_out(compare_out[102])
        );            
     brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit103(
        
        .clk(clk),
        
        .compare_A(compare_103_L),
        .compare_B(compare_103_H),
        .compare_out(compare_out[103])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit104(
        
        .clk(clk),
        
        .compare_A(compare_104_L),
        .compare_B(compare_104_H),
        .compare_out(compare_out[104])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit105(
        
        .clk(clk),
        
        .compare_A(compare_105_L),
        .compare_B(compare_105_H),
        .compare_out(compare_out[105])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit106(
        
        .clk(clk),
        
        .compare_A(compare_106_L),
        .compare_B(compare_106_H),
        .compare_out(compare_out[106])
        );            
     brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit107(
        
        .clk(clk),
        
        .compare_A(compare_107_L),
        .compare_B(compare_107_H),
        .compare_out(compare_out[107])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit108(
        
        .clk(clk),
        
        .compare_A(compare_108_L),
        .compare_B(compare_108_H),
        .compare_out(compare_out[108])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit109(
        
        .clk(clk),
        
        .compare_A(compare_109_L),
        .compare_B(compare_109_H),
        .compare_out(compare_out[109])
        );                                
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit110(
        
        .clk(clk),
        
        .compare_A(compare_110_L),
        .compare_B(compare_110_H),
        .compare_out(compare_out[110])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit111(
        
        .clk(clk),
        
        .compare_A(compare_111_L),
        .compare_B(compare_111_H),
        .compare_out(compare_out[111])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit112(
        
        .clk(clk),
        
        .compare_A(compare_112_L),
        .compare_B(compare_112_H),
        .compare_out(compare_out[112])
        );            
     brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit113(
        
        .clk(clk),
        
        .compare_A(compare_113_L),
        .compare_B(compare_113_H),
        .compare_out(compare_out[113])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit114(
        
        .clk(clk),
        
        .compare_A(compare_114_L),
        .compare_B(compare_114_H),
        .compare_out(compare_out[114])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit115(
        
        .clk(clk),
        
        .compare_A(compare_115_L),
        .compare_B(compare_115_H),
        .compare_out(compare_out[115])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit116(
        
        .clk(clk),
        
        .compare_A(compare_116_L),
        .compare_B(compare_116_H),
        .compare_out(compare_out[116])
        );            
     brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit117(
        
        .clk(clk),
        
        .compare_A(compare_117_L),
        .compare_B(compare_117_H),
        .compare_out(compare_out[117])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit118(
        
        .clk(clk),
        
        .compare_A(compare_118_L),
        .compare_B(compare_118_H),
        .compare_out(compare_out[118])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit119(
        
        .clk(clk),
        
        .compare_A(compare_119_L),
        .compare_B(compare_119_H),
        .compare_out(compare_out[119])
        );                                                                                    
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit120(
        
        .clk(clk),
        
        .compare_A(compare_120_L),
        .compare_B(compare_120_H),
        .compare_out(compare_out[120])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit121(
        
        .clk(clk),
        
        .compare_A(compare_121_L),
        .compare_B(compare_121_H),
        .compare_out(compare_out[121])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit122(
        
        .clk(clk),
        
        .compare_A(compare_122_L),
        .compare_B(compare_122_H),
        .compare_out(compare_out[122])
        );            
     brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit123(
        
        .clk(clk),
        
        .compare_A(compare_123_L),
        .compare_B(compare_123_H),
        .compare_out(compare_out[123])
        ); 
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit124(
        
        .clk(clk),
        
        .compare_A(compare_124_L),
        .compare_B(compare_124_H),
        .compare_out(compare_out[124])
        );
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit125(
        
        .clk(clk),
        
        .compare_A(compare_125_L),
        .compare_B(compare_125_H),
        .compare_out(compare_out[125])
        );        
    brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit126(
        
        .clk(clk),
        
        .compare_A(compare_126_L),
        .compare_B(compare_126_H),
        .compare_out(compare_out[126])
        );            
     brief_compare #(.DATA_WIDTH(DATA_WIDTH)) compare_bit127(
        
        .clk(clk),
        
        .compare_A(compare_127_L),
        .compare_B(compare_127_H),
        .compare_out(compare_out[127])
        );

    localparam maxValidLatency = 1;
    reg [maxValidLatency-1:0] valid_delay;
    integer i;
    always @(posedge clk) begin
        for(i=0; i<maxValidLatency-1; i=i+1)
            valid_delay[i+1] <= valid_delay[i];
        valid_delay[0] <= din_valid;
    end
    assign dout_valid = valid_delay[maxValidLatency-1];

assign descriptor = dout_valid ? compare_out : 'd0;

endmodule

