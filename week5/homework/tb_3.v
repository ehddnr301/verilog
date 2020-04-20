module tb_ASBC;

reg [7:0] tb_a;
reg [7:0] tb_b;

reg [1:0] tb_sel;

wire [7:0] tb_r;
wire tb_cout;

ASBC tbasbc (
    .a(tb_a),
    .b(tb_b),
    .sel(tb_sel),
    .cout(tb_cout),
    .result(tb_r)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 

  #10;
  tb_sel = 2'bxx;
  tb_a = 0;
  tb_b = 0;

  // sel이 바뀔때만 동작하게 해놓았기 때문에 
  // 입력값을 미리 바꾸고 제일 나중에 sel값을 바꾸어 연산을 진행시킵니다.

  // ADD
  #10;
  tb_a = 8'b10001111;
  tb_b = 8'b11110000;
  #5;
  tb_sel = 2'b00;

  #10;


  // SUB
  #10;
  tb_a = 8'b01000000;
  tb_b = 8'b10000000;
  #5;
  tb_sel = 2'b01;

  #10;


  // Bit Wise XOR
  #10;
  tb_a = 8'b11111111;
  tb_b = 8'b10000000;
  #5;
  tb_sel = 2'b10;



  // Comparator
  #10;
  tb_a = 8'b11111111;
  tb_b = 8'b00000001;
  #5;
  tb_sel = 2'b11;
  #10;

  // 압력값이 바뀌어야 작동하기 때문에 sel을 바꾸어 줍니다.
  tb_sel = 2'bxx;

  #10;
  tb_a = 8'b11111111;
  tb_b = 8'b11111111;
  #5;
  tb_sel = 2'b11;
  #10;

  // 압력값이 바뀌어야 작동하기 때문에 sel을 바꾸어 줍니다.
  tb_sel = 2'bxx;

  #10;
  tb_a = 8'b01111111;
  tb_b = 8'b11111111;
  #5;
  tb_sel = 2'b11;
  #10;

end

endmodule 