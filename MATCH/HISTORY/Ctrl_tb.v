`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/14 11:12:49
// Design Name: 
// Module Name: Ctrl_tb
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


module Ctrl_tb();
localparam PERIOD=10;//100MHz
localparam Tc2o=1;//clock to output delay
reg clk,rst;
initial begin
	clk = 1'b0;
	#(PERIOD/2);
	forever
	 #(PERIOD/2) clk = ~clk;
end



wire[59:0] dout;
wire dout_valid;
wire [9:0]Lx,Ly,Rx,Ry,Px,Py;
reg start;
_top dut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .dout(dout),
    .dout_valid(dout_valid)
    );
    
    //{coor_Slave_1_LR,coor_Slave_1,coor_des_Main_1[147:128]};
assign Lx = dout[19:10];
assign Ly = dout[09:00];
assign Rx = dout[59:50];
assign Ry = dout[49:40];
assign Px = dout[39:30];
assign Py = dout[29:20];

initial begin
	$readmemh("F:/detection_description/teddy/feautre_point_in_teddy6.txt",dut.RAM_1.mem);
	$readmemh("F:/detection_description/teddy/feautre_point_in_teddy2.txt",dut.RAM_3.mem);
	$readmemh("F:/detection_description/teddy/feautre_point_in_teddy_debug.txt",dut.RAM_2.mem);
	
	rst = 1;
	start = 0;
	repeat(10) @(posedge clk);
	@(posedge clk)
		rst <= #(Tc2o) 0;
		start = #(Tc2o) 1;
	@(posedge clk)
		rst <= #(Tc2o) 0;
		start = #(Tc2o) 0;
		
	repeat(2024) @(posedge clk);
	$stop;

	
end

initial begin
	DisplayData();
end

task DisplayData;
begin
    forever begin
        @(posedge clk)
            if(dout_valid) begin
                //$display("hello\n");
                $display( "(%3d,%3d)---(%3d,%3d)-----Parallax:(%3d,%3d)", Lx, Ly, Px, Py, Rx, Ry );
            end
    end
end
endtask


endmodule
