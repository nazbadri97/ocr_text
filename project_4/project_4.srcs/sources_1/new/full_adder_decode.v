`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 22:57:31
// Design Name: 
// Module Name: full_adder_decode
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


module full_adder_decode (a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  wire y0,y1,y2,y3,y4,y5,y6,y7;
  
  assign y0=~a&~b&~c;
  assign y1=~a&~b&c;
  assign y2=~a&b&~c;
  assign y3=~a&b&c;
  assign y4=a&~b&~c;
  assign y5=a&~b&c;
  assign y6=a&b&~c;
  assign y7=a&b&c;
  or OR1 (sum,y1,y2,y4,y7);
  or OR2 (carry,y3,y5,y6,y7);
endmodule
