`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 20:04:30
// Design Name: 
// Module Name: decoder_3_8
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


module decoder_3_8 (a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);
  input a,b,c;
  output reg  y7,y6,y5,y4,y3,y2,y1,y0;
  always @ (*)
    begin
      y7<=~a&~b&~c;
      y6<=~a&~b&c;
      y5<=~a&b&~c;
      y4<=~a&b&c;
      y3<=a&~b&~c;
      y2<=a&~b&c;
      y1<=a&b&~c;
      y0<=a&b&c;
    end
endmodule
