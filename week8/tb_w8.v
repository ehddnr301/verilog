`timescale 1ns/1ps
module tb_one;

reg clk;
reg nRst;

wire [7:0] seg_dat;



one o0 (
    .clk(clk),
    .nRst(nRst),
    .seg_dat(seg_dat)
);

initial
clk=1'b0;
always
#1 clk=~clk;

initial
     begin
        nRst=1;
        #1 nRst=0;
        #1 nRst=1;
            
        #125000000 $finish;
     end       
initial
      begin
      $dumpfile("testbench.vcd"); $dumpvars; 
      end
endmodule