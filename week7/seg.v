module segment(
    input wire clock,
    output reg [11:0] in
);

assign 문으로 해보자 아마 테스트밴치가 여기에 포함이 안되서
값이 안바뀌어서 그런게 아닐까 ?

always @(posedge clock) begin
    in[0] = 1;
    in[1] = 0;
    in[2] = 1;
    in[3] = 1;
    in[4] = 1;
    in[5] = 1;
    in[6] = 1;
    in[7] = 0;

    in[8] = 1;
    in[9] = 0;
    in[10] = 0;
    in[11] = 0;
end


endmodule