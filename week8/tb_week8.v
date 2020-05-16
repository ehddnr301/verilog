module tb_one;

reg t_clk, t_nRst;
wire [7:0] t_value;

one_digit_7seg U0 (
    .clk(t_clk),
    .nRst(t_nRst),
    .seg_dat(t_value)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
  t_clk = 0;
  t_nRst = 1;

  #1 t_nRst = 0;
  #125000000 $finish;
end

always
    #1 t_clk = ~t_clk;

endmodule // tb_counter