module adder_subtractor_8bits(
    input [7:0] a,
    input [7:0] b,
    input k,
    output reg cout,
    output reg [7:0] sum
);

// input [7:0] a,b;

// input k;

// output cout,s;

// reg cout;
// reg [7:0] sum ;

always @(*) begin

if(k==0) begin
{cout,sum} = a+b; 
end
else sum = a-b;

end

endmodule