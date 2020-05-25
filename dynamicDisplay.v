module dynamic_display(
    input clk,
    input nRst,
    output reg [7:0] seg_dat,
    output reg [3:0] seg_sel
);


reg [3:0] seg = 0;
reg clk1khz = 0;
reg [24:0] counter = 0;

// 25mhz 에서 1khz를 만들기위해 구간을 반으로 나눠서 clk1khz를 1 0 1 0 .... 으로 되게 하기 위한 코드입니다.
always@( posedge clk or posedge nRst) begin
    if (nRst == 0) begin
        clk1khz <= 0;
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
        if ( counter == 12499 ) begin
            counter <= 0;
            clk1khz <= ~clk1khz;
        end
    end
end

// 생성한 신호에 따라 seg값을 넣습니다.
always@( posedge clk1khz or posedge nRst) begin
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