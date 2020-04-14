module full_adder1_testbench;

reg a;
reg b;
reg cin;
wire sum;
wire cout;

full_adder1 f1 ( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
initial 
begin
$dumpfile("testbench.vcd"); $dumpvars; 
#10;
#10 a=1'b0; b=1'b0; cin=1'b0;
#10 a=1'b0; b=1'b0; cin=1'b1;
#10 a=1'b0; b=1'b1; cin=1'b0;
#10 a=1'b0; b=1'b1; cin=1'b1;
#10 a=1'b1; b=1'b0; cin=1'b0;
#10 a=1'b1; b=1'b0; cin=1'b1;
#10 a=1'b1; b=1'b1; cin=1'b0;
#10 a=1'b1; b=1'b1; cin=1'b1;
#10;
end
endmodule