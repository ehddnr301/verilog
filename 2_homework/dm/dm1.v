module demux(din, sel, dout);

    input din;
    input [2:0] sel;
    output [7:0] dout;

    reg [7:0] dout;
    
    always @(*) begin

    case (sel)
        3'b000:  dout[0] = din;
        3'b001:  dout[1] = din;
        3'b010:  dout[2] = din;
        3'b011:  dout[3] = din;
        3'b100:  dout[4] = din;
        3'b101:  dout[5] = din;
        3'b110:  dout[6] = din;
        3'b111:  dout[7] = din;
        default: dout = 8'hxx;
    endcase
        
    end

endmodule