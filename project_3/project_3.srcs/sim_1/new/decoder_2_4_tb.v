`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 19:45:18
// Design Name: 
// Module Name: decoder_2_4_tb
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


module decoder_2_4_tb;
  reg a,b;
  wire y3,y2,y1,y0;
  
  decoder_2_4 dut (.a(a),.b(b),.y3(y3),.y2(y2),.y1(y1),.y0(y0));
  
  initial
    begin
      a=1'b0;b=1'b0;
      #10;a=1'b0;b=1'b1;
      #10;a=1'b1;b=1'b0;
      #10;a=1'b1;b=1'b1;
      #20 $finish;
    end
    endmodule
