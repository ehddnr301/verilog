module decoder2(x, D, en);

input en;
input [2:0] x;
output [7:0] D;

reg [7:0] D;

always @(*) begin
    D = en ? 8'b00000001 << x : 8'h00;
    $display("Output: %8b", D);
end


endmodule