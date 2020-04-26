`include "seg.v"
`include "a.v"

module BCD_a_FND(
    input [3:0] a,
    input [3:0] b,
    output wire [7:0] seg1,
    output wire [7:0] seg0
    );

wire [3:0] r0;
wire [3:0] r1;


// 덧셈을 먼저한 후에
B_adder ba0 (
    .add_a(a),
    .add_b(b),
    .add_result_0(r0),
    .add_result_1(r1)
);

// 세그먼트 r0 표시
segment s0 (
    .sin(r0),
    .seg(seg0)
);

// 세그먼트 r1 표시
segment s1 (
    .sin(r1),
    .seg(seg1)
);

endmodule 