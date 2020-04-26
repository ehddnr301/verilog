module B_adder(
    input wire [3:0] add_a,
    input wire [3:0] add_b,
    output reg [3:0] add_result_0,
    output reg [3:0] add_result_1
);


always @(*) begin
    // 입력이 10이상인 경우 segment를 끕니다.
    // 끄기위해 segment case에 없는 케이스를 넣어 default에 걸리게 합니다.
    if (add_a > 9 || add_b >9)begin
        add_result_1 = 4'b1111;
        add_result_0 = 4'b1111;
    end
    else begin
    // 예를들어 9+9 를 수행하면 18 인데 그냥 덧셈하면 1_0010 이라서 12가 표시된다.
    // 이를 막기위해 합이 10 초과라면 6을 더해줍니다.
       if((add_a + add_b) >10)begin
        {add_result_1, add_result_0} = add_a + add_b + 6;
       end
       else begin
        {add_result_1, add_result_0} = add_a + add_b;
       end
    // 마찬가지로 result0가 10을 초과하는 값이 된 경우 segment에 a,b,c... 를 표시하지 않기위해서 덧셈합니다.
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