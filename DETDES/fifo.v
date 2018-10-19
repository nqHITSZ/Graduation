/******************************************************************************
 This Source Code Form is subject to the terms of the
 Open Hardware Description License, v. 1.0. If a copy
 of the OHDL was not distributed with this file, You
 can obtain one at http://juliusbaxter.net/ohdl/ohdl.txt

 Description: Store buffer
 Currently a simple single clock FIFO, but with the ambition to
 have combining and reordering capabilities in the future.

 Copyright (C) 2013 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

 ******************************************************************************/

module fifo
#(
    parameter DATA_DEPTH = 640,
    parameter DATA_WIDTH = 8
)
(
    input    clk,
    input    rst,

    input [DATA_WIDTH-1:0]  wr_data_i,
    input    wr_en_i,

    output [DATA_WIDTH-1:0] rd_data_o,
    input    rd_en_i,

    output    full_o,
    output    empty_o
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


reg [AW:0] write_pointer;
reg [AW:0] read_pointer;

wire empty_int = (write_pointer[AW] == read_pointer[AW]);
wire full_or_empty = (write_pointer[AW-1:0] == read_pointer[AW-1:0]);

assign full_o  = full_or_empty & !empty_int;
assign empty_o = full_or_empty & empty_int;

always @(posedge clk) begin
    if (wr_en_i) begin
        write_pointer[AW-1:0] <= (write_pointer[AW-1:0]==DATA_DEPTH-1)? 0 : write_pointer[AW-1:0] + 1'd1;
        write_pointer[AW] <= (write_pointer[AW-1:0]==DATA_DEPTH-1) ? write_pointer[AW] + 1'd1 : write_pointer[AW];
    end
    if (rd_en_i) begin
        read_pointer[AW-1:0] <= (read_pointer[AW-1:0]==DATA_DEPTH-1)? 0 : read_pointer[AW-1:0] + 1'd1;
        read_pointer[AW] <= (read_pointer[AW-1:0]==DATA_DEPTH-1) ? read_pointer[AW] + 1'd1 : read_pointer[AW];
    end
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
    .dout(rd_data_o),
    .raddr(read_pointer[AW-1:0]),
    .re(rd_en_i),
    .waddr(write_pointer[AW-1:0]),
    .we(wr_en_i),
    .din(wr_data_i)
);

endmodule
