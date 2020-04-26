module tb_segment();

reg tb_clock;
wire [12:0] tb_seg;

segment s0 (
    .clock(tb_clock),
    .seg(tb_seg)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
  #5;

  tb_clock = 1;

  # 20;
end

endmodule