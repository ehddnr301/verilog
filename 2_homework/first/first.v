module decoder2(x, D, en);

input en;
input [2:0] x;
output [7:0] D;

reg [7:0] D;

always @(*) begin
    // if (!en)
    //     D = #1 8'h00;
    // else begin
    //     D = 8'b0000_0001 << x;
    // end
    D = en ? 8'b00000001 << x : 8'h00;
    $display("Output: %8b", D);
end


endmodule