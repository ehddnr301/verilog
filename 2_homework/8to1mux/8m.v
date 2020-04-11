module mux_eight(
    I0,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    s,
    result
);

input I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] s;
output result;

wire I0, I1, I2, I3, I4, I5, I6, I7;
wire [2:0] s;
reg result;

always @(*) begin
case (s)
  3'b000 : result = I0; 
  3'b001 : result = I1; 
  3'b010 : result = I2; 
  3'b011 : result = I3; 
  3'b100 : result = I4; 
  3'b101 : result = I5; 
  3'b110 : result = I6; 
  3'b111 : result = I7; 
default: result= 0;
endcase
    
end

endmodule // 