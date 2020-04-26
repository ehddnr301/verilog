module B_adder(
    input wire [3:0] add_a,
    input wire [3:0] add_b,
    output reg [3:0] add_result_0,
    output reg [3:0] add_result_1
);


always @(*) begin
    if (add_a > 16 || add_b > 16) begin
        add_result_1 = 4'b1111;
        add_result_0 = 4'b1111;
    end
    // 입력이 10이상인 경우 a,b,c.. 이렇게 넘어가지 않아야 하기 때문에 덧셈
    // 1 + 11 = r1:1 r0:2 가 나와야 하는데 덧셈처리를 안해주면 r1:0 r0:b 가 되기 떄문
    else begin
        // a만 10이상인 경우
       if (add_a > 9 && add_b <10)begin
        {add_result_1, add_result_0} = add_a + add_b +6;
       end
        // b만 10이상인 경우
       else if(add_b > 9 && add_a < 10) begin
        {add_result_1, add_result_0} = add_a + add_b +6;
       end
        // a, b 둘다 10이상인 경우
       else if(add_b > 9 && add_a > 9) begin
        {add_result_1, add_result_0} = add_a + add_b +12;
       end
       else begin
       // 둘다 10 미만인 경우
        {add_result_1, add_result_0} = add_a + add_b;
       end

    // result가 10을 초과하는 값이 있을경우 segment에 a,b,c... 를 표시하지 않기위해서 덧셈
       if(add_result_0 > 9)begin
        add_result_1 = add_result_1 + 1;
        add_result_0 = add_result_0 + 6;
       end
       else begin
        add_result_1 = add_result_1;
        add_result_0 = add_result_0;
       end
    end
end

endmodule