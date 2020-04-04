module priority_encoder(d,x,v);


input [7:0] d;
output [2:0] x;
output v;

reg v;
reg [2:0] x;

always @(*) begin
    x = #1 8'h00;
    case (d)
        8'h01: begin
        x = 8'h00;
        v = 1;
        end
        // 1   = 00000001
        8'h02: begin
        x = 8'h01;
        v = 1;
        end
        // 2   = 00000010
        8'h04: begin
        x = 8'h02;
        v = 1;
        end
        // 4   = 00000100
        8'h08: begin
        x = 8'h03;
        v = 1;
        end
        // 8   = 00001000
        8'h10: begin
        x = 8'h04;
        v = 1;
        end
        // 16  = 00010000
        8'h20: begin
        x = 8'h05;
        v = 1;
        end
        // 32  = 00100000
        8'h40: begin
        x = 8'h06;
        v = 1;
        end
        // 64  = 01000000
        8'h80: begin
        x = 8'h07;
        v = 1;
        end
        // 128 = 10000000
        default: v=0;
    endcase
    
end


endmodule // priority