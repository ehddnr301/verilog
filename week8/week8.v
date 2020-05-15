`include "clock.v"
`include "seg.v"

module one_digit_7seg(
    input clk,
    input nRst,
    output wire [7:0] seg_dat,
    output reg seg_sel
);

reg [3:0] Q;
wire clk1hz;

counter c0 (
    .clk(clk),
    .reset(nRst),
    .clk1hz(clk1hz)
);

always @(posedge clk1hz) begin
    seg_sel = 0;
    if(nRst == 1)
        Q <= 4'b0000;
    else
        Q <= Q + 1;
end


segment s0(
    .sin(Q),
    .seg(seg_dat)
);



endmodule