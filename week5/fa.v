module full_adder1(In1,In2,Cin,Sum,Cout);

input wire In1,In2,Cin;
output wire Cout,Sum;

assign Cout = ((In1&In2) | (In2&Cin) | (In1&Cin));
assign Sum = (In1^In2)^Cin;

endmodule // full_adder1


