`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/13 16:48:07
// Design Name: 
// Module Name: _top
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


module _top(
    input clk,
    input rst,
    input start,
    output wire[59:0] dout,
    output wire dout_valid

    );
    
    
wire [9:0] R_R_addr;
wire [147:0] R_R_data;
wire [9:0] R_L_addr;
wire [147:0] R_L_data;
wire [9:0] R_P_addr;
wire [147:0] R_P_data;

bram_sd
#(
    .ADDR_WIDTH(10),
    .DATA_DEPTH(1024),
    .DATA_WIDTH(148)
)
RAM_1
(
    .clk(clk),
    .raddr(R_R_addr),
    .re(1),
    .waddr(),
    .we(0),
    .din(),
    .dout(R_R_data)
);

bram_sd
#(
    .ADDR_WIDTH(10),
    .DATA_DEPTH(1024),
    .DATA_WIDTH(148)
)
RAM_2
(
    .clk(clk),
    .raddr(R_L_addr),
    .re(1),
    .waddr(),
    .we(0),
    .din(),
    .dout(R_L_data)
);

bram_sd
#(
    .ADDR_WIDTH(10),
    .DATA_DEPTH(1024),
    .DATA_WIDTH(148)
)
RAM_3
(
    .clk(clk),
    .raddr(R_P_addr),
    .re(1),
    .waddr(),
    .we(0),
    .din(),
    .dout(R_P_data)
);


Ctrl u_ctrl(
    .clk(clk),
    .rst(rst),
    .start(start),
    
    .dout(dout),
    .dout_valid(dout_valid),
    
    //RAM interface
    .R_R_addr(R_R_addr),
    .R_R_data(R_R_data),
    .R_L_addr(R_L_addr),
    .R_L_data(R_L_data),
    .R_P_addr(R_P_addr),
    .R_P_data(R_P_data)
    );

endmodule

