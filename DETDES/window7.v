`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: NQ
// 
// Create Date: 2018/10/5 9:25:37
// Design Name: 
// Module Name: buffer7x7
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


module window7 #(parameter DATA_WIDTH = 8, 
                   parameter IMAGE_WIDTH = 640)
    (
    input  wire [DATA_WIDTH-1:0] din,
    input  wire                  din_valid,
    input  wire                  clk,
    input  wire                  rst,
    output wire                  dout_valid,
    /******************************
    reg_x_y, wher x indicate col and y indicate row.
    ******************************/
    output wire [DATA_WIDTH-1:0] reg_1_3,
    output wire [DATA_WIDTH-1:0] reg_1_4,
    output wire [DATA_WIDTH-1:0] reg_1_5,
    
    output wire [DATA_WIDTH-1:0] reg_2_2,
    output wire [DATA_WIDTH-1:0] reg_2_3,
    output wire [DATA_WIDTH-1:0] reg_2_4,
    output wire [DATA_WIDTH-1:0] reg_2_5,
    output wire [DATA_WIDTH-1:0] reg_2_6,
    
    output wire [DATA_WIDTH-1:0] reg_3_1,
    output wire [DATA_WIDTH-1:0] reg_3_2,
    output wire [DATA_WIDTH-1:0] reg_3_3,
    output wire [DATA_WIDTH-1:0] reg_3_4,
    output wire [DATA_WIDTH-1:0] reg_3_5,
    output wire [DATA_WIDTH-1:0] reg_3_6,
    output wire [DATA_WIDTH-1:0] reg_3_7,
    
    output wire [DATA_WIDTH-1:0] reg_4_1,
    output wire [DATA_WIDTH-1:0] reg_4_2,
    output wire [DATA_WIDTH-1:0] reg_4_3,
    output wire [DATA_WIDTH-1:0] reg_4_4,
    output wire [DATA_WIDTH-1:0] reg_4_5,
    output wire [DATA_WIDTH-1:0] reg_4_6,
    output wire [DATA_WIDTH-1:0] reg_4_7,
    
    output wire [DATA_WIDTH-1:0] reg_5_1,
    output wire [DATA_WIDTH-1:0] reg_5_2,
    output wire [DATA_WIDTH-1:0] reg_5_3,
    output wire [DATA_WIDTH-1:0] reg_5_4,
    output wire [DATA_WIDTH-1:0] reg_5_5,
    output wire [DATA_WIDTH-1:0] reg_5_6,
    output wire [DATA_WIDTH-1:0] reg_5_7,
    
    output wire [DATA_WIDTH-1:0] reg_6_2,
    output wire [DATA_WIDTH-1:0] reg_6_3,
    output wire [DATA_WIDTH-1:0] reg_6_4,
    output wire [DATA_WIDTH-1:0] reg_6_5,
    output wire [DATA_WIDTH-1:0] reg_6_6,
    
    output wire [DATA_WIDTH-1:0] reg_7_3,
    output wire [DATA_WIDTH-1:0] reg_7_4,
    output wire [DATA_WIDTH-1:0] reg_7_5
    );
    wire [DATA_WIDTH-1:0] row_o1,row_o2,row_o3,row_o4,row_o5,row_o6;
   
    wire [DATA_WIDTH-1:0] regs_1_3,regs_1_4,regs_1_5;
    wire [DATA_WIDTH-1:0] regs_2_2,regs_2_3,regs_2_4,regs_2_5,regs_2_6;
    wire [DATA_WIDTH-1:0] regs_3_1,regs_3_2,regs_3_3,regs_3_4,regs_3_5,regs_3_6,regs_3_7;
    wire [DATA_WIDTH-1:0] regs_4_1,regs_4_2,regs_4_3,regs_4_4,regs_4_5,regs_4_6,regs_4_7;
    wire [DATA_WIDTH-1:0] regs_5_1,regs_5_2,regs_5_3,regs_5_4,regs_5_5,regs_5_6,regs_5_7;
    wire [DATA_WIDTH-1:0] regs_6_2,regs_6_3,regs_6_4,regs_6_5,regs_6_6;
    wire [DATA_WIDTH-1:0] regs_7_3,regs_7_4,regs_7_5;
    
    RowBuf7 #(.IMAGE_WIDTH(IMAGE_WIDTH)) buf7_row_buffer1
    (
        .din(din),
        .clk(clk),
        .rst(rst),
        .dout(row_o1),
        .reg01(),
        .reg02(),
        .reg03(regs_1_3),
        .reg04(regs_1_4),
        .reg05(regs_1_5),
        .reg06(),
        .reg07()
    );
    RowBuf7 #(.IMAGE_WIDTH(IMAGE_WIDTH)) buf7_row_buffer2
    (
        .din(row_o1),
        .clk(clk),
        .rst(rst),
        .dout(row_o2),
        .reg01(),
        .reg02(regs_2_2),
        .reg03(regs_2_3),
        .reg04(regs_2_4),
        .reg05(regs_2_5),
        .reg06(regs_2_6),
        .reg07()
    );   
    RowBuf7 #(.IMAGE_WIDTH(IMAGE_WIDTH)) buf7_row_buffer3
    (
        .din(row_o2),
        .clk(clk),
        .rst(rst),
        .dout(row_o3),
        .reg01(regs_3_1),
        .reg02(regs_3_2),
        .reg03(regs_3_3),
        .reg04(regs_3_4),
        .reg05(regs_3_5),
        .reg06(regs_3_6),
        .reg07(regs_3_7)
    ); 
    RowBuf7 #(.IMAGE_WIDTH(IMAGE_WIDTH)) buf7_row_buffer4
    (
        .din(row_o3),
        .clk(clk),
        .rst(rst),
        .dout(row_o4),
        .reg01(regs_4_1),
        .reg02(regs_4_2),
        .reg03(regs_4_3),
        .reg04(regs_4_4),
        .reg05(regs_4_5),
        .reg06(regs_4_6),
        .reg07(regs_4_7)
    );
    RowBuf7 #(.IMAGE_WIDTH(IMAGE_WIDTH)) buf7_row_buffer5
    (
        .din(row_o4),
        .clk(clk),
        .rst(rst),
        .dout(row_o5),
        .reg01(regs_5_1),
        .reg02(regs_5_2),
        .reg03(regs_5_3),
        .reg04(regs_5_4),
        .reg05(regs_5_5),
        .reg06(regs_5_6),
        .reg07(regs_5_7)
    );
    RowBuf7 #(.IMAGE_WIDTH(IMAGE_WIDTH)) buf7_row_buffer6
    (
        .din(row_o5),
        .clk(clk),
        .rst(rst),
        .dout(row_o6),
        .reg01(),
        .reg02(regs_6_2),
        .reg03(regs_6_3),
        .reg04(regs_6_4),
        .reg05(regs_6_5),
        .reg06(regs_6_6),
        .reg07()
    );
    regs7 row_buffer7
    (
        .clk(clk),
        .rst(rst),
        .din(row_o6),
        .reg01(),
        .reg02(),
        .reg03(regs_7_3),
        .reg04(regs_7_4),
        .reg05(regs_7_5),
        .reg06(),
        .reg07()
    );
    /********************************************************
    o_d_reg[x][y]
    ********************************************************/

    assign    reg_1_3  =  regs_1_3;
    assign    reg_1_4  =  regs_1_4;
    assign    reg_1_5  =  regs_1_5;
    
    assign    reg_2_2  =  regs_2_2;
    assign    reg_2_3  =  regs_2_3;
    assign    reg_2_4  =  regs_2_4;
    assign    reg_2_5  =  regs_2_5;
    assign    reg_2_6  =  regs_2_6;

    assign    reg_3_1  =  regs_3_1;
    assign    reg_3_2  =  regs_3_2;
    assign    reg_3_3  =  regs_3_3;
    assign    reg_3_4  =  regs_3_4;
    assign    reg_3_5  =  regs_3_5;
    assign    reg_3_6  =  regs_3_6;
    assign    reg_3_7  =  regs_3_7;
    
    assign    reg_4_1  =  regs_4_1;
    assign    reg_4_2  =  regs_4_2;
    assign    reg_4_3  =  regs_4_3;
    assign    reg_4_4  =  regs_4_4;
    assign    reg_4_5  =  regs_4_5;
    assign    reg_4_6  =  regs_4_6;
    assign    reg_4_7  =  regs_4_7;
    
    assign    reg_5_1  =  regs_5_1;
    assign    reg_5_2  =  regs_5_2;
    assign    reg_5_3  =  regs_5_3;
    assign    reg_5_4  =  regs_5_4;
    assign    reg_5_5  =  regs_5_5;
    assign    reg_5_6  =  regs_5_6;
    assign    reg_5_7  =  regs_5_7;
    
    assign    reg_6_2  =  regs_6_2;
    assign    reg_6_3  =  regs_6_3;
    assign    reg_6_4  =  regs_6_4;
    assign    reg_6_5  =  regs_6_5;
    assign    reg_6_6  =  regs_6_6;
    
    assign    reg_7_3  =  regs_7_3;
    assign    reg_7_4  =  regs_7_4;
    assign    reg_7_5  =  regs_7_5;

localparam windowSize = 7;
localparam maxValidLatency = IMAGE_WIDTH*(windowSize-1)/2 + (windowSize+1)/2;
reg [maxValidLatency-1:0] valid_delay;
integer i;
always @(posedge clk) begin
    for(i=0; i<maxValidLatency-1; i=i+1)
        valid_delay[i+1] <= valid_delay[i];
    valid_delay[0] <= din_valid;
end
assign dout_valid = valid_delay[maxValidLatency-1];

endmodule

