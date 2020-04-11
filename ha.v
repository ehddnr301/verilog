module (A,B,S,C);

input A;
input B;
output S;
output C;

assign #1 S = A ^ B;
assign #1 C = A & B;

endmodule // 