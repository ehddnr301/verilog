
module tb_Adder4bit;


 reg [3:0] A;
 reg [3:0] B;
 reg Cin;


 wire [3:0] Sum;
 wire Cout;



 Adder4bit a (  .A(A), 
                 .B(B), 
                 .Cin(Cin), 
                 .Sum(Sum), 
                 .Cout(Cout)
                );

 initial begin
$dumpfile("testbench.vcd"); $dumpvars; 



  A    = 4'b0;
  B    = 4'b0;
  Cin  = 0;


  #20;

  A    = 4'b1111;
  B    = 4'b1111;
  Cin  = 0;
  

  #20;

  A    = 4'b0000;
  B    = 4'b1111;
  Cin  = 1;

  #20;

  A    = 4'b0100;
  B    = 4'b1011;
  Cin  = 0;

  #20;

  A    = 4'b0111;
  B    = 4'b1100;
  Cin  = 1;

  #20 $finish ;

 end

endmodule
