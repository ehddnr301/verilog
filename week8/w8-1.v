`timescale 1ns/1ps
module one(
    input clk,
    input nRst,
    output reg [7:0] seg_dat,
    output reg seg_sel = 0
    );

reg [3:0] seg = 0;
reg clk1hz = 0;
reg [24:0] counter = 0;

// seg_sel을 두번째칸에 연결하고 값은 0으로 주어서 두번째 칸만 불을 켭니다.

// 25mhz 에서 1hz를 만들기위해 구간을 반으로 나눠서 clk1hz를 1 0 1 0 .... 으로 되게 하기 위한 코드입니다.
always@(posedge nRst or posedge clk) begin
    if (nRst == 0) begin
        clk1hz <= 0;
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
        if ( counter == 12499999 )
            begin
                counter <= 0;
                clk1hz <= ~clk1hz;
            end
    end
end

// 생성한 신호에 따라 seg값을 넣습니다.
always@(posedge nRst or posedge clk1hz) begin
   if(nRst == 0)begin
        seg <= 0;
    end
   else begin
       if(seg <9) seg <= seg+1;
       else seg <= 0;
    end
end

// case문으로 출력 합니다.
always @(seg) begin                         
    case(seg)
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
endmodule // one