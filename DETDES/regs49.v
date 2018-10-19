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


module regs49 
#(
parameter DATA_WIDTH = 14,
parameter REGDEPTH = 49
)
(
input wire clk,
input wire rst,
input wire [DATA_WIDTH - 1:0] din,

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
        


assign    reg49 = mem[48];
assign    reg48 = mem[47];
assign    reg47 = mem[46];
assign    reg46 = mem[45];
assign    reg45 = mem[44];
assign    reg44 = mem[43];
assign    reg43 = mem[42];
assign    reg42 = mem[41];
assign    reg41 = mem[40];
assign    reg40 = mem[39];
assign    reg39 = mem[38];
assign    reg38 = mem[37];
assign    reg37 = mem[36];
assign    reg36 = mem[35];
assign    reg35 = mem[34];
assign    reg34 = mem[33];
assign    reg33 = mem[32];
assign    reg32 = mem[31];
assign    reg31 = mem[30];
assign    reg30 = mem[29];
assign    reg29 = mem[28];
assign    reg28 = mem[27];
assign    reg27 = mem[26];
assign    reg26 = mem[25];
assign    reg25 = mem[24];
assign    reg24 = mem[23];
assign    reg23 = mem[22];
assign    reg22 = mem[21];
assign    reg21 = mem[20];
assign    reg20 = mem[19];
assign    reg19 = mem[18];
assign    reg18 = mem[17];
assign    reg17 = mem[16];
assign    reg16 = mem[15];
assign    reg15 = mem[14];
assign    reg14 = mem[13];
assign    reg13 = mem[12];
assign    reg12 = mem[11];
assign    reg11 = mem[10];
assign    reg10 = mem[09];
assign    reg09 = mem[08];
assign    reg08 = mem[07];
assign    reg07 = mem[06];
assign    reg06 = mem[05];
assign    reg05 = mem[04];
assign    reg04 = mem[03];
assign    reg03 = mem[02];
assign    reg02 = mem[01];
assign    reg01 = mem[00];
        
        
endmodule
