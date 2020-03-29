module full_adder(a,b,cin,count,sum);

input a,b,cin;
output reg count,sum;

wire [2:0] a_b_cin;
  assign #1 a_b_cin = {a,b,cin};

  always @* begin
    case (a_b_cin)
        3'b000: begin
        count=0;
        sum=0;
        end
        3'b001: begin
        count=0;
        sum=1;
        end
        3'b010: begin
        count=0;
        sum=1;
        end
        3'b011: begin
        count=1;
        sum=0;
        end
        3'b100: begin
        count=0;
        sum=1;
        end
        3'b101: begin
        count=1;
        sum=0;
        end
        3'b110: begin
        count=1;
        sum=0;
        end
        3'b111: begin
        count=1;
        sum=1;
        end
    endcase
end

endmodule // full_adder2