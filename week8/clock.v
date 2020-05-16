
module counter(
input wire clk,
input wire reset,
output reg clk1hz,
output reg [3:0] Q
);

reg [24:0] count;

initial begin
clk1hz = 0;
count = 0;
Q = 0;
end

always @(posedge clk or posedge reset) begin

if( clk || reset) begin

if(reset == 0)begin
clk1hz <= 0;
count <= 0;
end
else count <= count+1;

if(count == 12500000) begin
count <= 0;
clk1hz <= ~clk1hz;
end

end

end

always@(posedge clk1hz)begin
if(clk1hz) begin

if (reset == 0) Q <= 4'b0000;
else Q <= Q + 1;

end
end

endmodule