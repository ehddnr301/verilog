
module Adder4bit_tb;

 // Inputs

 reg [3:0] A;
 reg [3:0] B;
 reg Cin;

 // Outputs

 wire [3:0] Sum;
 wire Cout;

 integer i;

 // Instantiate the Unit Under Test (UUT)

 Adder4bit uut (  .A(A), 
                 .B(B), 
                 .Cin(Cin), 
                 .Sum(Sum), 
                 .Cout(Cout)
                );

 initial begin
$dumpfile("testbench.vcd"); $dumpvars; 


  // Initialize Inputs

  A    = 4'b0;
  B    = 4'b0;
  Cin  = 4'b0;

  // Wait 100 ns for global reset to finish

  #20;

  A    = 4'b1011;
  B    = 4'b0100;
  Cin  = 4'b0;

  #20;

  A    = 4'b0111;
  B    = 4'b1101;
  Cin  = 4'b1;

  #20 $finish ;

 end

endmodule
