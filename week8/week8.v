`timescale 1ns/1ps
`include "clock.v"
`include "seg.v"

module one_digit_7seg(
input clk,
input nRst,
output wire [7:0] seg_dat,
output reg seg_sel = 0
);

 

wire [3:0] Q;
wire clk1hz;

counter c0(
.clk(clk),
.reset(nRst),
.clk1hz(clk1hz),
.Q(Q)
);

segment s0(
.sin(Q),
.seg(seg_dat)
);

endmodule