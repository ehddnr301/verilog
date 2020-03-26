module full_adder1(a,b,cin,count,sum);

input a,b,cin;
output count,sum;

assign #1 count = ((a&b) | (a&cin) | (b&cin));
assign #1 sum = a^b^cin;

endmodule // full_adder1