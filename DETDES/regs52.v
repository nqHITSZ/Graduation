`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: NQ
// 
// Create Date: 2018/09/02 08:27:06
// Design Name: 
// Module Name: regs52
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


module regs52 
#(
parameter DATA_WIDTH = 5'd28,
parameter REGDEPTH = 6'd52
)
(
input wire clk,
input wire rst,
input wire [DATA_WIDTH - 1:0] din,
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

reg [DATA_WIDTH - 1:0] mem[REGDEPTH - 1:0];

genvar i;
generate
    for(i = 1;i < REGDEPTH;i = i + 1)
    begin
        always @(posedge clk)
        begin
            if(rst)
            begin
                mem[i] <= 'd0;
                mem[0] <= 'd0;
            end
            else
            begin
                mem[0] <= din;
                mem[i] <= mem[i - 1];
            end
        end
    end
endgenerate
        

assign    reg52 = mem[REGDEPTH - 1];
assign    reg51 = mem[REGDEPTH - 2];
assign    reg50 = mem[REGDEPTH - 3];
assign    reg49 = mem[REGDEPTH - 4];
assign    reg48 = mem[REGDEPTH - 5];
assign    reg47 = mem[REGDEPTH - 6];
assign    reg46 = mem[REGDEPTH - 7];
assign    reg45 = mem[REGDEPTH - 8];
assign    reg44 = mem[REGDEPTH - 9];
assign    reg43 = mem[REGDEPTH - 10];
assign    reg42 = mem[REGDEPTH - 11];
assign    reg41 = mem[REGDEPTH - 12];
assign    reg40 = mem[REGDEPTH - 13];
assign    reg39 = mem[REGDEPTH - 14];
assign    reg38 = mem[REGDEPTH - 15];
assign    reg37 = mem[REGDEPTH - 16];
assign    reg36 = mem[REGDEPTH - 17];
assign    reg35 = mem[REGDEPTH - 18];
assign    reg34 = mem[REGDEPTH - 19];
assign    reg33 = mem[REGDEPTH - 20];
assign    reg32 = mem[REGDEPTH - 21];
assign    reg31 = mem[REGDEPTH - 22];
assign    reg30 = mem[REGDEPTH - 23];
assign    reg29 = mem[REGDEPTH - 24];
assign    reg28 = mem[REGDEPTH - 25];
assign    reg27 = mem[REGDEPTH - 26];
assign    reg26 = mem[REGDEPTH - 27];
assign    reg25 = mem[REGDEPTH - 28];
assign    reg24 = mem[REGDEPTH - 29];
assign    reg23 = mem[REGDEPTH - 30];
assign    reg22 = mem[REGDEPTH - 31];
assign    reg21 = mem[REGDEPTH - 32];
assign    reg20 = mem[REGDEPTH - 33];
assign    reg19 = mem[REGDEPTH - 34];
assign    reg18 = mem[REGDEPTH - 35];
assign    reg17 = mem[REGDEPTH - 36];
assign    reg16 = mem[REGDEPTH - 37];
assign    reg15 = mem[REGDEPTH - 38];
assign    reg14 = mem[REGDEPTH - 39];
assign    reg13 = mem[REGDEPTH - 40];
assign    reg12 = mem[REGDEPTH - 41];
assign    reg11 = mem[REGDEPTH - 42];
assign    reg10 = mem[REGDEPTH - 43];
assign    reg09 = mem[REGDEPTH - 44];
assign    reg08 = mem[REGDEPTH - 45];
assign    reg07 = mem[REGDEPTH - 46];
assign    reg06 = mem[REGDEPTH - 47];
assign    reg05 = mem[REGDEPTH - 48];
assign    reg04 = mem[REGDEPTH - 49];
assign    reg03 = mem[REGDEPTH - 50];
assign    reg02 = mem[REGDEPTH - 51];
assign    reg01 = mem[REGDEPTH - 52];
        
        
endmodule
