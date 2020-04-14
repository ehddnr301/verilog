module full_adder1(In1,In2,Cin,Sum,Cout);

input In1,In2,Cin;
output Cout,Sum;

assign #3 Cout = ((In1&In2) | (In1&Cin) | (In2&Cin));
assign #3 Sum = In1^In2^Cin;

endmodule // full_adder1
