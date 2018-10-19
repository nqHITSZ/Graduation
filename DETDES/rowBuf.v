`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 13:25:48
// Design Name: 
// Module Name: rowBuf
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


module rowBuf
#(
    parameter REGSNUM = 6'd52,
    parameter DATA_WIDTH = 5'd28,
    parameter IMAGE_WIDTH = 10'd640
)
(
    input wire [DATA_WIDTH - 1:0] din,
    input wire clk,
    input wire rst,
    output wire [DATA_WIDTH - 1:0] dout,
    output wire [DATA_WIDTH - 1:0] reg52,
    output wire [DATA_WIDTH - 1:0] reg51,
    output wire [DATA_WIDTH - 1:0] reg50,
    output wire [DATA_WIDTH - 1:0] reg49,
    output wire [DATA_WIDTH - 1:0] reg48,
    output wire [DATA_WIDTH - 1:0] reg47,
    output wire [DATA_WIDTH - 1:0] reg46,
    output wire [DATA_WIDTH - 1:0] reg45,
    output wire [DATA_WIDTH - 1:0] reg44,
    output wire [DATA_WIDTH - 1:0] reg43,
    output wire [DATA_WIDTH - 1:0] reg42,
    output wire [DATA_WIDTH - 1:0] reg41,
    output wire [DATA_WIDTH - 1:0] reg40,
    output wire [DATA_WIDTH - 1:0] reg39,
    output wire [DATA_WIDTH - 1:0] reg38,
    output wire [DATA_WIDTH - 1:0] reg37,
    output wire [DATA_WIDTH - 1:0] reg36,
    output wire [DATA_WIDTH - 1:0] reg35,
    output wire [DATA_WIDTH - 1:0] reg34,
    output wire [DATA_WIDTH - 1:0] reg33,
    output wire [DATA_WIDTH - 1:0] reg32,
    output wire [DATA_WIDTH - 1:0] reg31,
    output wire [DATA_WIDTH - 1:0] reg30,
    output wire [DATA_WIDTH - 1:0] reg29,
    output wire [DATA_WIDTH - 1:0] reg28,
    output wire [DATA_WIDTH - 1:0] reg27,
    output wire [DATA_WIDTH - 1:0] reg26,
    output wire [DATA_WIDTH - 1:0] reg25,
    output wire [DATA_WIDTH - 1:0] reg24,
    output wire [DATA_WIDTH - 1:0] reg23,
    output wire [DATA_WIDTH - 1:0] reg22,
    output wire [DATA_WIDTH - 1:0] reg21,
    output wire [DATA_WIDTH - 1:0] reg20,
    output wire [DATA_WIDTH - 1:0] reg19,
    output wire [DATA_WIDTH - 1:0] reg18,
    output wire [DATA_WIDTH - 1:0] reg17,
    output wire [DATA_WIDTH - 1:0] reg16,
    output wire [DATA_WIDTH - 1:0] reg15,
    output wire [DATA_WIDTH - 1:0] reg14,
    output wire [DATA_WIDTH - 1:0] reg13,
    output wire [DATA_WIDTH - 1:0] reg12,
    output wire [DATA_WIDTH - 1:0] reg11,
    output wire [DATA_WIDTH - 1:0] reg10,
    output wire [DATA_WIDTH - 1:0] reg09,
    output wire [DATA_WIDTH - 1:0] reg08,
    output wire [DATA_WIDTH - 1:0] reg07,
    output wire [DATA_WIDTH - 1:0] reg06,
    output wire [DATA_WIDTH - 1:0] reg05,
    output wire [DATA_WIDTH - 1:0] reg04,
    output wire [DATA_WIDTH - 1:0] reg03,
    output wire [DATA_WIDTH - 1:0] reg02,
    output wire [DATA_WIDTH - 1:0] reg01
);



wire [DATA_WIDTH - 1:0] o_d_fifo; //fifo数据输出



/************************************
* 寄存器链52模块例化
************************************/
regs52 inst_regs52(
    .clk (clk),
    .rst (rst),
    .din (din),
    .reg52 (reg52),
    .reg51 (reg51),
    .reg50 (reg50),
    .reg49 (reg49),
    .reg48 (reg48),
    .reg47 (reg47),
    .reg46 (reg46),
    .reg45 (reg45),
    .reg44 (reg44),
    .reg43 (reg43),
    .reg42 (reg42),
    .reg41 (reg41),
    .reg40 (reg40),
    .reg39 (reg39),
    .reg38 (reg38),
    .reg37 (reg37),
    .reg36 (reg36),
    .reg35 (reg35),
    .reg34 (reg34),
    .reg33 (reg33),
    .reg32 (reg32),
    .reg31 (reg31),
    .reg30 (reg30),
    .reg29 (reg29),
    .reg28 (reg28),
    .reg27 (reg27),
    .reg26 (reg26),
    .reg25 (reg25),
    .reg24 (reg24),
    .reg23 (reg23),
    .reg22 (reg22),
    .reg21 (reg21),
    .reg20 (reg20),
    .reg19 (reg19),
    .reg18 (reg18),
    .reg17 (reg17),
    .reg16 (reg16),
    .reg15 (reg15),
    .reg14 (reg14),
    .reg13 (reg13),
    .reg12 (reg12),
    .reg11 (reg11),
    .reg10 (reg10),
    .reg09 (reg09),
    .reg08 (reg08),
    .reg07 (reg07),
    .reg06 (reg06),
    .reg05 (reg05),
    .reg04 (reg04),
    .reg03 (reg03),
    .reg02 (reg02),
    .reg01 (reg01)
);



ShiftRegisterBRAM //FIFO STYLE
#(
    .DATA_DEPTH(IMAGE_WIDTH-REGSNUM),
    .DATA_WIDTH(DATA_WIDTH)
)
SRB_u
(
    .clk(clk),
    .rst(rst),
    .shift_in(reg52),
    .shift_out(o_d_fifo)
);

assign dout = o_d_fifo;

endmodule
