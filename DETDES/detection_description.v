`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/10 21:41:24
// Design Name: 
// Module Name: Surf_tb
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


module Det_Des#(parameter DATA_WIDTH = 8,
parameter COL = 640,
parameter ROW = 480,
parameter DATA_WIDTH_4WORDS = 32)
(

input wire [DATA_WIDTH - 1:0] din,
input wire din_valid,
input wire clk,
input wire rst,

input wire [DATA_WIDTH_4WORDS - 1:0] constant,

output wire dout_valid,
output wire feature_flag,
output wire [147:0] des_coor




);


wire max_flag_scale_15;
wire max_flag_scale_21;
wire max_flag_scale_27;
wire max_flag_scale_33;
wire max_flag_scale_39;
wire max_flag_scale_45;
wire max_flag;
wire SU_dout_valid;
Surf #
(
    .DATA_WIDTH(8),
    .INTEGRAL_DATA_WIDTH(28),
    .ROW(ROW),
    .COL(COL)
)
SU_u
(
    .clk(clk),
    .rst(rst),
    .din_valid(din_valid),
    .din(din),
    .constant (constant),
    .max_response15 (max_flag_scale_15),
    .max_response21 (max_flag_scale_21),
    .max_response27 (max_flag_scale_27),
    .max_response33 (max_flag_scale_33),
    .max_response39 (max_flag_scale_39),
    .max_response45 (max_flag_scale_45),
    .dout_valid(SU_dout_valid)
);

wire [127:0] descriptor;
wire BR_dout_valid;
Brief #(
    .DATA_WIDTH(8),
    .ROW(ROW),
    .COL(COL)
)
BR_u
(
    .clk(clk),
    .rst(rst),
    .din(din),
    .descriptor(descriptor),
    .din_valid(din_valid),
    .dout_valid(BR_dout_valid)

);

wire [9:0] col_cnt,row_cnt;
CoordinateGen#
(
    .ROW(ROW),
    .COL(COL)
)
CG_u
(
    .clk(clk),
    .rst(rst),
    .din_valid(dout_valid),
    .col_cnt(col_cnt),//x
    .row_cnt(row_cnt)//y
);


assign max_flag = max_flag_scale_15
                  | max_flag_scale_21
                  | max_flag_scale_27
                  | max_flag_scale_33
                  | max_flag_scale_39
                  | max_flag_scale_45;

wire max_flag_delay;
localparam SU_ValidLatency = 26*COL+38;
localparam BR_ValidLatency = 27*COL+36;
localparam _Latency = BR_ValidLatency - SU_ValidLatency;
reg [_Latency-1:0] _delay;
integer i;
always @(posedge clk) begin
    for(i=0; i<_Latency-1; i=i+1)
        _delay[i+1] <= _delay[i];
    _delay[0] <= max_flag;
end
assign max_flag_delay = _delay[_Latency-1];

//output logic
assign dout_valid = BR_dout_valid;
assign feature_flag = max_flag_delay;
assign des_coor = {col_cnt,row_cnt,descriptor};



endmodule