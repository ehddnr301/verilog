`include "debounce.v"
`include "newDD.v"

module switch_example(
    input clk,
    input nRst,
    input inc,
    input nxt,
    output [7:0] seg_dat,
    output [3:0] seg_sel
);
// 스위치가 open이면 1
// 스위치가 눌리면 0

wire inc_reg, inc_falling;
wire nxt_reg, nxt_falling;
// inc_reg 가 chattering이 제거된 신호.
reg inc_reg2;
reg nxt_reg2;

reg [3:0] curr_val, next_val;
reg [3:0] curr_val1, next_val1;
reg [3:0] curr_val2, next_val2;
reg [3:0] curr_val3, next_val3;

reg [3:0] curr_sel, next_sel;

dynamic_display dd0(
    .clk (clk),
    .nRst (nRst),
    .curr_val(curr_val),
    .curr_val1(curr_val1),
    .curr_val2(curr_val2),
    .curr_val3(curr_val3),
    .seg_dat(seg_dat),
    .seg_sel(seg_sel)
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
curr_sel <= #1 4'h0;
inc_reg2 <= #1 1'b0;
nxt_reg2 <= #1 1'b0;
end 
else begin
curr_val <= #1 next_val;
curr_val1 <= #1 next_val1;
curr_val2 <= #1 next_val2;
curr_val3 <= #1 next_val3;
curr_sel <= #1 next_sel;
inc_reg2 <= #1 inc_reg;
nxt_reg2 <= #1 nxt_reg;
// 리셋이 아니면 reg신호를 reg2에 넣음. debounce된 신호를 1사이클 동안 d플립플롭을 거치게만드는효과.
end

end



// input
always @(*) begin

if (inc_falling) begin

if (curr_sel == 1) begin
next_val = curr_val + 1;
if (next_val >= 4'hA) next_val = 4'h0;
end

if (curr_sel == 2) begin
next_val1 = curr_val1 + 1;
if (next_val1 >= 4'hA) next_val1 = 4'h0;
end

if (curr_sel == 3) begin
next_val2 = curr_val2 + 1;
if (next_val2 >= 4'hA) next_val2 = 4'h0;
end

if (curr_sel == 4) begin
next_val3 = curr_val3 + 1;
if (next_val3 >= 4'hA) next_val3 = 4'h0;
end

end

else begin
next_val = curr_val;
next_val1 = curr_val1;
next_val2 = curr_val2;
next_val3 = curr_val3;
end

end


// next
always @(*) begin

if (nxt_falling) begin
next_sel = curr_sel + 1;
if (next_sel >= 4'h5)
next_sel = 4'h0;
end

else next_sel = curr_sel;

end

endmodule // switch_example