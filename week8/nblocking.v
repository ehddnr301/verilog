module nonblocking_assign(
    clk,
    data,
    regc,
    regd
);

input data, clk;
output reg regc, regd;

always @(posedge clk) begin

    regc <= data;
    regd <= regc;
    
end

endmodule // nonblocking_assign