`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: NQ
// 
// Create Date: 2018/10/5 19:34:13
// Design Name: 
// Module Name: compare
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


module brief_compare  #( parameter DATA_WIDTH = 14 )
   (
    input wire clk,
    input wire [DATA_WIDTH-1:0]compare_A,
    input wire [DATA_WIDTH-1:0]compare_B,
    output reg compare_out
    );
    always@(posedge clk)
        if(compare_A < compare_B)
          compare_out <= 1'b1;
        else
          compare_out <= 1'b0;

endmodule
