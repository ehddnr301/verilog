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
        8'b 1XXXXXXX: begin
        xin = 3'b111;
        v = 1;
        end
        8'b 01XXXXXX: begin
        xin = 3'b110;
        v = 1;
        end
        8'b 001XXXXX: begin
        xin = 3'b101;
        v = 1;
        end
        8'b 0001XXXX: begin
        xin = 3'b100;
        v = 1;
        end
        8'b 00001XXX: begin
        xin = 3'b011;
        v = 1;
        end
        8'b 000001XX: begin
        xin = 3'b010;
        v = 1;
        end
        8'b 0000001X: begin
        xin = 3'b001;
        v = 1;
        end
        8'b 00000001: begin
        xin = 3'b000;
        v = 1;
        end
        default: begin
        xin =3'bX;
        v=0; 
        end
    endcase
    
end

endmodule