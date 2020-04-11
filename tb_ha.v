module tb_ha();

reg A_t, B_t;
wire S_t, C_t;

ha h1 (.A(A_t), .B(B_t), .S(S_t), .C(C_t));
// module_name, instance_name, (포트연결)
// instance name(같은 블럭을 여러개 불러왔을때 구분)
initial begin
    A_t = 0;
    B_t = 0;
    #5
    A_t = 0;
    B_t = 1;
    #5
    A_t = 1;
    B_t = 0;
    #5
    A_t = 1;
    B_t = 1;
end

endmodule // tb_ha