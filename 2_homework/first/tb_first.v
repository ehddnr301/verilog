module tb_decoder();

reg [2:0] t_x;
wire [7:0] t_d;
reg t_en;

decoder2 dec0 (.en(t_en), .x(t_x), .D(t_d));

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
  #10 t_en = 0;
  #10 t_x = 3;
  #10 t_x = 4;
  #10 t_x = 5;
  #10 t_x = 0;
  // t_en 이 바뀌면서 값이 진행됨을 표현
  #10 t_en = 1;
  #10 t_x = 0;
  #10 t_x = 1;
  #10 t_x = 2;
  #10 t_x = 3;
  #10 t_x = 4;
  #10 t_x = 5;
  #10 t_x = 6;
  #10 t_x = 7;
  #10 $finish;
end

endmodule // tb_decoder