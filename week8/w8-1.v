module one(
    input clk,
    input nRst,
    output reg [7:0] seg_dat,
    output seg_sel = 0
    );

reg [3:0] seg = 0;
reg clk1hz = 0;
reg [24:0] counter = 0;

// seg_sel을 두번째칸에 연결하고 값은 0으로 주어서 두번째 칸만 불을 켭니다.

// 25mhz 에서 1hz를 만들기위해 25mhz를 반으로 나눠서 clk1hz를 1 0 1 0 .... 으로 되게 하기 위한 코드입니다.
always@(posedge nRst or posedge clk)   
begin
    if (nRst == 0)
        begin
            clk1hz <= 0;
            counter <= 0;
        end
    else
        begin
            counter <= counter + 1;
            if ( counter == 12499999 )
                begin
                    counter <= 0;
                    clk1hz <= ~clk1hz;
                end
        end
end

// 생성한 신호에 따라 seg값을 넣습니다.
always@(posedge nRst or posedge clk1hz)
begin
   if(nRst == 0)
        begin
        seg <= 0;
        end
   else if (seg == 9)
        begin
        seg <= 0;
        end
   else
        begin
        seg <= seg+1;
        end
   
end
always @(seg)                         // case문으로 출력 합니다.
    begin
        case(seg)
            4'b0000 : seg_dat = 8'b00111111;
            4'b0001 : seg_dat = 8'b00000110;
            4'b0010 : seg_dat = 8'b01011011;    
            4'b0011 : seg_dat = 8'b01001111;
            4'b0100 : seg_dat = 8'b01100110;
            4'b0101 : seg_dat = 8'b01101101;
            4'b0110 : seg_dat = 8'b01111101;
            4'b0111 : seg_dat = 8'b00000111;
            4'b1000 : seg_dat = 8'b01111111;
            4'b1001 : seg_dat = 8'b01100111;
            default : seg_dat = 8'b00000000;
        endcase
    end             
endmodule