module one_digit_7seg(
    input clk,
    input nRst,
    output [7:0] seg_dat,
    output [3:0] seg_sel
);

always @(posedge CLK) begin
    if(nRst == 1'b0) begin
        seg_dat <= #1 8'h0;
    end
    else begin
        seg_dat <= #1 seg_dat + 1;
    end
end

    // segment표시
    always @(*)
    begin
        case (sin) 
            4'b0000 : #1 seg = 8'b11111100;
            4'b0001 : #1 seg = 8'b01100000;
            4'b0010 : #1 seg = 8'b11011010;
            4'b0011 : #1 seg = 8'b11110010;
            4'b0100 : #1 seg = 8'b01100110;
            4'b0101 : #1 seg = 8'b10110110;
            4'b0110 : #1 seg = 8'b10111110;
            4'b0111 : #1 seg = 8'b11100000;
            4'b1000 : #1 seg = 8'b11111110;
            4'b1001 : #1 seg = 8'b11110110;
            default : #1 seg = 8'b00000000; 
        endcase
    end
    


endmodule // one_digit_7seg