module tb_switch_example;
reg clk;
reg n_reset;
reg tb_button_in;
wire [7:0] tb_seg_dat;
wire tb_seg_sel;
switch_example DUT (
.clk(clk),
.nRst(n_reset),
.inc (tb_button_in),
.seg_dat(tb_seg_dat),
.seg_sel(tb_seg_sel)
);
// every 40 nanoseconds invert the clock
always
#20 clk = ~clk;
initial begin
clk = 1'b0;
n_reset = 1'b0;
#200 n_reset = 1'b1;
tb_button_in = 1'b0;
#240000 tb_button_in = 1'b1;
#400 tb_button_in = 1'b0;
#800 tb_button_in = 1'b1;
#800 tb_button_in = 1’b0;
#800 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1’b1;
#80000 tb_button_in = 1'b0;
#80000 tb_button_in = 1'b1;
#80000 tb_button_in = 1'b0; $finish;
end
endmodule