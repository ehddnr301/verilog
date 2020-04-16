`include "as.v"
`include "com.v"
`include "bw.v"


module ASBC(
    a,
    b,
    sel,
    cout,
    r
);

input [7:0] a;
input [7:0] b;

input [1:0] sel;

output cout;
output [7:0] r;

output cout1;
output [7:0] r1;

output [7:0] r2;

output rG;
output rE;
output rL;

parameter i = 1'b0;
parameter j = 1'b1;

adder_subtractor_8bits as0 (
            .a(a),
            .b(b),
            .k(i),
            .cout(cout),
            .sum(r)
        );

adder_subtractor_8bits as1 (
            .a(a),
            .b(b),
            .k(j),
            .cout(cout1),
            .sum(r1)
        );

bitwise bw0 (
    .a(a),
    .b(b),
    .result(r2)
);

comparator com0 (
    .a(a),
    .b(b),
    .aGreaterB(rG),
    .aEqualB(rE),
    .aLessB(rL)
);

// Sel이 바뀔때만 작동합니다.
always@(sel) begin
  if (sel == 2'b00) begin
    $display("sel 이2b00 일때 a:%b, b:%b, result : %b %b",a,b, cout,r);
  end
  else if(sel ==2'b01) begin
    $display("sel 이 2b01 일때 a:%b, b:%b, result : %b",a,b, r1);
  end
  else if (sel == 2'b10) begin
    $display("sel 이 2b10 일떄 a:%b, b:%b, result : %b",a,b, r2);
  end
  else if (sel == 2'b11) begin
    $display("sel 이 2b11 일때 com : rG:%b  rE:%b  rL:%b",rG,rE,rL);
  end
  else begin
    $display("----------------------------------------");
  end
end

endmodule