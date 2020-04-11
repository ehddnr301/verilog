module tb_decoder();

reg [2:0] t_x;
wire [7:0] t_d;

decoder dec0 (.x(t_x), .D(t_d));

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
  t_x = 0;
  #5 t_x = 1;
  #5 t_x = 2;
  #5 t_x = 3;
  #5 t_x = 4;
  #5 t_x = 5;
  #5 t_x = 6;
  #5 t_x = 7;
  #5 $finish;
end

endmodule // tb_decoder