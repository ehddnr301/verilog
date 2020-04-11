module sub_half_adder(aa,bb,ss,cc);

input aa,bb;
output ss,cc;
reg ss,cc;

// assign ss = aa^bb;
// xor(ss,aa,bb);
// assign cc = aa&bb;
// and(cc,aa,bb);
always @(*) begin
    ss = aa^bb;
    cc = aa&bb;
end

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output count
    );

wire w1,w2,w3;

// sub_half_adder h1(.w2(ss), .w1(cc), .a(aa), .b(bb));
sub_half_adder h1(a,b,w2,w1);
			  
// sub_half_adder h2(.sum(ss), .w3(cc), .w2(bb), .cin(cin));
sub_half_adder h2(cin,w2,sum,w3);

or (count,w1,w3);
// assign count = w1 | w3;

endmodule

