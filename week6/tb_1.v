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

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 

tb_a = 4'b0;
tb_b = 4'b0;

#20;

tb_a = 4'b0001;
tb_b = 4'b0001;

#20;

tb_a = 4'b0100;
tb_b = 4'b0100;

#20;

tb_a = 4'b1000;
tb_b = 4'b1111;

#20;

tb_a = 4'b1000;
tb_b = 4'b1000;

#20;

tb_a = 4'b1111;
tb_b = 4'b1000;

  
end


endmodule // 