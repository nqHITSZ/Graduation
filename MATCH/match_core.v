`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/12 16:35:20
// Design Name: 
// Module Name: match_core
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


module match_core(
    input clk,en,clear,
    input [147:0]coor_des_Main, coor_des_Slave,
    output [9:0]index_Slave,
    output [19:0]coor_Slave,
    output reg [7:0] min_hd,
    output done
    );

wire [127:0] des_Main, des_Slave;
wire [7:0] hd_MS; //Hamming Distance between Main and Slave;
assign des_Main = coor_des_Main[127:0];
assign des_Slave = coor_des_Slave[127:0];
HDC u_HDC(
    .clk(clk),
    .vectorA(des_Main),
    .vectorB(des_Slave),
    .distance(hd_MS)
    );
localparam HDC_latency = 3;
reg [HDC_latency:0] _delay;
integer i;
always @(posedge clk) begin
    for(i=0; i<HDC_latency; i=i+1)
        _delay[i+1] <= _delay[i];
    _delay[0] <= en;
end

wire HDC_valid; 
assign HDC_valid = _delay[HDC_latency-1];

reg  [19:0]__delay[HDC_latency-1:0];
always @(posedge clk) begin
    for(i=0; i<HDC_latency-1; i=i+1)
        __delay[i+1] <= __delay[i];
    __delay[0] <= coor_des_Slave[147:128];
end

wire [19:0]coor_Slave_temp; 
assign coor_Slave_temp = __delay[HDC_latency-1];
    


wire hd_update;
assign hd_update = HDC_valid? min_hd > hd_MS : 0;

reg [19:0] coor_;
always @(posedge clk) begin
    coor_ <= hd_update ? coor_Slave_temp : coor_;
    if(clear)
        coor_ <= 20'bx;
end

always @(posedge clk) begin
    min_hd <= hd_update ? hd_MS : min_hd;
    if(clear)
        min_hd <= 8'hFF;
end

reg [9:0] index_cnt;
always @(posedge clk) begin
    if(HDC_valid)
        index_cnt <= index_cnt + 1;
    if(clear)
        index_cnt <= 0;
end

reg [9:0] index_;
always @(posedge clk) begin
    if(hd_update)
        index_ <= index_cnt;
end

//output logic
assign index_Slave = index_;
assign coor_Slave = coor_;

assign done = ~_delay[HDC_latency-1] & _delay[HDC_latency];


endmodule
