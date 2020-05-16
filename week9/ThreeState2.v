module three_always(
    value,
    nRst,
    clk,
    x
);

output reg [1:0] value;
input nRst, clk, x;

parameter [1:0] S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;

reg [1:0] state, next;

// state 정보 업데이트
always @(posedge clk) begin
    if(!nRst)
        state <= #1 S0;
    else
        state <= #1 next;
end

// 출력을 결정하기 위한 always
always @(posedge clk) begin
    if (!nRst)
        value <= 2'bxx;
    else begin
        case(next)
        S0: value <= 2'b00;
        S1: value <= 2'b01;
        S2: value <= 2'b10;
        S3: value <= 2'b11;
        endcase
    end
    
end


// next state를 결정하기 위한 always
always @(*) begin
    next = 2'bx;
    case(state)
        S0:begin
            if(~x) next = S1;
            else next = S3;
        end
        S1:begin
            if(~x) next = S2;
            else next = S0;
        end
        S2:begin
            if(~x) next = S3;
            else next = S1;
        end
        S3:begin
            if(~x) next = S0;
            else next = S2;
        end
    endcase
end

endmodule // three_always