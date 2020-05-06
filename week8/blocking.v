module blocking_assign(
    clk,
    data,
    rega,
    regb
);

input data, clk;
output reg rega, regb;

always @(posedge clk) begin

    rega = data;
    regb = rega;
    
end

endmodule // 