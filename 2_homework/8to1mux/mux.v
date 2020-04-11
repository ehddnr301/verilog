`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 17:42:59
// Design Name: 
// Module Name: mux
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


module mux(i0,i1,i2,i3,i4,i5,i6,i7,s,y);
    
input [7:0]i0,i1,i2,i3,i4,i5,i6,i7;
input [2:0] s;
output [7:0] y;

reg [7:0] y;

always @(i0 or i2 or i3 or i4 or i5 or i6 or i7 or s) begin
case (s)
  3'b000 : y = i0; 
  3'b001 : y = i1; 
  3'b010 : y = i2; 
  3'b011 : y = i3; 
  3'b100 : y = i4; 
  3'b101 : y = i5; 
  3'b110 : y = i6; 
  3'b111 : y = i7; 
default: y= 8'bx;
endcase
    
end    
    
endmodule
