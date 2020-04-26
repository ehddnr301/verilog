
module BCD_FND(a,b,seg1,seg0);


input [3:0] a;
input [3:0] b;
output reg [7:0] seg1;
output reg [7:0] seg0;

reg [3:0] r0;
reg [3:0] r1;

always @(*) begin
    if (a > 9 || b >9)begin
        r1 = 4'bx;
        r0 = 4'bx;
    end
    else begin
       {r1, r0} = a + b;

       if(r0 > 9)begin
        r1 = r1 + 1;
        r0 = r0 + 6;
       end

       else begin
        r1 = r1;
        r0 = r0;
       end

    end

    case (r1) 
        4'b0000 : #1 seg1 = 8'b11111100;
        4'b0001 : #1 seg1 = 8'b01100000;
        4'b0010 : #1 seg1 = 8'b11011010;
        4'b0011 : #1 seg1 = 8'b11110010;
        4'b0100 : #1 seg1 = 8'b01100110;
        4'b0101 : #1 seg1 = 8'b10110110;
        4'b0110 : #1 seg1 = 8'b10111110;
        4'b0111 : #1 seg1 = 8'b11100000;
        4'b1000 : #1 seg1 = 8'b11111110;
        4'b1001 : #1 seg1 = 8'b11110110;
        default : #1 seg1 = 8'b00000000; 
    endcase

    case (r0) 
        4'b0000 : #1 seg0 = 8'b11111100;
        4'b0001 : #1 seg0 = 8'b01100000;
        4'b0010 : #1 seg0 = 8'b11011010;
        4'b0011 : #1 seg0 = 8'b11110010;
        4'b0100 : #1 seg0 = 8'b01100110;
        4'b0101 : #1 seg0 = 8'b10110110;
        4'b0110 : #1 seg0 = 8'b10111110;
        4'b0111 : #1 seg0 = 8'b11100000;
        4'b1000 : #1 seg0 = 8'b11111110;
        4'b1001 : #1 seg0 = 8'b11110110;
        default : #1 seg0 = 8'b00000000; 
    endcase
end



endmodule 