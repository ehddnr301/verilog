module tb_count;

reg t_clk, t_nRst;
wire t_clk1hz;
wire [3:0] t_Q;

counter c0(
    .clk(t_clk),
    .reset(t_nRst),
    .clk1hz(t_clk1hz),
    .Q(t_Q)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
t_clk = 0;
t_nRst = 1;

t_nRst = 0;
  #6000000 $finish;
end

always
    #1 t_clk = ~t_clk;
    

endmodule