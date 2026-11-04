`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 20:37:43
// Design Name: 
// Module Name: decode_3_8_2_4
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


module decoder_2_4 (en,a,b,y3,y2,y1,y0);
  input en,a,b;
  output reg  y3,y2,y1,y0;
  always @ (*)
    begin
      y0<=en&~a&~b;
      y1<=en&~a&b;
      y2<=en&a&~b;
      y3<=en&a&b;
    end
endmodule

module decoder_3_8 (a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);
  input a,b,c;
  output y7,y6,y5,y4,y3,y2,y1,y0;
  
  decoder_2_4 D1 (.en(~a),.a(b),.b(c),.y3(y3),.y2(y2),.y1(y1),.y0(y0));
  decoder_2_4 D2 (.en(a),.a(b),.b(c),.y3(y7),.y2(y6),.y1(y5),.y0(y4));
  
endmodule
