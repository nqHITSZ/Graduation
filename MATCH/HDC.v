`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/11 15:42:38
// Design Name: 
// Module Name: HWC
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

//Hamming Distance Counter LATENCY = 3CLK
module HDC(
    input clk,
    input [127:0] vectorA, vectorB,
    output [7:0] distance
    );

reg [127:0] vector;
always @(posedge clk)
	vector <= vectorA ^ vectorB;


HWC u_hwc(
    .clk(clk),
    .vector(vector),
    .weight(distance)
    );
endmodule

//Hamming Weight Counter LATENCY = 2CLK
module HWC(
    input clk,
    //input rst,
    input [127:0] vector,

    output reg [7:0] weight
    //output 

    );

//Lyer 1 
reg [6:0] W1, W2;
always @(posedge clk) begin
        W1     <= vector[000]
                + vector[001]
                + vector[002]
                + vector[003]
                + vector[004]
                + vector[005]
                + vector[006]
                + vector[007]
                + vector[008]
                + vector[009]
                + vector[010]
                + vector[011]
                + vector[012]
                + vector[013]
                + vector[014]
                + vector[015]
                + vector[016]
                + vector[017]
                + vector[018]
                + vector[019]
                + vector[020]
                + vector[021]
                + vector[022]
                + vector[023]
                + vector[024]
                + vector[025]
                + vector[026]
                + vector[027]
                + vector[028]
                + vector[029]
                + vector[030]
                + vector[031]
                + vector[032]
                + vector[033]
                + vector[034]
                + vector[035]
                + vector[036]
                + vector[037]
                + vector[038]
                + vector[039]
                + vector[040]
                + vector[041]
                + vector[042]
                + vector[043]
                + vector[044]
                + vector[045]
                + vector[046]
                + vector[047]
                + vector[048]
                + vector[049]
                + vector[050]
                + vector[051]
                + vector[052]
                + vector[053]
                + vector[054]
                + vector[055]
                + vector[056]
                + vector[057]
                + vector[058]
                + vector[059]
                + vector[060]
                + vector[061]
                + vector[062]
                + vector[063];
end

always @(posedge clk) begin
       W2      <= vector[064]
                + vector[065]
                + vector[066]
                + vector[067]
                + vector[068]
                + vector[069]
                + vector[070]
                + vector[071]
                + vector[072]
                + vector[073]
                + vector[074]
                + vector[075]
                + vector[076]
                + vector[077]
                + vector[078]
                + vector[079]
                + vector[080]
                + vector[081]
                + vector[082]
                + vector[083]
                + vector[084]
                + vector[085]
                + vector[086]
                + vector[087]
                + vector[088]
                + vector[089]
                + vector[090]
                + vector[091]
                + vector[092]
                + vector[093]
                + vector[094]
                + vector[095]
                + vector[096]
                + vector[097]
                + vector[098]
                + vector[099]
                + vector[100]
                + vector[101]
                + vector[102]
                + vector[103]
                + vector[104]
                + vector[105]
                + vector[106]
                + vector[107]
                + vector[108]
                + vector[109]
                + vector[110]
                + vector[111]
                + vector[112]
                + vector[113]
                + vector[114]
                + vector[115]
                + vector[116]
                + vector[117]
                + vector[118]
                + vector[119]
                + vector[120]
                + vector[121]
                + vector[122]
                + vector[123]
                + vector[124]
                + vector[125]
                + vector[126]
                + vector[127];
end
always @(posedge clk)
    weight <= W1 + W2;

endmodule

/*
//reference digital hamming weight and distance analyzers @valery
module HWC(
    //input clk,
    //input rst,
    input [35:0] vector,
    output wire [2:0] A,B,X,
    output [5:0] weight
    //output 

    );
wire [2:0] W1,W2,W3,W4,W5,W6;
//Layer 1;
assign W1 = vector[00]
          + vector[01]
          + vector[02]
          + vector[03]
          + vector[04]
          + vector[05];
assign W2 = vector[06]
          + vector[07]
          + vector[08]
          + vector[09]
          + vector[10]
          + vector[11];
assign W3 = vector[12]
          + vector[13]
          + vector[14]
          + vector[15]
          + vector[16]
          + vector[17];
assign W4 = vector[18]
          + vector[19]
          + vector[20]
          + vector[21]
          + vector[22]
          + vector[23];
assign W5 = vector[24]
          + vector[25]
          + vector[26]
          + vector[27]
          + vector[28]
          + vector[29];
assign W6 = vector[30]
          + vector[31]
          + vector[32]
          + vector[33]
          + vector[34]
          + vector[35];

//Layer 2
//wire [2:0] A,B,X;
assign A = W1[0]
         + W2[0]
         + W3[0]
         + W4[0]
         + W5[0]
         + W6[0];
         
assign B = W1[1]
         + W2[1]
         + W3[1]
         + W4[1]
         + W5[1]
         + W6[1];
         
assign X = W1[2]
         + W2[2]
         + W3[2]
         + W4[2]
         + W5[2]
         + W6[2];
         
//Layer 3
wire [3:0] ADD1;
wire [4:0] ADD2;
assign ADD1 = {A,1'b0} + B;
assign ADD2 = ADD1 + X[2:1];

assign weight = {ADD2,X[0]};

endmodule
*/
