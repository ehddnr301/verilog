module tb_clock_divider;

reg t_clk, t_nRst;
wire t_div4, t_div16;

clock_divider cd0(
    .clk(t_clk),
    .nRst(t_nRst),
    .div4(t_div4),
    .div16(t_div16)
);

always
    #20 t_clk = ~t_clk
    // 20ns 를 주기로 반전되는데 그럼 한주기가 40ns
    // 40ns 은 25Mhz

initial begin
  t_clk = 0;
  t_nRst = 1;
  #100 t_nRst = 0;
  #200 t_nRst = 1;
  #2000 $finish;
end

endmodule