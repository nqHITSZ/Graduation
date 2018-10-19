`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/16 19:42:43
// Design Name: 
// Module Name: Ram_Ctrl
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


module Ram_Ctrl(
    input fsync,//frame sync
   // input surf_done,
    input rst,
    input clk,
    input WLE,WRE,
    
    //read
    input wire [9:0] R_R_addr,
    output reg [147:0] R_R_data,
    input wire [9:0] R_L_addr,
    output reg [147:0] R_L_data,
    input wire [9:0] R_P_addr,
    output reg [147:0] R_P_data,

    //write
    input wire [9:0] W_R_addr,
    input wire [147:0] W_R_data,
    input wire [9:0] W_L_addr,
    input wire [147:0] W_L_data

    );


wire re_1, re_2, re_3, re_4, re_5;
reg we_1, we_2, we_3, we_4, we_5;

reg [9:0] raddr_1, raddr_2, raddr_3, raddr_4, raddr_5;
reg [9:0] waddr_1, waddr_2, waddr_3, waddr_4, waddr_5;
reg [147:0] din_1, din_2, din_3, din_4, din_5;
wire [147:0] dout_1, dout_2, dout_3, dout_4, dout_5;







reg [4:0] ram_state;

always @(posedge clk) begin
    if(rst)
        ram_state <= 5'b10000;
    else begin
        if(fsync)
            case(ram_state)
            5'b00001 : ram_state <= 5'b00010;
            5'b00010 : ram_state <= 5'b00100;
            5'b00100 : ram_state <= 5'b01000;
            5'b01000 : ram_state <= 5'b10000;
            5'b10000 : ram_state <= 5'b00001;
            default : ram_state <= 5'bxxxxx;
            endcase
    end
end

assign re_1 = 1'b1;
assign re_2 = 1'b1;
assign re_3 = 1'b1;
assign re_4 = 1'b1;
assign re_5 = 1'b1;

always @* begin
    we_1 = 1'b0;
    we_2 = 1'b0;
    we_3 = 1'b0;
    we_4 = 1'b0;
    we_5 = 1'b0;
    
    raddr_1 = 10'bx;
    raddr_2 = 10'bx;
    raddr_3 = 10'bx;
    raddr_4 = 10'bx;
    raddr_5 = 10'bx;

    waddr_1 = 10'bx;
    waddr_2 = 10'bx;
    waddr_3 = 10'bx;
    waddr_4 = 10'bx;
    waddr_5 = 10'bx;

    din_1 = 148'bx;
    din_2 = 148'bx;
    din_3 = 148'bx;
    din_4 = 148'bx;
    din_5 = 148'bx;
    
    R_P_data =148'bx;
    R_R_data =148'bx;
    R_L_data =148'bx;
    
    //(* full_case *)
    case(ram_state)
    5'b00001 : begin
        //write
        we_1 = WRE;
        we_2 = WLE;
        waddr_1  = W_R_addr;
        din_1    = W_R_data;
        waddr_2  = W_L_addr;
        din_2    = W_L_data;
        //read
        raddr_3  = R_P_addr;
        raddr_4  = R_R_addr;
        raddr_5  = R_L_addr;
        
        R_P_data = dout_3;
        R_R_data = dout_4;
        R_L_data = dout_5;
    end
    5'b00010 : begin
        we_3 = WRE;
        we_4 = WLE;
        waddr_3 = W_R_addr;
        din_3   = W_R_data;
        waddr_4 = W_L_addr;
        din_4   = W_L_data;
                          
        raddr_5 = R_P_addr;
        raddr_1 = R_R_addr;
        raddr_2 = R_L_addr;
        
        R_P_data = dout_5;
        R_R_data = dout_1;
        R_L_data = dout_2;
    end
    5'b00100 : begin
        we_5 = WRE;
        we_1 = WLE;
        waddr_5 = W_R_addr;
        din_5   = W_R_data;
        waddr_1 = W_L_addr;
        din_1   = W_L_data;
                          
        raddr_2 = R_P_addr;
        raddr_3 = R_R_addr;
        raddr_4 = R_L_addr;
        
        R_P_data = dout_2;
        R_R_data = dout_3;
        R_L_data = dout_4;
    end
    5'b01000 : begin
        we_2 = WRE;
        we_3 = WLE;
        waddr_2 = W_R_addr;
        din_2   = W_R_data;
        waddr_3 = W_L_addr;
        din_3   = W_L_data;
                          
        raddr_4 = R_P_addr;
        raddr_5 = R_R_addr;
        raddr_1 = R_L_addr;
        
        R_P_data = dout_4;
        R_R_data = dout_5;
        R_L_data = dout_1;
    end
    5'b10000 : begin
        we_4 = WRE;
        we_5 = WLE;
        waddr_4 = W_R_addr;
        din_4   = W_R_data;
        waddr_5 = W_L_addr;
        din_5   = W_L_data;
                          
        raddr_1 = R_P_addr;
        raddr_2 = R_R_addr;
        raddr_3 = R_L_addr;

        R_P_data = dout_1;
        R_R_data = dout_2;
        R_L_data = dout_3;
    end
    endcase


end



bram_sd
#(
    .ADDR_WIDTH(10),
    .DATA_DEPTH(1024),
    .DATA_WIDTH(148)
)
RAM_1
(
    .clk(clk),
    .raddr(raddr_1),
    .re(re_1),
    .waddr(waddr_1),
    .we(we_1),
    .din(din_1),
    .dout(dout_1)
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
    .raddr(raddr_2),
    .re(re_2),
    .waddr(waddr_2),
    .we(we_2),
    .din(din_2),
    .dout(dout_2)
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
    .raddr(raddr_3),
    .re(re_3),
    .waddr(waddr_3),
    .we(we_3),
    .din(din_3),
    .dout(dout_3)
);

bram_sd
#(
    .ADDR_WIDTH(10),
    .DATA_DEPTH(1024),
    .DATA_WIDTH(148)
)
RAM_4
(
    .clk(clk),
    .raddr(raddr_4),
    .re(re_4),
    .waddr(waddr_4),
    .we(we_4),
    .din(din_4),
    .dout(dout_4)
);

bram_sd
#(
    .ADDR_WIDTH(10),
    .DATA_DEPTH(1024),
    .DATA_WIDTH(148)
)
RAM_5
(
    .clk(clk),
    .raddr(raddr_5),
    .re(re_5),
    .waddr(waddr_5),
    .we(we_5),
    .din(din_5),
    .dout(dout_5)
);


endmodule