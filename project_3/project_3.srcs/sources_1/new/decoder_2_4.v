`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 19:44:08
// Design Name: 
// Module Name: decoder_2_4
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


module decoder_2_4 (a,b,y3,y2,y1,y0);
  input a,b;
  output reg  y3,y2,y1,y0;
  always @ (*)
    begin
      y3<=~a&~b;
      y2<=~a&b;
      y1<=a&~b;
      y0<=a&b;
    end
endmodule
