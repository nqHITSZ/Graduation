`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 13:43:05
// Design Name: 
// Module Name: derXX
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


module	derXX #(parameter DATA_WIDTH = 28)
		(

			input	wire	[DATA_WIDTH - 1:0]		A,
			input	wire	[DATA_WIDTH - 1:0]		B,
			input	wire	[DATA_WIDTH - 1:0]		C,
			input	wire	[DATA_WIDTH - 1:0]		D,
			input	wire	[DATA_WIDTH - 1:0]		E,
			input	wire	[DATA_WIDTH - 1:0]		F,
			input	wire	[DATA_WIDTH - 1:0]		G,
			input	wire	[DATA_WIDTH - 1:0]		H,
			input	wire							clk,
			input	wire							rst_n,
			input	wire							din_valid,
			output	wire	[DATA_WIDTH - 1:0]		Dxx_d_o,   //Dxx�������
			output	wire							Dxx_d_o_valid
		
		);

		wire							rst;
		
		wire	[DATA_WIDTH - 1:0]		o_S_adderAE;//A��E�ĺ͵����,��������o_S_adderXX��XX�źź͵����
		wire	[DATA_WIDTH - 1:0]		o_S_adderDH;
		wire	[DATA_WIDTH - 1:0]		o_S_adderBF;
		wire	[DATA_WIDTH - 1:0]		o_S_adderCG;
		
		wire	[DATA_WIDTH - 1:0]		o_S_sub_AEDH;   //���������������
		wire	[DATA_WIDTH - 1:0]		o_S_sub_BFCG;
		wire							ce_stage2   ;    //�׶�2������ʹ���ź�
		
		
		wire	[DATA_WIDTH - 2:0]		o_P_mult;    //��ϵ��Ϊ3�ĳ˷������
		wire							ce_stage3;   //�׶�3ʹ���ź�
		
		wire	[DATA_WIDTH - 1:0]		o_S_sub;     //���׶μ��������
		wire							ce_sub;      //���׶μ�����ʹ���ź�
		
		reg 	[DATA_WIDTH - 1:0]		o_S_sub_AEDH_r;   //�ݴ������AEDH�����
		
		reg		[4:0]					delay;    //������Ч�ź���ʱ
		
		assign rst = ~rst_n;
		/*****************************************************
		*�׶�1�ӷ�����������������inst_adder_XX,(XXΪ�����
		*����)����AE��DH��BF��CG
		******************************************************/
		
		adder28_un inst_adder_AE (
			  .A(A),      // input wire [27 : 0] A
			  .B(E),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(din_valid),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_adderAE)      // output wire [27 : 0] S
		);
		
		
		adder28_un inst_adder_DH (
			  .A(D),      // input wire [27 : 0] A
			  .B(H),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(din_valid),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_adderDH)      // output wire [27 : 0] S
		);
		
		
		adder28_un inst_adder_BF (
			  .A(B),      // input wire [27 : 0] A
			  .B(F),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(din_valid),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_adderBF)      // output wire [27 : 0] S
		);
		
		
		adder28_un inst_adder_CG (
			  .A(C),      // input wire [27 : 0] A
			  .B(G),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(din_valid),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_adderCG)      // output wire [27 : 0] S
		);
		

		/********************************************************
		*�׶�2��������������������inst_sub_XXXX��(X+X)-(X+X)
		*��AEDH����A+E��-��D+H��
		********************************************************/
		sub28 inst_sub_AEDH (
			  .A(o_S_adderAE),      // input wire [27 : 0] A
			  .B(o_S_adderDH),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(ce_stage2),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_sub_AEDH)      // output wire [27 : 0] S
		);
		
		
		sub28 inst_sub_BFCG (
			  .A(o_S_adderBF),      // input wire [27 : 0] A
			  .B(o_S_adderCG),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(ce_stage2),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_sub_BFCG)      // output wire [27 : 0] S
		);
		
		/******************************************************
		*�ݴ������AEDH�����
		******************************************************/
		always @(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						o_S_sub_AEDH_r <= 'd0;
					end
				else if(ce_stage3 == 1'b1)
					begin
						o_S_sub_AEDH_r <= o_S_sub_AEDH;
					end
			end
		
		
		/******************************************************
		*�׶�3�����˷�����������ϵ��Ϊ3
		*******************************************************/
		mult_con3 inst_multcon3 (
			  .CLK(clk),  // input wire CLK
			  .A(o_S_sub_BFCG[24:0]),      // input wire [24 : 0] A,�������������Ϊ28λ��ֻȡ��25λ
			  .CE(ce_stage3),      // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .P(o_P_mult)      // output wire [26 : 0] P
		);
		
		/********************************************************
		�׶�4������������(A+E)-(D+H) - 3((B+F)-(C+G))
		********************************************************/
		sub28 inst_sub (
			  .A(o_S_sub_AEDH_r),      // input wire [27 : 0] A
			  .B({1'b0,o_P_mult}),      // input wire [27 : 0] B
			  .CLK(clk),  // input wire CLK
			  .CE(ce_sub),    // input wire CE
			  .SCLR(rst),  // input wire SCLR
			  .S(o_S_sub)      // output wire [27 : 0] S
		);

		
		/************************************************
		*������Ч�ź���ʱ����
		*************************************************/
		always @(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						delay <= 'd0;
					end
				else
					begin
						delay <= {delay[3:0],din_valid};
					end
			end
		
		assign ce_stage2 = delay[1];
		assign ce_stage3 = delay[2];
		assign ce_sub = delay[3];
		assign Dxx_d_o_valid = delay[3];
		assign Dxx_d_o = (Dxx_d_o_valid == 1'b1)?o_S_sub:'d0;
		
		
endmodule
