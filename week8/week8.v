module one_digit_7seg(
    input clk,
    input nRst,
    output [7:0] seg_dat,
    output reg seg_sel,
);

reg [3:0] Q;
reg clk1hz = 1'b0;

counter c0(
    .clk(clk),
    .reset(nRst),
    .clk1hz(clk1hz)
);

always @(posedge clk1hz) begin
    if(rRst == 1)
        Q <= 4'b000;
    else
        Q <= Q + 1;
end


segment s0(
    .Q(sin),
    .seg_dat(seg)
);

assign seg_sel = 0;

endmodule