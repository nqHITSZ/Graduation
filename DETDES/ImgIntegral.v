`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: NQ
// 
// Create Date: 2018/08/27 08:55:29
// Design Name: 
// Module Name: ImgIntergral
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


module ImgIntergral #
(
    parameter DIN_DATA_WIDTH = 8,
    parameter DOUT_DATA_WIDTH = 28,
    parameter ROW = 480,
    parameter COL = 640
)
(
    input clk, rst,
    input [DIN_DATA_WIDTH-1 : 0]din,
    input din_valid,
    output [DOUT_DATA_WIDTH-1 : 0]dout,
    output dout_valid,
    output [9:0]o_col_cnt, o_row_cnt
);

//signal declaration
reg is_first_row, is_first_col, is_last_row, is_last_col;
wire [DOUT_DATA_WIDTH-1 : 0] row_acc_xy,inte_xpy; // inte_xpy is ImgIntergral at (x-1,y)
reg [DOUT_DATA_WIDTH-1 : 0] inte_xy;//inte_xy is ImgIntergral at (x,y)
wire fifo_we,fifo_re;
wire [9:0] col_cnt, row_cnt;



//latency begin
localparam maxValidLatency = 2;
integer i;
reg delay_valid [maxValidLatency-1:0];
always @(posedge clk) begin
    for(i=0; i<maxValidLatency-1; i=i+1)
        delay_valid[i+1] <= delay_valid[i];
    delay_valid[0] <= din_valid;
end

reg [9:0] delay_col_cnt [maxValidLatency-1:0];
reg [9:0] delay_row_cnt [maxValidLatency-1:0];
always @(posedge clk) begin
    for(i=0; i<maxValidLatency-1; i=i+1)
        delay_col_cnt[i+1] <= delay_col_cnt[i];
    delay_col_cnt[0] <= col_cnt;
end

always @(posedge clk) begin
    for(i=0; i<maxValidLatency-1; i=i+1)
        delay_row_cnt[i+1] <= delay_row_cnt[i];
    delay_row_cnt[0] <= row_cnt;
end




localparam maxBoundaryFlag = 2;
reg  delay_is_first_row [maxBoundaryFlag-1:0];
always @(posedge clk) begin
        for(i=0; i<maxValidLatency-1; i=i+1)
            delay_is_first_row[i+1] <= delay_is_first_row[i];
        delay_is_first_row[0] <= is_first_row;
end

//latency end

//control logic begin
assign fifo_re = ~is_first_row;
assign fifo_we = delay_valid[maxBoundaryFlag-1];
//control logic end


//instance

CoordinateGen#
(
//    .DIN_DATA_WIDTH(DIN_DATA_WIDTH),
    .ROW(ROW),
    .COL(COL)
)
IBF_u
(
    .clk(clk),
    .rst(rst),
    .din_valid(din_valid),
    .col_cnt(col_cnt), 
    .row_cnt(row_cnt)
);

//Image Boundary Flag
always @* begin
    is_first_row = row_cnt==0;
    is_last_row = row_cnt==ROW-1;
    is_first_col = col_cnt==0;
    is_last_col = col_cnt==COL-1;
end

fifo #
(
    .DATA_DEPTH(COL),
    .DATA_WIDTH(DOUT_DATA_WIDTH)
)
fifo_inte_xy_u
(
    .clk(clk),
    .rst(rst),
    .wr_data_i(inte_xy),
    .wr_en_i(fifo_we),
    .rd_data_o(inte_xpy),
    .rd_en_i(fifo_re),
    .full_o(),
    .empty_o()
);


Accumulator #
(
    .DIN_DATA_WIDTH(DIN_DATA_WIDTH),
    .DOUT_DATA_WIDTH(DOUT_DATA_WIDTH)
)
row_accu_u
(
    .clk(clk),
    .sclr(rst),
    .B(din),
    .ce(din_valid), 
    .bypass(is_first_col),
    .Q(row_acc_xy)
);

//adder
always @(posedge clk)
    if(rst)
        inte_xy <=0;
    else if(delay_is_first_row[0])
        inte_xy <= row_acc_xy;
    else
        inte_xy <= row_acc_xy + inte_xpy;
    
//output logic
assign dout = inte_xy;
assign dout_valid = delay_valid[1];//dout_valid lags behind din_valid by two clock cycles
assign o_col_cnt = delay_col_cnt[1];
assign o_row_cnt = delay_row_cnt[1];




endmodule
