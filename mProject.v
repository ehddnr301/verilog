`include "seg.v"
`include "debounce.v"

module mProject(
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
wire next_reg, next_falling;
// inc_reg 가 chattering이 제거된 신호.
reg [3:0] curr_val, next_val;
reg [3:0] curr_val1, next_val1;
reg [3:0] curr_val2, next_val2;
reg [3:0] curr_val3, next_val3;

reg [3:0] curr_nxt, next_nxt;
reg inc_reg2;
reg next_reg2;

wire [7:0] seg_dat_wire;
wire [7:0] seg_dat_wire1;
wire [7:0] seg_dat_wire2;
wire [7:0] seg_dat_wire3;

reg [1:0] mode;


bcd_to_7seg seg0( 
    .sin(curr_val),
    .seg(seg_dat_wire)
);
bcd_to_7seg seg0( 
    .sin(curr_val1),
    .seg(seg_dat_wire1)
);
bcd_to_7seg seg0( 
    .sin(curr_val2),
    .seg(seg_dat_wire2)
);
bcd_to_7seg seg0( 
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
    .DB_out (next_reg)
);

assign seg_sel = 4'b0000;
assign inc_falling = ~inc_reg && inc_reg2;
assign next_falling = ~next_reg && next_reg2;
// 이전신호가 1이고 현재신호가 0이면 ~을해서 1이되니까 and를 취하면 이게 falling이 발생했다라는 의미

// inc button
always @(posedge clk) begin

if (~nRst) begin
curr_val <= #1 4'h0;
inc_reg2 <= #1 1'b0;
curr_nxt <= #1 4'b1111;
next_reg2 <= #1 1'b0;
end 
else begin
curr_val <= #1 next_val;
curr_nxt <= #1 next_nxt;
inc_reg2 <= #1 inc_reg;
next_reg2 <= #1 next_reg;
// 리셋이 아니면 reg신호를 reg2에 넣음. debounce된 신호를 1사이클 동안 d플립플롭을 거치게만드는효과.
end

end



// segment
always @(*) begin

if (inc_falling) begin

if(curr_nxt == 1) begin
next_val = curr_val + 1;
if (next_val >= 4'hA)
next_val = 4'h0;
end
else next_val = curr_val;
end

if(curr_nxt == 2) begin
next_val1 = curr_val1 + 1;
if (next_val1 >= 4'hA)
next_val1 = 4'h0;
end
else next_val1 = curr_val1;
end

if(curr_next == 3) begin
next_val2 = curr_val2 + 1;
if (next_val2 >= 4'hA)
next_val2 = 4'h0;
end
else next_val2 = curr_val2;
end


if(curr_nxt == 4) begin
next_val3 = curr_val3 + 1;
if (next_val3 >= 4'hA)
next_val3 = 4'h0;
end
else next_val3 = curr_val3;
end

end

// sel
always @(*) begin

if (next_falling) begin

next_nxt = curr_nxt + 1;
if (next_nxt >= 4'h5)
    next_nxt = 4'h0;
end
else next_nxt = curr_nxt;
end

endmodule // mProject