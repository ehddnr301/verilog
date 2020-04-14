`include "fa.v"

module ripple_adder(a,b,cin,cout,s);

input [3:0] a;
input [3:0] b;

input cin;

output cout;
output [3:0] s;

wire [3:0] c;
assign cout = c[3];
// c[3] 은 마지막 fa의 cout

full_adder1 fa3(
    .a(a[3]),
    .b(b[3]),
    .cin(c[2]),
    .cout(c[3]),
    .sum(s[3])
);

full_adder1 fa2(
    .a(a[2]),
    .b(b[2]),
    .cin(c[1]),
    .cout(c[2]),
    .sum(s[2])
);

full_adder1 fa1(
    .a(a[1]),
    .b(b[1]),
    .cin(c[0]),
    .cout(c[1]),
    .sum(s[1])
);

full_adder1 fa0(
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .cout(c[0]),
    .sum(s[0])
);


endmodule