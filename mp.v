`timescale 1ns/1ps
module dynamic_display(
    input clk,
    input nRst,
    input inc,
    input nxt,
    output reg [7:0] seg_dat,
    output reg [3:0] seg_sel
);


reg [3:0] seg = 0;
reg clk1khz = 0;
reg clk10hz = 0;
reg [24:0] counter = 0;
reg [24:0] counter1 = 0;

// 1khz 생성
always@( posedge clk or posedge nRst) begin
    if (nRst == 0) begin
        clk1khz <= 0;
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
        if ( counter == 12500 ) begin
            counter <= 0;
            clk1khz <= ~clk1khz;
        end
    end
end
// 10hz 생성
always@( posedge clk or posedge nRst) begin
    if (nRst == 0) begin
        clk10hz <= 0;
        counter1 <= 0;
    end
    else begin
        counter1 <= counter1 + 1;
        if ( counter1 == 1250000 ) begin
            counter1 <= 0;
            clk10hz <= ~clk10hz;
        end
    end
end

// 생성한 신호에 따라 seg값을 넣습니다.
always@( posedge clk10hz or posedge nRst) begin
   if(nRst == 0) begin
        seg <= 0;
    end
   else begin
       if(seg <4) seg <= seg+1;
       else seg <= 0;
    end
end

// 순서대로 counter가 0,1,2,3 일때 sel가 가리키는곳을 다르게하고 값을 다르게 지정.
always @(seg) begin                         
    case(seg)
        4'b0000 : begin
        seg_dat = 8'b11111110;
        seg_sel = 4'b0111;
        end
        4'b0001 : begin
        seg_dat = 8'b11111110;
        seg_sel = 4'b1011;
        end
        4'b0010 : begin
        seg_dat = 8'b11111110;
        seg_sel = 4'b1101;
        end
        4'b0011 : begin
        seg_dat = 8'b11111110;
        seg_sel = 4'b1110;
        end
        default : #1 seg_dat = 8'b00000000;
    endcase
end             

    


endmodule // dynamic_display