module priority_encoder(d,x,v);


input [7:0] d;
output [2:0] x;
output v;

wire d;
reg v;
reg [2:0] x;

always @(*) begin
    x = #1 8'h00;
    case (d)
        8'b00000001: begin
        v = 1;
        x = 3'b000;
        end
        8'b00000010: begin
        v = 1;
        x = 3'b001;
        end
        8'b00000100: begin
        v = 1;
        x = 3'b010;
        end
        8'b00001000: begin
        v = 1;
        x = 3'b011;
        end
        8'b00010000: begin
        v = 1;
        x = 3'b100;
        end
        8'b00100000: begin
        v = 1;
        x = 3'b101;
        end
        8'b01000000: begin
        v = 1;
        x = 3'b110;
        end
        8'b10000000: begin
        v = 1;
        x = 3'b111;
        end
        default:begin
        v=0;
        end
    endcase
    
end


endmodule // priority