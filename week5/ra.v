`include "fa.v"

module Adder4bit(A,
                 B,
                 Cin,
                 Cout,
                 Sum
                );

input [3:0] A;
input [3:0] B;

input Cin;

output Cout;
output [3:0] Sum;

wire [3:0] transferC;
wire [3:0] exOrB;
assign exOrB[3] = B[3]^Cin;
assign exOrB[2] = B[2]^Cin;
assign exOrB[1] = B[1]^Cin;
assign exOrB[0] = B[0]^Cin;
assign Cout = transferC[3];

full_adder1 FA1 ( .In1(A[3]),
                .In2(exOrB[3]),
                .Cin(transferC[2]),
                .Cout(transferC[3]),
                .Sum(Sum[3])
               );

full_adder1 FA2 ( .In1(A[2]),
                .In2(exOrB[2]),
                .Cin(transferC[1]),
                .Cout(transferC[2]),
                .Sum(Sum[2])
                );

full_adder1 FA3 ( .In1(A[1]),
                .In2(exOrB[1]),
                .Cin(transferC[0]),
                .Cout(transferC[1]),
                .Sum(Sum[1])
               );

full_adder1 FA4 ( .In1(A[0]),
                .In2(exOrB[0]),
                .Cin(Cin),
                .Cout(transferC[0]),
                .Sum(Sum[0])
               );

endmodule
