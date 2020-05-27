`include "debounce.v"
`include "newDD.v"

module switch_example(
    input clk,
    input nRst,
    input inc,
    input nxt,
    output wire [7:0] seg_dat,
    output wire [3:0] seg_sel
);
// 스위치가 open이면 1
// 스위치가 눌리면 0

wire inc_reg, inc_falling;
wire nxt_reg, nxt_falling;
// inc_reg 가 chattering이 제거된 신호.
reg [3:0] curr_val0, next_val0;
reg [3:0] curr_val1, next_val1;
reg [3:0] curr_val2, next_val2;
reg [3:0] curr_val3, next_val3;

reg inc_reg2;
reg nxt_reg2;

reg [2:0] currModeControl = 3'b000;
reg [2:0] nextModeControl = 3'b000;

// bcd_to_7seg seg0( 
//     .sin(curr_val0),
//     .seg(seg_dat)
// );
dynamic_display dd0(
    .clk (clk),
    .nRst (nRst),
    .curr_val0(curr_val0),
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

assign inc_falling = ~inc_reg && inc_reg2;
assign nxt_falling = ~nxt_reg && nxt_reg2;
// 이전신호가 1이고 현재신호가 0이면 ~을해서 1이되니까 and를 취하면 이게 falling이 발생했다라는 의미


always @(posedge clk) begin

if (~nRst) begin
curr_val0 <= #1 4'h0;
curr_val1 <= #1 4'h0;
curr_val2 <= #1 4'h0;
curr_val3 <= #1 4'h0;
inc_reg2 <= #1 1'b0;
nxt_reg2 <= #1 1'b0;
currModeControl <= #1 3'b000;
end 
else begin
curr_val0 <= #1 next_val0;
curr_val1 <= #1 next_val1;
curr_val2 <= #1 next_val2;
curr_val3 <= #1 next_val3;
currModeControl <= #1 nextModeControl;
inc_reg2 <= #1 inc_reg;
nxt_reg2 <= #1 nxt_reg;
// 리셋이 아니면 reg신호를 reg2에 넣음. debounce된 신호를 1사이클 동안 d플립플롭을 거치게만드는효과.
end

end


always @(*) begin

// inc control
if (inc_falling) begin
// incControl inside

if(currModeControl == 3'b000)begin
next_val0 = curr_val0 + 1;
next_val1 = curr_val1;
next_val2 = curr_val2;
next_val3 = curr_val3;
if (next_val0 >= 4'hA) next_val0 = 4'h0;
end

else if(currModeControl == 3'b001)begin
next_val1 = curr_val1 + 1;
next_val0 = curr_val0;
next_val2 = curr_val2;
next_val3 = curr_val3;
if (next_val1 >= 4'hA) next_val1 = 4'h0;
end

else if(currModeControl == 3'b010)begin
next_val2 = curr_val2 + 1;
next_val0 = curr_val0;
next_val1 = curr_val1;
next_val3 = curr_val3;
if (next_val2 >= 4'hA) next_val2 = 4'h0;
end

else if(currModeControl == 3'b011)begin
next_val3 = curr_val3 + 1;
next_val0 = curr_val0;
next_val1 = curr_val1;
next_val2 = curr_val2;
if (next_val3 >= 4'hA) next_val3 = 4'h0;
end
// TODO : a.v 추가해놓은거 보면 <= 이렇게 쓰면 값에 도달할때 까지 계속 하는건가.

// incControl inside
end

else begin
next_val0 = curr_val0;
next_val1 = curr_val1;
next_val2 = curr_val2;
next_val3 = curr_val3;
end

end

always @(*) begin
    
    // next control
    if (nxt_falling) begin
    // nxtControl inside

    nextModeControl = currModeControl + 1;
    if(nextModeControl >= 3'b100) nextModeControl = 3'b000;

    // nxtControl inside
    end
    else begin
    nextModeControl = currModeControl;
    end

end

endmodule // switch_example