module segment(
     sin,
     seg
    );
     
     input [3:0] sin;
     output [7:0] seg;
     reg [7:0] seg;

    // segment표시
    always @(*)
    begin
        case (sin) 
        //0
            4'b0000 : #1 seg = 8'b11111100;
        //1
            4'b0001 : #1 seg = 8'b01100000;
        //2
            4'b0010 : #1 seg = 8'b11011010;
        //3
            4'b0011 : #1 seg = 8'b11110010;
        //4
            4'b0100 : #1 seg = 8'b01100110;
        //5
            4'b0101 : #1 seg = 8'b10110110;
        //6
            4'b0110 : #1 seg = 8'b10111110;
        //7
            4'b0111 : #1 seg = 8'b11100000;
        //8
            4'b1000 : #1 seg = 8'b11111110;
        //9
            4'b1001 : #1 seg = 8'b11110110;
            // 끄기
            default : #1 seg = 8'b00000000; 
        endcase
    end
    
endmodule