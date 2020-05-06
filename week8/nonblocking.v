module pipe(
    q3,
    d,
    clk
);

input [7:0] d;
input clk;
output [7:0] q3;

reg [7:0] q3,q2,q1;

always @(posedge clk) begin

q1 <= d;
q2 <= q1;
q3 <= q2;
    
end

endmodule // 

module pipe2(
    q3,
    d,
    clk
);

input [7:0] d;
input clk;
output [7:0] q3;

reg [7:0] q3,q2,q1;

always @(posedge clk) q1 = d;  // 1
always @(posedge clk) q2 = q1; // 2
always @(posedge clk) q3 = q2; // 3


endmodule // pipe2

// pipe2 는 3-2-1 1-2-3 2-1-3 이런식으로 순서가 섞일수 있다.
// 순서가 정해져 있지 않아서 race problem 발생 가능.