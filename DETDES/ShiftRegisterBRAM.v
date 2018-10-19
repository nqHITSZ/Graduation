`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/28 11:17:30
// Design Name: 
// Module Name: ShiftRegisterBRAM
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



module ShiftRegisterBRAM //FIFO STYLE
#(
    parameter DATA_DEPTH = 640,
    parameter DATA_WIDTH = 28
)
(
    input clk,
    input rst,
    input [DATA_WIDTH-1:0]  shift_in,
    output [DATA_WIDTH-1:0] shift_out

);

localparam DW = DATA_WIDTH;


// function called clogb2 that returns an integer which has the
// value of the ceiling of the log base 2.                                           
function integer clogb2 (input integer bit_depth);                                   
begin                                                                              
    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
    bit_depth = bit_depth >> 1;                                                    
end                                                                                
endfunction                                                                          

// WAIT_COUNT_BITS is the width of the wait counter.                                 
localparam integer AW = clogb2(DATA_DEPTH-1);  


reg [AW-1:0] write_pointer;
reg [AW-1:0] read_pointer;


always @(posedge clk) begin
    write_pointer <= read_pointer; //write_pointer lags behind read_pointter one clock cycle
    read_pointer <= (read_pointer==DATA_DEPTH-1)? 0 : read_pointer + 1'd1; 
    if (rst) begin
        read_pointer  <= 0;
        write_pointer <= 0;
    end
end

bram_sd
#(
    .DATA_DEPTH(DATA_DEPTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(AW)
)
fifo_ram
(
    .clk(clk),
    .dout(shift_out),
    .raddr(read_pointer[AW-1:0]),
    .re(1'b1),
    .waddr(write_pointer[AW-1:0]),
    .we(1'b1),
    .din(shift_in)
);

endmodule
