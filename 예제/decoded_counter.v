module decoded_counter(rst, clk, ctrl);

input rst;
input clk;
output ctrl;

reg [3:0] count_value;

always @(posedge clk) begin
if (rst== 1'b0) begin
    count_value <= (others => '0');
end
else begin
    count_value <= count_value +1;
end

assing ctrl = (count_value == 4'b0111) || (count_value == 4'b1011);
    

endmodule