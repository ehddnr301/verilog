`include "as.v"
`include "com.v"
`include "bw.v"


module ASBC(
    a,
    b,
    sel,
    cout,
    result
);

// selector 에 따라 어떤 연산을 할지 결정
input [1:0] sel;

// 인풋 a,b
input [7:0] a;
input [7:0] b;

// 최종 cout 값
output cout;

// adder에 연결된 cout0, subtractor에 연결된 cout1
wire cout0;
wire cout1;

// adder에 연결된 연산결과 r, subtractor에 연결된 r1, bitwise에 연결된 r2
wire [7:0] r;
wire [7:0] r1;
wire [7:0] r2;

// comparator에 연결되는 값들
wire rG;
wire rE;
wire rL;

// 결과를 저장하는 변수
reg aGreaterb, aEqualb, aLessb;
reg cout;
output reg [7:0] result;

// adder와 subtractor를 동작시키기 위한 0과 1 값
parameter i = 1'b0;
parameter j = 1'b1;

// adder 연결
adder_subtractor_8bits as0 (
            .a(a),
            .b(b),
            .k(i),
            .cout(cout0),
            .sum(r)
        );

// subtractor 연결
adder_subtractor_8bits as1 (
            .a(a),
            .b(b),
            .k(j),
            .cout(cout1),
            .sum(r1)
        );

// bitwise 연결
bitwise bw0 (
    .a(a),
    .b(b),
    .result(r2)
);

// comparator 연결
comparator com0 (
    .a(a),
    .b(b),
    .aGreaterB(rG),
    .aEqualB(rE),
    .aLessB(rL)
);

// 연산 결과를 확실히 보기위해 sel이 바뀔때만 작동합니다.
always@(sel) begin

// 결과가 저장되는 값들을 0으로 초기화 시켜줍니다.
  result = 8'b00000000;
  cout = 0;
  aGreaterb = 0;
  aEqualb = 0;
  aLessb = 0;

// sel이 00 인 경우 
  if (sel == 2'b00) begin
    $display("2'b00");
    result = r;
    cout = cout0;
    aGreaterb = 0;
    aEqualb = 0;
    aLessb = 0;
    $display("result 는 : %b, cout 은 : %b", result, cout);
    $display("rG 는 : %b, rE 는 : %b, rL 은 : %b", aGreaterb, aEqualb, aLessb);
  end

// sel이 01 인 경우 
  else if(sel ==2'b01) begin
    $display("2'b01");
    result = r1;
    cout = cout1;
    aGreaterb = 0;
    aEqualb = 0;
    aLessb = 0;
    $display("result 는 : %b, cout 은 : %b", result, cout);
    $display("rG 는 : %b, rE 는 : %b, rL 은 : %b", aGreaterb, aEqualb, aLessb);
  end

// sel이 10 인 경우 
  else if (sel == 2'b10) begin
    $display("2'b10");
    result = r2;
    cout = 0;
    aGreaterb = 0;
    aEqualb = 0;
    aLessb = 0;
    $display("result 는 : %b, cout 은 : %b", result, cout);
    $display("rG 는 : %b, rE 는 : %b, rL 은 : %b", aGreaterb, aEqualb, aLessb);
  end

// sel이 11 인 경우 
  else if (sel == 2'b11) begin
    $display("2'b11");
    result = 8'h00;
    cout = 0;
    aGreaterb = rG;
    aEqualb = rE;
    aLessb = rL;
    $display("result 는 : %b, cout 은 : %b", result, cout);
    $display("rG 는 : %b, rE 는 : %b, rL 은 : %b", aGreaterb, aEqualb, aLessb);
  end

  else begin
    $display("—————————————————");
  end

end

endmodule