module bitwise(
    a,
    b,
    result
);

input [7:0] a;
input [7:0] b;
output [7:0] result;

wire result;

assign result = a ^ b;


endmodule // bitwise