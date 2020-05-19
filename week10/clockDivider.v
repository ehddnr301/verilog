module clock_divider(
    input clk,
    input nRst,
    output div4,
    output div16,
);

reg [3:0] counter;
// 0~ 15

always @(posedge clk) begin
    if(~nRst)
        counter <= #1 8'h0;
    else
        counter <= #1 counter +1;
end

assign div4 = counter[1];
assign div16 = counter[3];
// 0000 => counter[1] = 0  |  counter[3] = 0
// 0001 => counter[1] = 0  |  counter[3] = 0
// 0010 => counter[1] = 1  |  counter[3] = 0
// 0011 => counter[1] = 1  |  counter[3] = 0
// 0100 => counter[1] = 0  |  counter[3] = 0
// 0101 => counter[1] = 0  |  counter[3] = 0
// 0110 => counter[1] = 1  |  counter[3] = 0
// 0111 => counter[1] = 1  |  counter[3] = 0
// 1000 => counter[1] = 0  |  counter[3] = 1
// 1001 => counter[1] = 0  |  counter[3] = 1
// 1010 => counter[1] = 1  |  counter[3] = 1
// 1011 => counter[1] = 1  |  counter[3] = 1
// 1100 => counter[1] = 0  |  counter[3] = 1
// 1101 => counter[1] = 0  |  counter[3] = 1
// 1110 => counter[1] = 1  |  counter[3] = 1
// 1111 => counter[1] = 1  |  counter[3] = 1
endmodule // 