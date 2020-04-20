module tb_adder_subtractor_8bits;

reg [7:0] tb_a;
reg [7:0] tb_b;

reg tb_k;

wire [7:0] tb_sum;
wire tb_cout;

adder_subtractor_8bits as8 (
    .a(tb_a),
    .b(tb_b),
    .k(tb_k),
    .cout(tb_cout),
    .sum(tb_sum)
);

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 


  tb_a = 0;
  tb_b = 0;
  tb_k = 0;

  #10 
      tb_k=0;
      tb_a=8'b10000000;
      tb_b=8'b11001000;
  #10

    tb_a = 0;
  tb_b = 0;
  tb_k = 0;

  #10 
      tb_k=1;
      tb_a=8'b10000000;
      tb_b=8'b11001000;
    
  #10 
      tb_k=0;
      tb_a=8'b10011101;
      tb_b=8'b00100000;

  #10 
      tb_k=1;
      tb_a=8'b01111100;
      tb_b=8'b00011000;
  #10 $finish;


end

endmodule