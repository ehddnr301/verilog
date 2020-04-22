module adder_subtractor_8bits(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input k,
    output reg cout,
    output reg [7:0] sum
);



parameter WIDTH = 8;



always @(*) begin

if(k==0) begin
{cout,sum} = a+b; 
$display("cout : %d, sum = %d, a= %d, b = %d", cout, sum, a, b);
end
else begin 
{cout,sum} = a-b;
$display("cout : %d, sum = %d, a= %d, b = %d", cout, sum, a, b);
end

end

endmodule