`include "seg.v"
`include "debounce.v"

module switch_example(
    input clk,
    input nRst,
    input inc,
    input nxt,
    output [7:0] seg_dat,
    output wire [3:0] seg_sel
);
// 스위치가 open이면 1
// 스위치가 눌리면 0

wire inc_reg, inc_falling;
wire nxt_reg, nxt_falling;

wire [7:0] seg_dat_wire;
wire [7:0] seg_dat_wire1;
wire [7:0] seg_dat_wire2;
wire [7:0] seg_dat_wire3;
// inc_reg 가 chattering이 제거된 신호.
reg [3:0] curr_val, next_val;
reg [3:0] curr_val1, next_val1;
reg [3:0] curr_val2, next_val2;
reg [3:0] curr_val3, next_val3;
reg inc_reg2;
reg nxt_reg2;

bcd_to_7seg seg0( 
    .sin(curr_val),
    .seg(seg_dat_wire)
);
bcd_to_7seg seg1( 
    .sin(curr_val1),
    .seg(seg_dat_wire1)
);
bcd_to_7seg seg2( 
    .sin(curr_val2),
    .seg(seg_dat_wire2)
);
bcd_to_7seg seg3( 
    .sin(curr_val3),
    .seg(seg_dat_wire3)
);
debounce db0( 
    .clk (clk),
    .n_reset (nRst),
    .button_in (inc),
    .DB_out (inc_reg)
);
debounce db1( 
    .clk (clk),
    .n_reset (nRst),
    .button_in (nxt),
    .DB_out (nxt_reg)
);

assign seg_sel = 4'b0000;
assign inc_falling = ~inc_reg && inc_reg2;
assign nxt_falling = ~nxt_reg && nxt_reg2;
// 이전신호가 1이고 현재신호가 0이면 ~을해서 1이되니까 and를 취하면 이게 falling이 발생했다라는 의미


always @(posedge clk) begin

if (~nRst) begin
curr_val <= #1 4'h0;
curr_val1 <= #1 4'h0;
curr_val2 <= #1 4'h0;
curr_val3 <= #1 4'h0;
inc_reg2 <= #1 1'b0;
end 
else begin
curr_val <= #1 next_val;
curr_val1 <= #1 next_val1;
curr_val2 <= #1 next_val2;
curr_val3 <= #1 next_val3;
inc_reg2 <= #1 inc_reg;
// 리셋이 아니면 reg신호를 reg2에 넣음. debounce된 신호를 1사이클 동안 d플립플롭을 거치게만드는효과.
end

end


always @(*) begin

if (inc_falling) begin

next_val = curr_val + 1;
if (next_val >= 4'hA)
next_val = 4'h0;
end
else next_val = curr_val;

end

endmodule // switch_example