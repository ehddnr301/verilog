`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 17:46:59
// Design Name: 
// Module Name: tb_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mux();

reg [2:0] s_t;
 reg [7:0] i0_t;
 reg [7:0] i1_t;
 reg [7:0] i2_t;
 reg [7:0] i3_t;
 reg [7:0] i4_t;
 reg [7:0] i5_t;
 reg [7:0] i6_t;
 reg [7:0] i7_t;

 wire [7:0] y_t;

 integer i;

mux m0 (
  .y(y_t), 
  .s(s_t), 
  .i0(i0_t), 
  .i1(i1_t), 
  .i2(i2_t), 
  .i3(i3_t), 
  .i4(i4_t), 
  .i5(i5_t), 
  .i6(i6_t), 
  .i7(i7_t)
 );


 initial begin
 $dumpfile("testbench.vcd"); $dumpvars; 
 


  s_t = 0;
  i0_t = 0;
  i1_t = 0;
  i2_t = 0;
  i3_t = 0;
  i4_t = 0;
  i5_t = 0;
  i6_t = 0;
  i7_t = 0;

  #100

  s_t = 8'd0;
  i0_t = 8'd0;
  i1_t = 8'd1;
  i2_t = 8'd2;
  i3_t = 8'd3;
  i4_t = 8'd4;
  i5_t = 8'd5;
  i6_t = 8'd6;
  i7_t = 8'd7;

  for (i = 0; i < 8; i = i + 1'b1)
  begin
   s_t=i;
   #20;
  end

 end
endmodule
