module debounce(
    input clk, n_reset, button_in,
    output reg DB_out
);

// internal constants
parameter N = 11;

// timing regs
reg [N-1:0] q_reg;
reg [N-1:0] q_next;

// input flip-flop
reg DFF1, Dff2

// control flags
wire q_add;
wire q_reset;

// continous assignment for counter control
// xor input flip flops to look for level change to reset counter
assign q_reset = (DFF1^DFF2);

// add to counter when q_reg msb is equl to 0
assign q_add = ~(q_reg[N-1]);

// combinational logic to manage q_next
always @(*) begin
    case({q_reset, q_add})
    2'b00: q_next = q_reg;
    2'b01: q_next = q_reg +1;
    default: q_next = { N{1'b0}};
    endcase
end

// Flip flop inputs and q_reg update
always @(posedge clk) begin
    if(n_reset == 1'b0) begin
        DFF1 <= 1'b0;
        DFF2 <= 1'b0;
        q_reg <= { N{1'b0}};
    end
    else begin
        DFF1 <= button_in;
        DFF2 <= DFF1;
        q_reg <= q_next;
    end
end

// counter control
always @(posedge clk) begin
    if(q_reg[N-1] == 1'b1)
        DB_out <= DFF2;
    else
        DB_out <= DB_out;
end



endmodule // debounce