module tb_counter;

reg t_clk, t_nRst;
wire [3:0] t_value;

counter U0 (
    .CLK(t_clk),
    .nRst(t_nRst),
    .value(t_value)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
  t_clk = 0;
  t_nRst = 1;

  #20 t_nRst = 0;
  #10 t_nRst = 1;
  #200 $finish;
end

always
    #5 t_clk = ~t_clk;

endmodule // tb_counter