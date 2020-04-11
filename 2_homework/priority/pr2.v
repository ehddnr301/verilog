module priority_encoder(d,xin,v);


input [7:0] d;
output [2:0] xin;
output v;

reg v;
reg [2:0] xin;

always @(*) begin
    xin = #1 3'bX;
    v=1;
    casex (d)
        8'bxxxxxxx1: begin
        xin = 3'b000;
        v = 1;
        end
        8'bxxxxxx10: begin
        xin = 3'b001;
        v = 1;
        end
        8'bxxxxx100: begin
        xin = 3'b010;
        v = 1;
        end
        8'bxxxx1000: begin
        xin = 3'b011;
        v = 1;
        end
        8'bxxx10000: begin
        xin = 3'b100;
        v = 1;
        end
        8'bxx100000: begin
        xin = 3'b101;
        v = 1;
        end
        8'bx1000000: begin
        xin = 3'b110;
        v = 1;
        end
        8'b10000000: begin
        xin = 3'b111;
        v = 1;
        end
        default: begin
        xin =3'bX;
        v=0; 
        end
    endcase
    
end

endmodule