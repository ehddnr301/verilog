module adder_subtractor(
    a,
    b,
    k,
    cout,
    s
);

input [3:0] a, b;
input k;
output [3:0] cout;
output [3:0] s;

wire [3:0] c;
assign cout = c[3];

fa fa3(.a(a[3]), .b(b[3]^k), .cin(c[2], cout(c[3])) )

endmodule // adder_subtractor