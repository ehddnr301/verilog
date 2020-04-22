module B_adder(
    input [3:0] add_a,
    input [3:0] add_b,
    output [3:0] add_result_0,
    output [3:0] add_result_1
);

wire [3:0] add_a;
wire [3:0] add_b;

reg [3:0] add_result_0;
reg [3:0] add_result_1;

always @(*) begin
    if (add_a > 16 || add_b > 16) begin
        add_result_1 = 0;
        add_result_0 = 0;
    end
    else begin
       if (add_a > 9 && add_b <10)begin
        {add_result_1, add_result_0} = add_a + add_b +6;
       end
       else if(add_b > 9 && add_a < 10) begin
        {add_result_1, add_result_0} = add_a + add_b +6;
       end
       else if(add_b > 9 && add_a > 9) begin
        {add_result_1, add_result_0} = add_a + add_b +12;
       end
       else begin
        {add_result_1, add_result_0} = add_a + add_b;
       end

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