module segment(
    input wire clock,
    output reg [12:0] seg
);

always @(posedge clock) begin
    seg[0] = 1;
    seg[1] = 0;
    seg[2] = 1;
    seg[3] = 1;
    seg[4] = 1;
    seg[5] = 1;
    seg[6] = 1;
    seg[7] = 0;

    seg[8] = 1;
    seg[9] = 0;
    seg[10] = 0;
    seg[11] = 0;
end


endmodule