module DFF(
    CLK,
    D,
    Q,
    nQ
);

input CLK, D;
output Q, nQ;

reg Q, nQ;

always @(posedge CLK) begin
    Q <= #10 D;
    nQ <= #10 ~D;
end

endmodule