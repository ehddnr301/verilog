`include "seg.v"
module dynamic_display(
    input clk,
    input nRst,
    input [3:0] curr_val0,
    input [3:0] curr_val1,
    input [3:0] curr_val2,
    input [3:0] curr_val3,
    input [2:0] currModeControl,
    output reg [7:0] seg_dat,
    output reg [3:0] seg_sel
);


reg [3:0] control = 0;
reg clk10hz = 0;
reg [24:0] counter = 0;

wire [7:0] seg_dat0;
wire [7:0] seg_dat1;
wire [7:0] seg_dat2;
wire [7:0] seg_dat3;


// 0.1초 간격으로 깜빡이는 clk 50 duty
always@( posedge clk or posedge nRst) begin
    if (nRst == 0) begin
        if(currModeControl <= 3) begin
        clk10hz <= 0;
        counter <= 0;
        end
    end
        else begin
            counter <= counter + 1;
            if ( counter == 156250 ) begin
                counter <= 0;
                clk10hz <= ~clk10hz;
            end
        end
    end

// 생성한 신호에 따라 display될 위치를 조정합니다.
always@( posedge clk10hz or posedge nRst) begin
    if(nRst == 0) begin
        if(currModeControl <= 3) begin
        control <= 4'b1111;
        end
    end
    else begin
        if(control <4) control <= control+1;
        else control <= 0;
        end
    end

// segment신호로 바꿔줍니다.
bcd_to_7seg seg0( 
    .sin(curr_val0),
    .seg(seg_dat0)
);
bcd_to_7seg seg1( 
    .sin(curr_val1),
    .seg(seg_dat1)
);
bcd_to_7seg seg2( 
    .sin(curr_val2),
    .seg(seg_dat2)
);
bcd_to_7seg seg3( 
    .sin(curr_val3),
    .seg(seg_dat3)
);

// 순서대로 control이 0,1,2,3 일때 sel가 가리키는곳을 다르게하고 값을 다르게 지정합니다.
always @(control) begin
    case(control)
    4'b0000 : begin
    seg_dat = seg_dat0;
    seg_sel = 4'b0111;
    end
    4'b0001 : begin
    seg_dat = seg_dat1;
    seg_sel = 4'b1011;
    end
    4'b0010 : begin
    seg_dat = seg_dat2;
    seg_sel = 4'b1101;
    end
    4'b0011 : begin
    seg_dat = seg_dat3;
    seg_sel = 4'b1110;
    end
    default : begin
    seg_dat = 8'b10000000;
    seg_sel = 4'b1111;
    end
    endcase
end
    


endmodule // dynamic_display