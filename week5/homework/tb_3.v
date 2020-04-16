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
    .r(tb_r)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 

  tb_a = 0;
  tb_b = 0;

  // ADD
  #10;
  tb_a = 8'b10001111;
  tb_b = 8'b11110000;
  tb_sel = 2'b00;

  // SUB
  #10;
  tb_a = 8'b01000000;
  tb_b = 8'b10000000;
  tb_sel = 2'b01;

  // Bit Wise XOR
  #10;
  tb_a = 8'b11111111;
  tb_b = 8'b10000000;
  tb_sel = 2'b10;

  // Comparator
  #10;
  tb_a = 8'b11111111;
  tb_b = 8'b00000001;
  tb_sel = 2'b11;
  #10;

  tb_sel = 2'bxx;

  #10;
  tb_a = 8'b11111111;
  tb_b = 8'b11111111;
  tb_sel = 2'b11;
  #10;

  tb_sel = 2'bxx;

  #10;
  tb_a = 8'b01111111;
  tb_b = 8'b11111111;
  tb_sel = 2'b11;
  #10;

end

endmodule 