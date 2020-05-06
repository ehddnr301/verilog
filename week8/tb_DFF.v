module tb_dff;

reg t_clk, t_d;
wire t_q, t_nq;

DFF U0 (
    .CLK(t_clk),
    .D(t_d),
    .Q(t_q),
    .nQ(t_nq)
);

always
    #50 t_clk = ~t_clk;
    // 매 #50 이후에 t_clk = ~t_clk;
    // clk period는 100ns 주기
    // 100ns = 10Mhz

initial begin
    t_clk = 0;
    t_d = 0;

    #10 t_d = 1;
    #110 t_d = 0;
    #10 t_d = 1;
    #110 t_d = 0;
    $finish;
end

endmodule