module switch_example(
    input clk,
    input nRst,
    input inc,
    output [7:0] seg_dat,
    output seg_sel,
);

wire inc_reg, inc_falling;
reg [3:0] curr_val, next_val;
reg inc_reg2;

bcd_to_7seg seg0( 
    .x(curr_val),
    .seg(seg_dat)
);
debounce db0( 
    .clk (clk),
    .n_reset (nRst),
    .button_in (inc),
    .DB_out (inc_reg)
);

assign seg_sel = 1'b0;
assign inc_falling = ~inc_reg && inc_reg2;

always @(posedge clk) begin

if (~nRst) begin
curr_val <= #1 4'h0;
inc_reg2 <= #1 1'b0;
end 
else begin
curr_val <= #1 next_val;
inc_reg2 <= #1 inc_reg;
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