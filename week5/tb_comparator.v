module tb_comparator;

parameter TB_WIDTH = 8;

reg [TB_WIDTH - 1 : 0] tb_a, tb_b;
wire tb_aGb, tb_aEb, tb_aLb;

comparator #(.WIDTH(TB_WIDTH))  com0(
    .a(tb_a),
    .b(tb_b),
    .aGreaterB(tb_aGb),
    .aEqualB(tb_aEb),
    .aLessB(tb_aLb)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 

  tb_a = 1;
  tb_b = 5;
  #5
  tb_a = 5;
  #5
  tb_a = 10;
  #5
  tb_a = 20;
  #5
  $finish();
end

endmodule