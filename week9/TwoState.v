module two_always(
    value,
    nRst,
    clk,
    x
);

input nRst, clk, x
output reg [1:0] value;

parameter [1:0] S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;

always @(posedge clk) begin
    if(!nRst)
        state <= #1 S0;
    else
        state <= #1 next;
end

always @(*) begin
    next = 2'bx;
    value = 2'bxx;
    case (state)
    S0: begin
        if (~x) next = S1;
        else next = S3;
        value = 2'b00;
    end
    S1: begin
        if (~x) next = S2;
        else next = S0;
        value = 2'b01;
    end
    S2: begin
        if (~x) next = S3;
        else next = S1;
        value = 2'b10;
    end
    S3: begin
        if (~x) next = S0;
        else next = S2;
        value = 2'b11;
    end
    endcase

end

endmodule // 