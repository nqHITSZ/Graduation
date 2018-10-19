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


module regs7 
#(
parameter DATA_WIDTH = 8,
parameter REGDEPTH = 7
)
(
input wire clk,
input wire rst,
input wire [DATA_WIDTH - 1:0] din,
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
        

assign    reg07 = mem[06];
assign    reg06 = mem[05];
assign    reg05 = mem[04];
assign    reg04 = mem[03];
assign    reg03 = mem[02];
assign    reg02 = mem[01];
assign    reg01 = mem[00];
        
        
endmodule
