`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 20:05:05
// Design Name: 
// Module Name: decoder_3_8_tb
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


module decoder_3_8_tb;
  reg a,b,c;
  wire y7,y6,y5,y4,y3,y2,y1,y0;
  
  decoder_3_8 dut (.a(a),.b(b),.c(c),.y7(y7),.y6(y6),.y5(y5),.y4(y4),.y3(y3),.y2(y2),.y1(y1),.y0(y0));
  
  initial
    begin
      a=1'b0;b=1'b0;c=1'b0;
      #10;a=1'b0;b=1'b0;c=1'b1;
      #10;a=1'b0;b=1'b1;c=1'b0;
      #10;a=1'b0;b=1'b1;c=1'b1;
      #10;a=1'b1;b=1'b0;c=1'b0;
      #10;a=1'b1;b=1'b0;c=1'b1;
      #10;a=1'b1;b=1'b1;c=1'b0;
      #10;a=1'b1;b=1'b1;c=1'b1;
      #20 $finish;
    end
    endmodule
