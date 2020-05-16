module tb_up_down;

reg tb_nRst;
reg tb_clk;
reg tb_x;
wire [1:0] tb_value;

one_alwys u0(
    .value(tb_value),
    .nRst(tb_nRst),
    .clk(tb_clk),
    .x(tb_x)
);

always
    #5 tb_clk = ~tb_clk;

initial begin
  tb_clk = 0;
  tb_x = 0;
  tb_nRst = 1;
  #10 tb_nRst = 0;
  #10 tb_nRst = 1;
  #40 tb_x = 1;
  #50 $finish;
end

endmodule // 