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


module RowBuf7
#(
    parameter REGSNUM = 7,
    parameter DATA_WIDTH = 8,
    parameter IMAGE_WIDTH = 640
)
(
    input wire [DATA_WIDTH - 1:0] din,
    input wire clk,
    input wire rst,
    output wire [DATA_WIDTH - 1:0] dout,
    output wire [DATA_WIDTH - 1:0] reg07,
    output wire [DATA_WIDTH - 1:0] reg06,
    output wire [DATA_WIDTH - 1:0] reg05,
    output wire [DATA_WIDTH - 1:0] reg04,
    output wire [DATA_WIDTH - 1:0] reg03,
    output wire [DATA_WIDTH - 1:0] reg02,
    output wire [DATA_WIDTH - 1:0] reg01
);



wire [DATA_WIDTH - 1:0] o_d_SR; //output of the shift register



regs7 inst_regs7(
    .clk (clk),
    .rst (rst),
    .din (din),
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
    .shift_in(reg07),
    .shift_out(o_d_SR)
);

assign dout = o_d_SR;

endmodule
