module tb_BCD_a_FND;

reg [3:0] a;
reg [3:0] b;

wire [7:0] seg1;
wire [7:0] seg0;

BCD_FND tt (
    .a(a),
    .b(b),
    .seg1(seg1),
    .seg0(seg0)
);

integer i;
integer j;

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 

a = 4'b0;
b = 4'b0;

for (i=0;i<16;i=i+1) begin
    b = 4'b0;
        for (j=0;j<16;j=j+1) begin
            #2 b=b+1;
        end
    a=a+1;
    #10;
end

$finish();

end


endmodule