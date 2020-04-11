
module tb_mux_eight();


 reg [2:0] t_s;
 reg t_I0;
 reg t_I1;
 reg t_I2;
 reg t_I3;
 reg t_I4;
 reg t_I5;
 reg t_I6;
 reg t_I7;

 wire t_result;

 integer i;

 mux_eight me0 (
  .result(t_result), 
  .s(t_s), 
  .I0(t_I0), 
  .I1(t_I1), 
  .I2(t_I2), 
  .I3(t_I3), 
  .I4(t_I4), 
  .I5(t_I5), 
  .I6(t_I6), 
  .I7(t_I7)
 );


 initial begin
 $dumpfile("testbench.vcd"); $dumpvars; 

  t_s = 0;
  t_I0 = 0;
  t_I1 = 0;
  t_I2 = 0;
  t_I3 = 0;
  t_I4 = 0;
  t_I5 = 0;
  t_I6 = 0;
  t_I7 = 0;

  #10

  t_s = 3'b000;
  t_I0 = 1;
  t_I1 = 0;
  t_I2 = 1;
  t_I3 = 0;
  t_I4 = 1;
  t_I5 = 0;
  t_I6 = 1;
  t_I7 = 0;

  for (i = 0; i < 8; i = i + 1'b1)
  begin
   $display("Count: %d Select: %b", i, t_s);
   #5 t_s = t_s + 3'b001;
  end
#5 $finish;
 end      

endmodule

