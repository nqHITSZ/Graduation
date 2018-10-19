`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/11 13:44:26
// Design Name: 
// Module Name: derXY
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


module	derXY #(parameter	DATA_WIDTH = 28)
		(
			
			input	wire	[DATA_WIDTH - 1:0]		A,
			input	wire	[DATA_WIDTH - 1:0]		B,
			input	wire	[DATA_WIDTH - 1:0]		C,
			input	wire	[DATA_WIDTH - 1:0]		D,
			input	wire	[DATA_WIDTH - 1:0]		E,
			input	wire	[DATA_WIDTH - 1:0]		F,
			input	wire	[DATA_WIDTH - 1:0]		G,
			input	wire	[DATA_WIDTH - 1:0]		H,
			input	wire	[DATA_WIDTH - 1:0]		I,
			input	wire	[DATA_WIDTH - 1:0]		J,
			input	wire	[DATA_WIDTH - 1:0]		K,
			input	wire	[DATA_WIDTH - 1:0]		L,
			input	wire	[DATA_WIDTH - 1:0]		M,
			input	wire	[DATA_WIDTH - 1:0]		N,
			input	wire	[DATA_WIDTH - 1:0]		O,
			input	wire	[DATA_WIDTH - 1:0]		P,
			input	wire							clk,
			input	wire							rst_n,
			input	wire							din_valid,
			output	wire	[DATA_WIDTH - 1:0]		Dxy_d_o,
			output	wire							Dxy_d_o_valid
		
		);
		
		wire						rst;
		wire	[DATA_WIDTH - 1:0]	o_S_adderAF;//A��F�͵����
		wire	[DATA_WIDTH - 1:0]	o_S_adderBE;
		wire	[DATA_WIDTH - 1:0]  o_S_adderKP;
		wire	[DATA_WIDTH - 1:0]	o_S_adderLO;
		wire	[DATA_WIDTH - 1:0]	o_S_adderIN;
		wire	[DATA_WIDTH - 1:0]	o_S_adderJM;
		wire	[DATA_WIDTH - 1:0]	o_S_adderCH;
		wire	[DATA_WIDTH - 1:0]	o_S_adderDG;
		wire	[DATA_WIDTH - 1:0]	o_S_subAFBE; //(A+F)-(B+E)�Ľ�����
		wire	[DATA_WIDTH - 1:0]	o_S_subKPLO;
		wire	[DATA_WIDTH - 1:0]	o_S_subINJM;
		wire	[DATA_WIDTH - 1:0]	o_S_subCHDG;
		wire	[DATA_WIDTH - 1:0]	o_S_stage3_adder1;
		wire	[DATA_WIDTH - 1:0]	o_S_stage3_adder2;
		wire						ce_stage2;  //�׶�2������ʹ���ź�
		wire						ce_stage3;  //�׶�3�ӷ���ʹ���ź�
		wire						ce_stage4;	//�׶�4��������ʹ��
		reg		[4:0]				delay;		//���׶�ʹ���źſ���
		
		assign rst = ~rst_n;
		
		/*********************************************
		*�׶�1�ӷ�������,��������:inst_adder_XX,(XXΪ
		*����ļ���),��AF��BE��KP��LO��IN��JM��CH��DG
		*********************************************/
		adder28_un inst_adder_AF (
				  .A(A),        // input wire [31 : 0] A
				  .B(F),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderAF)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_BE (
				  .A(B),        // input wire [31 : 0] A
				  .B(E),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderBE)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_KP (
				  .A(K),        // input wire [31 : 0] A
				  .B(P),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderKP)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_LO (
				  .A(L),        // input wire [31 : 0] A
				  .B(O),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderLO)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_IN (
				  .A(I),        // input wire [31 : 0] A
				  .B(N),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderIN)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_JM (
				  .A(J),        // input wire [31 : 0] A
				  .B(M),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderJM)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_CH (
				  .A(C),        // input wire [31 : 0] A
				  .B(H),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderCH)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_adder_DG (
				  .A(D),        // input wire [31 : 0] A
				  .B(G),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(din_valid),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_adderDG)        // output wire [31 : 0] S
		);
		
		
		/******************************************************************
		*�׶�2����������,��������:inst_sub_XXXX;(X+X)-(X+X)
		*��AFBE����A+F��-��B+E��
		*******************************************************************/
		sub28 inst_sub_AFBE (
				  .A(o_S_adderAF),        // input wire [31 : 0] A
				  .B(o_S_adderBE),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage2),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_subAFBE)        // output wire [31 : 0] S
		);
		
		
		sub28 inst_sub_KPLO (
				  .A(o_S_adderKP),        // input wire [31 : 0] A
				  .B(o_S_adderLO),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage2),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_subKPLO)        // output wire [31 : 0] S
		);
		
		
		sub28 inst_sub_INJM (
				  .A(o_S_adderIN),        // input wire [31 : 0] A
				  .B(o_S_adderJM),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage2),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_subINJM)        // output wire [31 : 0] S
		);
		
		
		sub28 inst_sub_CHDG (
				  .A(o_S_adderCH),        // input wire [31 : 0] A
				  .B(o_S_adderDG),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage2),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_subCHDG)        // output wire [31 : 0] S
		);
		
		
		/***********************************************************
		*�׶�3�ӷ�������,ʵ��:
		*((A+F)-(B+E))+((K+P)-(L+O))
		*((I+N)-(J+M))+((C+H)-(D+G))
		***********************************************************/
		adder28_un inst_stage3_adder1 (
				  .A(o_S_subAFBE),        // input wire [31 : 0] A
				  .B(o_S_subKPLO),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage3),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_stage3_adder1)        // output wire [31 : 0] S
		);
		
		
		adder28_un inst_stage3_adder2 (
				  .A(o_S_subINJM),        // input wire [31 : 0] A
				  .B(o_S_subCHDG),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage3),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(o_S_stage3_adder2)        // output wire [31 : 0] S
		);
		
		
		/************************************************
		*�׶�4����������
		*************************************************/
		
		sub28 sub_stage4 (
				  .A(o_S_stage3_adder1),        // input wire [31 : 0] A
				  .B(o_S_stage3_adder2),        // input wire [31 : 0] B
				  .CLK(clk),    // input wire CLK
				  .CE(ce_stage4),      // input wire CE
				  .SCLR(rst),  // input wire SCLR
				  .S(Dxy_d_o)        // output wire [31 : 0] S
		);
		
		
		/***********************************************
		*���׶�ʹ���źſ��ƣ�ͨ����λ��ʱʵ��
		***********************************************/
		always @(posedge clk)
			begin
				if(rst_n == 1'b0)
					begin
						delay <= 'd0;
					end
				else
					begin
						delay <= {delay[3:0],din_valid};//λƴ�ӣ���λ����
					end
			end
		
		assign ce_stage2 = delay[0];     //����������Ч��ʱһ�����ڣ���ӷ���ʱ��Ϊһ������
		assign ce_stage3 = delay[1];
		assign ce_stage4 = delay[2];
		/**********************************************************************
		�����Ч�������detH�еĳ������ӿ���
				  AXI_StreamЭ�飬Dxx_d_o_valid����ǰ��Ч
		**********************************************************************/
		assign Dxy_d_o_valid = delay[3] | delay[4] ;

endmodule
