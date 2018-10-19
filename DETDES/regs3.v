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


module regs_3 
#(
parameter DATA_WIDTH = 32,
parameter REGDEPTH = 3
)
(
input wire clk,
input wire rst,
input wire [DATA_WIDTH - 1:0] din,

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
        


assign    reg03 = mem[2];
assign    reg02 = mem[1];
assign    reg01 = mem[0];
        
        
endmodule
