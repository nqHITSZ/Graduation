`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: NQ
// 
// Create Date: 2018/10/13 16:45:57
// Design Name: 
// Module Name: Ctrl
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


module Ctrl #(
    parameter Match_Threshold = 10,
    parameter PSR = 5 //Parallax search range
)
(
    input clk,
    input rst,
    input start,

    output [59:0] dout,
    output dout_valid,
    
    //RAM interface
    output  [9:0] R_R_addr,
    input [147:0] R_R_data,
    
    output  [9:0] R_P_addr,
    input [147:0] R_P_data,

    output [9:0] R_L_addr,
    input [147:0] R_L_data
    );
localparam  IDEL          = 4'd0, 
            LOAD_RR       = 4'd1,
            LOAD_RR_2     = 4'd2,
            LOAD_RR_3     = 4'd3,
            LOAD_RR_4     = 4'd4,
            MC_WORKING    = 4'd5,
            TRANSFER      = 4'd6,
            TRANSFER_2    = 4'd7,
            TRANSFER_3    = 4'd8,
            TRANSFER_4    = 4'd9,
            DONE          = 4'd10,
            CLEAR         = 4'b1111,
            UNK           = 4'bXXXX;

//DesNum_RP
wire [9:0] DesNum_RP;
assign   DesNum_RP = 195;

wire [9:0] DesNum_RR;
assign   DesNum_RR = 193;
    
wire [9:0] DesNum_RL;
assign   DesNum_RL = 10;

reg [147:0] coor_des_Main_1,coor_des_Main_2,coor_des_Main_3,coor_des_Main_4;
wire [147:0] coor_des_Slave,coor_des_Slave_LR;
assign coor_des_Slave = R_P_data;
assign coor_des_Slave_LR = R_R_data;

wire [9:0] index_Slave_1,index_Slave_2,index_Slave_3,index_Slave_4;
wire [19:0] coor_Slave_1,coor_Slave_2,coor_Slave_3,coor_Slave_4;
wire [7:0] minHD_Slave_1,minHD_Slave_2,minHD_Slave_3,minHD_Slave_4;

wire [9:0] index_Slave_1_LR,index_Slave_2_LR,index_Slave_3_LR,index_Slave_4_LR;
wire [19:0] coor_Slave_1_LR,coor_Slave_2_LR,coor_Slave_3_LR,coor_Slave_4_LR;
wire [7:0] minHD_Slave_1_LR,minHD_Slave_2_LR,minHD_Slave_3_LR,minHD_Slave_4_LR;

//FSM

//signals declaration
reg [3:0] state;
reg [9:0] RL_addr, RR_addr, RP_addr;

wire [59:0] txFifo_dout;
reg [59:0] txFifo_din;
reg txFifo_wr_en;
wire txFifo_rd_en,txFifo_empty;
wire match_core_done, match_core_done_LR;
//macth_core control signals
reg Slave_valid, Slave_valid_RR;
reg mc_clr;//match_core clear

reg [10:0] cnt;
reg [4:1] core_enable;
reg [1:0] match_core_done_both;

////FSM body BEGIN
always @(posedge clk) begin
    if(rst) begin
        state <= IDEL;
        RL_addr <= 0;
        RR_addr <= 0;
        RP_addr <= 0;
        mc_clr <= 1;
        match_core_done_both <= 0;
        //cnt <= 0;
        Slave_valid <= 0;
        Slave_valid_RR <= 0;
        core_enable <= 0;
    end
    else begin
        case(state) 
            IDEL: begin
                state <= IDEL;
                RL_addr <= 0;
                RR_addr <= 0;
                RP_addr <= 0;
                mc_clr <= 1;
                match_core_done_both <= 0;
                //cnt <= 0;
                Slave_valid <= 0;
                Slave_valid_RR <= 0;
                core_enable <= 0;
                if(start == 1) 
                    state <= CLEAR;
            end
            LOAD_RR: begin
                coor_des_Main_1 <= R_L_data;
                RL_addr <= RL_addr + 1;
                core_enable <= 4'b1111;
                state <= LOAD_RR_2;
                if(RL_addr==DesNum_RL) begin
                    core_enable <= 4'b0001;
                    state <= MC_WORKING;
                end
            end
            LOAD_RR_2: begin
                coor_des_Main_2 <= R_L_data;
                RL_addr <= RL_addr + 1;
                core_enable <= 4'b1111;
                state <= LOAD_RR_3;
                if(RL_addr==DesNum_RL) begin
                    core_enable <= 4'b0011;
                    state <= MC_WORKING;
                end
            end
            LOAD_RR_3: begin
                coor_des_Main_3 <= R_L_data;
                RL_addr <= RL_addr + 1;
                core_enable <= 4'b1111;
                state <= LOAD_RR_4;
                if(RL_addr==DesNum_RL) begin
                    core_enable <= 4'b0111;
                    state <= MC_WORKING;
                end
            end
            LOAD_RR_4: begin
                coor_des_Main_4 <= R_L_data;
                //RL_addr <= RL_addr + 1;
                state <= MC_WORKING;
                core_enable <= 4'b1111;
                if(RL_addr==DesNum_RL) begin
                    core_enable <= 4'b1111;
                end
            end
            MC_WORKING: begin
                mc_clr <= 0;
                Slave_valid <= 1;
                Slave_valid_RR <= 1;
                RR_addr <= RR_addr + 1;
                RP_addr <= RP_addr + 1;
                //cnt <= cnt + 1;
                if(RP_addr >= DesNum_RP) begin //NOTE:For safety, cnt >= DesNum_RP rather than ==
                    RP_addr <= RP_addr; //NOTE: After RP_addr >= DesNum_RP, RP_addr must keep its current value.
                    Slave_valid <= 0;
                    if(match_core_done) begin //For safety, match_core_done is detected after RP_addr >= DesNum_RP
                        match_core_done_both[0] <= 1'b1;
                        //state <= TRANSFER;
                        //cnt <= 0;
                    end
                end
                    
                if(RR_addr >= DesNum_RR) begin //NOTE: cnt >= DesNum_RP rather than ==
                    RR_addr <= RR_addr;
                    Slave_valid_RR <= 0;
                    if(match_core_done_LR) begin
                        match_core_done_both[1] <= 1'b1;
                        //state <= TRANSFER; 
                        //cnt <= 0;
                    end
                end
                //else
                //    Slave_valid_RR <= 1;
                
                if(match_core_done_both == 2'b11)
                    state <= TRANSFER;
                
                
            end
            TRANSFER: begin //transfer the coor_Slave1~4 to the txFifo
                state <= TRANSFER_2;
            end
            TRANSFER_2: begin //transfer the coor_Slave1~4 to the txFifo
                state <= TRANSFER_3;
            end
            TRANSFER_3: begin //transfer the coor_Slave1~4 to the txFifo
                state <= TRANSFER_4;
            end
            TRANSFER_4: begin //transfer the coor_Slave1~4 to the txFifo
                //RL_addr <= RL_addr + 1;//there is one clock delay between addr and data in RAM
                state <= CLEAR; 
                //Slave_valid <= 0;
                if(core_enable != 4'b1111)
                    state <= DONE;
            end
            CLEAR: begin
                RR_addr <= 0;
                RP_addr <= 0;
                mc_clr <= 1;
                match_core_done_both <= 0;
                cnt <= 0;
                core_enable <= 0;
                RL_addr <= RL_addr + 1;//there is one clock delay between addr and data in RAM
                core_enable <= 4'b1111;
                state <= LOAD_RR; 
                if(RL_addr==DesNum_RL) begin
                    core_enable <= 4'b0000;
                    state <= DONE;
                end
            end
            DONE: begin
            end
            default: state <= UNK;

        endcase
     end


end


//some output logic of the FSM
function [9:0] col_distance; 
	input [9:0] col_A, col_B;
    col_distance = col_A>col_B ? col_A-col_B : col_B-col_A;
endfunction


always @* begin
    txFifo_din = coor_Slave_1;
    txFifo_wr_en = 0;
case(state)
    TRANSFER: begin //transfer the coor_Slave1~4 to the txFifo
        txFifo_din = {coor_Slave_1_LR,coor_Slave_1,coor_des_Main_1[147:128]};
         
        if(minHD_Slave_1 < Match_Threshold && core_enable[1] && col_distance(coor_Slave_1_LR[9:0],coor_des_Main_1[137:128])<PSR)
            txFifo_wr_en = 1;
    end
    TRANSFER_2: begin //transfer the coor_Slave1~4 to the txFifo
        txFifo_din =  {coor_Slave_2_LR,coor_Slave_2,coor_des_Main_2[147:128]};
        if(minHD_Slave_2 < Match_Threshold && core_enable[2] && col_distance(coor_Slave_2_LR[9:0],coor_des_Main_2[137:128])<PSR)
            txFifo_wr_en = 1;
    end
    TRANSFER_3: begin //transfer the coor_Slave1~4 to the txFifo
        txFifo_din =  {coor_Slave_3_LR,coor_Slave_3,coor_des_Main_3[147:128]};
        if(minHD_Slave_3 < Match_Threshold && core_enable[3] && col_distance(coor_Slave_3_LR[9:0],coor_des_Main_3[137:128])<PSR)
            txFifo_wr_en = 1;
    end
    TRANSFER_4: begin //transfer the coor_Slave1~4 to the txFifo
        txFifo_din =  {coor_Slave_4_LR,coor_Slave_4,coor_des_Main_4[147:128]};
        if(minHD_Slave_4 < Match_Threshold && core_enable[4] && col_distance(coor_Slave_4_LR[9:0],coor_des_Main_4[137:128])<PSR)
            txFifo_wr_en = 1;
    end
endcase
end

////FSM body END

//The following 4 match_cores are used to find matched feature points between current lift frame and previous lift frame 
match_core u_core_1(
    .clk(clk),
    .en(Slave_valid),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_1),
    .coor_des_Slave(coor_des_Slave),
    .index_Slave(index_Slave_1),
    .coor_Slave(coor_Slave_1),
    .min_hd(minHD_Slave_1),
    .done(match_core_done) //Note the done signal of mathc_core is only used in u_core_1, and it  can be eliminated to save resourse.(Maybe not, note vivado systhsis optimization)
    );

match_core u_core_2(
    .clk(clk),
    .en(Slave_valid),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_2),
    .coor_des_Slave(coor_des_Slave),
    .index_Slave(index_Slave_2),
    .min_hd(minHD_Slave_2),
    .coor_Slave(coor_Slave_2)
    );

match_core u_core_3(
    .clk(clk),
    .en(Slave_valid),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_3),
    .coor_des_Slave(coor_des_Slave),
    .index_Slave(index_Slave_3),
    .min_hd(minHD_Slave_3),
    .coor_Slave(coor_Slave_3)
    );

match_core u_core_4(
    .clk(clk),
    .en(Slave_valid),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_4),
    .coor_des_Slave(coor_des_Slave),
    .index_Slave(index_Slave_4),
    .min_hd(minHD_Slave_4),
    .coor_Slave(coor_Slave_4)
    );


//The following 4 match_cores are used to find matched feature points between lift frame and right frame 
match_core u_core_1_LR(
    .clk(clk),
    .en(Slave_valid_RR),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_1),
    .coor_des_Slave(coor_des_Slave_LR),
    .index_Slave(index_Slave_1_LR),
    .coor_Slave(coor_Slave_1_LR),
    .min_hd(minHD_Slave_1_LR),
    .done(match_core_done_LR)
    );

match_core u_core_2_LR(
    .clk(clk),
    .en(Slave_valid_RR),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_2),
    .coor_des_Slave(coor_des_Slave_LR),
    .index_Slave(index_Slave_2_LR),
    .min_hd(minHD_Slave_2_LR),
    .coor_Slave(coor_Slave_2_LR)
    );

match_core u_core_3_LR(
    .clk(clk),
    .en(Slave_valid_RR),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_3),
    .coor_des_Slave(coor_des_Slave_LR),
    .index_Slave(index_Slave_3_LR),
    .min_hd(minHD_Slave_3_LR),
    .coor_Slave(coor_Slave_3_LR)
    );

match_core u_core_4_LR(
    .clk(clk),
    .en(Slave_valid_RR),
    .clear(mc_clr),
    .coor_des_Main(coor_des_Main_4),
    .coor_des_Slave(coor_des_Slave_LR),
    .index_Slave(index_Slave_4_LR),
    .min_hd(minHD_Slave_4_LR),
    .coor_Slave(coor_Slave_4_LR)
    );






TxFIFO u_TxFIFO (
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(txFifo_din),      // input wire [59 : 0] din
  .wr_en(txFifo_wr_en),  // input wire wr_en
  .rd_en(txFifo_rd_en),  // input wire rd_en
  .dout(txFifo_dout),    // output wire [59 : 0] dout
  .full(),    // output wire full
  .empty(txFifo_empty)  // output wire empty
);
       
`define DEBUG
`ifdef DEBUG
assign txFifo_rd_en = ~txFifo_empty;
`endif
//output logic
assign R_L_addr = RL_addr;
assign R_R_addr = RR_addr;
assign R_P_addr = RP_addr;
       
assign dout = txFifo_din;
assign dout_valid = txFifo_wr_en;
        
endmodule

