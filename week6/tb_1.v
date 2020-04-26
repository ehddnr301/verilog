module tb_BCD_a_FND;

reg [3:0] tb_a;
reg [3:0] tb_b;

wire [7:0] tb_seg1;
wire [7:0] tb_seg0;

BCD_a_FND baf (
    .a(tb_a),
    .b(tb_b),
    .seg1(tb_seg1),
    .seg0(tb_seg0)
);

integer i;
integer j;

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
#10;

// a,b 모두 0 으로 시작.
tb_a = 4'b0;
tb_b = 4'b0;

// 모든 입력을 테스트 하기위한 for문
for (i=0;i<15;i=i+1) begin
    tb_b = 4'b0;
        for (j=0;j<15;j=j+1) begin
            #5 tb_b=tb_b+1;
        end
    tb_a=tb_a+1;

    #20;
end

$finish();

end


endmodule