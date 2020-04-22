`include "seg.v"

module BCD_a_FND(
    input [3:0] a,
    input [3:0] b,
    output [7:0] seg1,
    output [7:0] seg0
    );

reg [3:0] r1;
reg [3:0] r0;

wire [7:0] seg1;
wire [7:0] seg0;

segment s0 (
    .sin(r0),
    .seg(seg0)
);

segment s1 (
    .sin(r1),
    .seg(seg1)
);

always @ ( b )
begin
    if (a > 9 || b > 9) begin
        r1 = 0;
        r0 = 0;
        $display("Fail r1 : %d, r0: %d", r1, r0);
        $display("Fail seg1 : %b, seg0: %b", seg1, seg0);
    end
    else begin
        {r1, r0} = a + b;
        $display("r1 : %d, r0: %d", r1, r0);
        $display("seg1 : %b, seg0: %b", seg1, seg0);
    end
end
endmodule 