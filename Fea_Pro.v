`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/17 14:29:00
// Design Name: 
// Module Name: Fea_Pro
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


module Fea_Pro #
(
    parameter Img_Height = 100,//row
    parameter Img_Width = 120,//col
    parameter Surf_Threshold = 32'h64000,//'d409600
    parameter Hamming_Threshold = 10 ////////////////////////////////////////////////////// not used for the moment
)
(
    input clk,
    input rst,
    input [7:0] img_din,
    input img_din_valid,
    //input fsync_L,
    //input fsync_R,
    output dout_valid,
    output [63:0] dout_data,
    output dout_last
);
wire fsync;
wire fsync_L,fsync_R;

//generate fsync BEGIN
reg [1:0] fsync_state;
always @(posedge clk) begin
    if(rst)
        fsync_state <= 0;
    else begin
        case(fsync_state)
        0: if(img_din_valid==1) fsync_state = 1;
        1: if(img_din_valid==0) fsync_state = 2; //wait img_din_valid == 0;
        2: if(img_din_valid==1) fsync_state = 3;
        3: if(img_din_valid==0) fsync_state = 0;
        endcase
    end
end

//Mealy output logic
assign fsync_L = (img_din_valid==1) && (fsync_state==0);
assign fsync_R = (img_din_valid==1) && (fsync_state==2);
assign fsync = fsync_L;
//generate fsync END


wire [147:0] des_coor;
wire feature_flag;
wire Det_Des_valid;

wire WRE,WLE;

Det_Des #(
    .ROW(Img_Height),//image height
    .COL(Img_Width)//image width
)
DD_q
(
    .clk(clk),
    .rst(rst),
    .din(img_din),
    .din_valid(img_din_valid),
    .constant(Surf_Threshold),
    .feature_flag(feature_flag),
    .des_coor(des_coor),
    .dout_valid(Det_Des_valid)
);


//Det_Des memory-writing control logic  BEGIN
localparam  IDEL          = 4'd0, 
            COUNT_L       = 4'd1,
            COUNT_R       = 4'd2,
            UNK           = 4'bXXXX;

reg [3:0] Det_Des_Ctrl_state;
reg [9:0] WR_num, WL_num;
wire [9:0] W_R_addr, W_L_addr;

always @(posedge clk) begin
    if(rst) begin
        Det_Des_Ctrl_state <= IDEL;
        WR_num <= 0;
        WL_num <= 0;
    end
    else begin
        case(Det_Des_Ctrl_state)
        IDEL: begin
            WR_num <= 0;
            WL_num <= 0;
            if(fsync)
                Det_Des_Ctrl_state <= COUNT_L;
        end
        COUNT_L: begin
            if(feature_flag && Det_Des_valid)
                WL_num <= WL_num + 1;
            if(fsync_R)
                Det_Des_Ctrl_state <= COUNT_R;
        end
        COUNT_R: begin
            if(feature_flag && Det_Des_valid)
                WR_num <= WR_num + 1;
            if(fsync) begin
                Det_Des_Ctrl_state <= COUNT_L;
                WR_num <= 0;
                WL_num <= 0;
            end
        end
        default: Det_Des_Ctrl_state <= UNK;
        endcase
    end
end

//Det_Des memory-writing control logic  END




assign W_R_addr = WR_num;
assign W_L_addr = WL_num;
assign WLE = (Det_Des_Ctrl_state == COUNT_L) ? feature_flag : 0;
assign WRE = (Det_Des_Ctrl_state == COUNT_R) ? feature_flag : 0;



wire [9:0] R_R_addr;
wire [147:0] R_R_data;
wire [9:0] R_L_addr;
wire [147:0] R_L_data;
wire [9:0] R_P_addr;
wire [147:0] R_P_data;



Ram_Ctrl RC_q(
    .clk(clk),
    .rst(rst),
    .fsync(fsync),//frame sync
    
    //Det_Des write
    .WRE(WRE),
    .W_R_addr(W_R_addr),
    .W_R_data(des_coor),
    .WLE(WLE),
    .W_L_addr(W_L_addr),
    .W_L_data(des_coor),
    
    //Match read
    .R_R_addr(R_R_addr),
    .R_R_data(R_R_data),
    .R_L_addr(R_L_addr),
    .R_L_data(R_L_data),
    .R_P_addr(R_P_addr),
    .R_P_data(R_P_data)
);



reg [9:0] DesNum_RP;
reg [9:0] DesNum_RR;
reg [9:0] DesNum_RL;

Match_Ctrl MC_q(
    .clk(clk),
    .rst(rst),
    .start(fsync),
    
    .dout(dout),
    .dout_valid(dout_valid),
    
    .DesNum_RP(DesNum_RP),
    .DesNum_RR(DesNum_RR),
    .DesNum_RL(DesNum_RL),
         
    //RAM interface
    .R_R_addr(R_R_addr),
    .R_R_data(R_R_data),
    .R_L_addr(R_L_addr),
    .R_L_data(R_L_data),
    .R_P_addr(R_P_addr),
    .R_P_data(R_P_data)
    );



reg [4:0] des_num_state;
reg [9:0] des_num_1, des_num_2, des_num_3, des_num_4, des_num_5;
always @(posedge clk) begin
    if(rst)
        des_num_state <= 5'b10000;
    else begin
        if(fsync)
            case(des_num_state)
            5'b00001 : des_num_state <= 5'b00010;
            5'b00010 : des_num_state <= 5'b00100;
            5'b00100 : des_num_state <= 5'b01000;
            5'b01000 : des_num_state <= 5'b10000;
            5'b10000 : des_num_state <= 5'b00001;
            default : des_num_state <= 5'bxxxxx;
            endcase
    end
end

//des_num write logic BEGIN-----------------------------------
always @(posedge clk) begin
    if(rst) begin
        des_num_1 <= 0;
        des_num_2 <= 0;
        des_num_3 <= 0;
        des_num_4 <= 0;
        des_num_5 <= 0;
    end
    else if(fsync) begin
        case(des_num_state)
        5'b00001 : begin
            des_num_1 <= WR_num;
            des_num_2 <= WL_num;
        end
        5'b00010 : begin
            des_num_3 <= WR_num;
            des_num_4 <= WL_num;
        end
        5'b00100 : begin
            des_num_5 <= WR_num;
            des_num_1 <= WL_num;
        end
        5'b01000 : begin
            des_num_2 <= WR_num;
            des_num_3 <= WL_num;
        end
        5'b10000 : begin
            des_num_4 <= WR_num;
            des_num_5 <= WL_num;
        end
        endcase
    end
end
//des_num write logic END-----------------------------------

//des_num write logic END-----------------------------------
always @* begin
    //(* full_case *)
    case(des_num_state)
    5'b00001 : begin
        DesNum_RP = des_num_3;
        DesNum_RR = des_num_4;
        DesNum_RL = des_num_5;
    end
    5'b00010 : begin
        DesNum_RP = des_num_5;
        DesNum_RR = des_num_1;
        DesNum_RL = des_num_2;
    end
    5'b00100 : begin
        DesNum_RP = des_num_2;
        DesNum_RR = des_num_3;
        DesNum_RL = des_num_4;
    end
    5'b01000 : begin
        DesNum_RP = des_num_4;
        DesNum_RR = des_num_5;
        DesNum_RL = des_num_1;
    end
    5'b10000 : begin
        DesNum_RP = des_num_1;
        DesNum_RR = des_num_2;
        DesNum_RL = des_num_3;
    end
    default : begin
        DesNum_RP = 10'bx;
        DesNum_RR = 10'bx;
        DesNum_RL = 10'bx;
    end
    
    endcase
end
//des_num read logic END-----------------------------------



endmodule
