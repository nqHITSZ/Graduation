
module Accumulator #
(
    parameter DIN_DATA_WIDTH = 8,
    parameter DOUT_DATA_WIDTH = 28
)
(
    input clk, sclr,
    input [DIN_DATA_WIDTH-1 : 0] B,
    input ce, bypass,
    output reg [DOUT_DATA_WIDTH-1 : 0] Q
);

always @(posedge clk)
    if(sclr)
        Q <= 0;
    else if(ce)
        Q <= bypass? B : Q + B ;

endmodule
