`timescale 1ns/1ps
module dynamic_display(
    input clk,
    input nRst,
    output reg [7:0] seg_dat,
    output reg [3:0] seg_sel
);

reg [24:0] count;
reg [3:0] counter;

// 25Mhz 에서 1khz 생성합니다.
always @(posedge clk or posedge nRst) begin
    if(nRst == 0)begin
        count <= 25'd0;
        counter <= 4'b0;
    end
    else if (count == 25'd25000)begin
        count<= 25'd0;
        // counter를 0 1 2 3 0 1 2 3 순으로 반복시킵니다.
        if(counter <4) counter <= counter + 1;
        else counter <= 0;
    end
    else begin
        count <= count+1;
    end
end

// 순서대로 counter가 0,1,2,3 일때 sel가 가리키는곳을 다르게하고 값을 다르게 지정.
always @(counter) begin
    case(counter)
    4'b0000 : begin
    seg_dat = 8'b11111110;
    seg_sel = 4'b0111;
    end
    4'b0001 : begin
    seg_dat = 8'b10111010;
    seg_sel = 4'b1011;
    end
    4'b0010 : begin
    seg_dat = 8'b10111010;
    seg_sel = 4'b1101;
    end
    4'b0011 : begin
    seg_dat = 8'b01100010;
    seg_sel = 4'b1110;
    end
    default : begin
    seg_dat = 8'b00000000;
    seg_sel = 4'b1111;
    end
    endcase
end

    


endmodule // dynamic_display