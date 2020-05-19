module one_digit_7seg(clk, nRst, seg, DIG);
input clk, nRst;       
output reg [7:0] seg;
output reg [3:0] DIG;
reg [3:0] x = 0;
reg clk_1khz = 0;
reg [24:0] counter = 0;


always@(posedge nRst or posedge clk)   
begin
    if (nRst == 0)
        begin
            clk_1khz <= 0;
            counter <= 0;
        end
    else
        begin
            counter <= counter + 1;
            if ( counter == 12499 )
                begin
                    counter <= 0;
                    clk_1khz <= ~clk_1khz;
                end
        end
end

always@(posedge nRst or posedge clk_1khz)
begin
   if(nRst == 0)
        begin
        x <= 0;
        end
   else if (x == 4)
        begin
        x <= 0;
        end
   else
        begin
        x <= x+1;
        end
   
end
always @(*)                         
    begin
        case(x)
            4'b0000 :
            begin
             seg = 8'b00000110;
             DIG = 4'b0111;
            end
            4'b0001 :
            begin
             seg = 8'b01111111;
             DIG = 4'b1011;
            end 
            4'b0000 :
            begin
             seg = 8'b00000110;
             DIG = 4'b1101;
            end
            4'b0001 :
            begin
             seg = 8'b01111111;
             DIG = 4'b1110;
            end 
            default : 
            begin
             seg = 8'b00000000;
             DIG = 4'b1111;
            end
        endcase
    end             
endmodule