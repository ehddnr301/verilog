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

integer i;
integer j;

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 
#10;

tb_a = 4'b0;
tb_b = 4'b0;

for (i=0;i<15;i=i+1) begin
    tb_b = 4'b0;
    tb_a=tb_a+1;
        for (j=0;j<15;j=j+1) begin
            #5 tb_b=tb_b+1;
        end

    #20;
end

$finish();


// #30;

// tb_a = 4'b0001;
// tb_b = 4'b0001;
// tb_a = 4'b1000;
// tb_b = 4'b0111;

// #30;

// tb_a = 4'b0100;
// tb_b = 4'b0100;
// tb_a = 4'b1000;
// tb_b = 4'b0110;

// #30;

// tb_a = 4'b1000;
// tb_b = 4'b1111;
// tb_a = 4'b1000;
// tb_b = 4'b0101;

// #30;

// tb_a = 4'b1000;
// tb_b = 4'b1000;
// tb_a = 4'b1000;
// tb_b = 4'b0011;

// #30;

// tb_a = 4'b1111;
// tb_b = 4'b1000;
// tb_a = 4'b1000;
// tb_b = 4'b0001;

// #30;
  
end


endmodule // 