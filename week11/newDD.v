`include "seg.v"
module dynamic_display(
    input clk,
    input nRst,
    input [3:0] curr_val,
    input [3:0] curr_val1,
    input [3:0] curr_val2,
    input [3:0] curr_val3,
    output reg [7:0] seg_dat,
    output reg [3:0] seg_sel
);


reg [3:0] control = 0;
reg clk1khz = 0;
reg clk10hz = 0;
reg [24:0] counter = 0;

wire [7:0] seg_dat0;
wire [7:0] seg_dat1;
wire [7:0] seg_dat2;
wire [7:0] seg_dat3;

// 25mhz 에서 1khz를 만들기위해 구간을 반으로 나눠서 clk1khz를 1 0 1 0 .... 으로 되게 하기 위한 코드입니다.
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
always@( posedge clk or posedge nRst) begin
    if (nRst == 0) begin
        clk10hz <= 0;
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
        if ( counter == 1250000 ) begin
            counter <= 0;
            clk10hz <= ~clk10hz;
        end
    end
end

// 생성한 신호에 따라 seg값을 넣습니다.
always@( posedge clk10hz or posedge nRst) begin
   if(nRst == 0) begin
        control <= 4'b1111;
    end
   else begin
       if(control <4) control <= control+1;
       else control <= 0;
    end
end

bcd_to_7seg seg0( 
    .sin(curr_val),
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

// 순서대로 counter가 0,1,2,3 일때 sel가 가리키는곳을 다르게하고 값을 다르게 지정.
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
    seg_dat = 8'b11111110;
    seg_sel = 4'b1111;
    end
    endcase
end

    


endmodule // dynamic_display