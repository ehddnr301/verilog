module sub_half_adder(aa,bb,ss,cc);

input aa,bb;
output ss,cc;
reg ss,cc;

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

sub_half_adder h1(a,b,w2,w1);
			  
sub_half_adder h2(cin,w2,sum,w3);

assign count = w1 | w3;

endmodule

