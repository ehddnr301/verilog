`timescale 1ns/1ps
module one(
    input clk,
    input nRst,
    output reg [7:0] seg_dat,
    output reg seg_sel =0
);

reg [24:0] count;
reg [3:0] counter;

// counter 코드 입니다.
always @(posedge clk or posedge nRst) begin
    if(nRst == 0)begin
        count <= 25'd0;
        counter <= 4'b0;
    end
    // 25mhz 에서 1hz를 만들어 내기 위한 코드입니다.
    else if (count == 25'd25000000)begin
        count<= 25'd0;
        // 9다음 10이 아닌 다시 0을 표시하기 위한 코드입니다.
        if(counter <9) counter <= counter + 1;
        else counter <= 0;
    end

    // 1hz를 만들어 내기위해 count를 계속 증가시킵니다.
    else begin
        count <= count+1;
    end
end

// segment 코드입니다.
always @(counter) begin
    case (counter)
        4'b0000 : #1 seg_dat = 8'b11111100;
        4'b0001 : #1 seg_dat = 8'b01100000;
        4'b0010 : #1 seg_dat = 8'b11011010;
        4'b0011 : #1 seg_dat = 8'b11110010;
        4'b0100 : #1 seg_dat = 8'b01100110;
        4'b0101 : #1 seg_dat = 8'b10110110;
        4'b0110 : #1 seg_dat = 8'b10111110;
        4'b0111 : #1 seg_dat = 8'b11100000;
        4'b1000 : #1 seg_dat = 8'b11111110;
        4'b1001 : #1 seg_dat = 8'b11110110; 
        default : #1 seg_dat = 8'b00000000;
    endcase
end

endmodule