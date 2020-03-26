module full_adder1_testbench;

reg a;
reg b;
reg cin;
wire sum;
wire count;

full_adder1 f1 ( .a(a), .b(b), .cin(cin), .sum(sum), .count(count));
initial 
begin
$dumpfile("dump.vcd"); $dumpvars; 

#5 a=1'b0; b=1'b0; cin=1'b0;
#5 a=1'b0; b=1'b0; cin=1'b1;
#5 a=1'b0; b=1'b1; cin=1'b0;
#5 a=1'b0; b=1'b1; cin=1'b1;
#5 a=1'b1; b=1'b0; cin=1'b0;
#5 a=1'b1; b=1'b0; cin=1'b1;
#5 a=1'b1; b=1'b1; cin=1'b0;
#5 a=1'b1; b=1'b1; cin=1'b1;
end
endmodule