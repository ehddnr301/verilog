module comparator(
    a,
    b,
    aGreaterB,
    aEqualB,
    aLessB,
);

parameter WIDTH = 8;

input [WIDTH - 1:0] a, b;
output reg aGreaterB, aEqualB, aLessB;

always @(*) begin
  
  if(a > b) begin
    aGreaterB = 1'b1;
    aEqualB = 1'b0;
    aLessB = 1'b0;
  end else if (a == b) begin
    aGreaterB = 1'b0;
    aEqualB = 1'b1;
    aLessB = 1'b0;
  end else if (a < b) begin
    aGreaterB = 1'b0;
    aEqualB = 1'b0;
    aLessB = 1'b1;
  end else begin
    aGreaterB = 1'b0;
    aEqualB = 1'b0;
    aLessB = 1'b0;
  end

end

endmodule // comparator