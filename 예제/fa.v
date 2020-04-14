module full_adder(a,b,cin,cout,sum);

input a,b,cin;
output cout,sum;

assign #1 cout = ((a&b) | (a&cin) | (b&cin));
assign #1 sum = a^b^cin;

endmodule // full_adder1