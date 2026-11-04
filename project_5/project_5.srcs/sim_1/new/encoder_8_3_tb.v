`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 23:18:49
// Design Name: 
// Module Name: encoder_8_3_tb
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


module encoder_8_3_tb;
  reg d0,d1,d2,d3,d4,d5,d6,d7;
  wire a,b,c;
  
  encoder_8_3 dut (.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),.a(a),.b(b),.c(c));
  
  initial
    begin
      d0=1'b0;d1=1'b0;d2=1'b0;d3=1'b0;d4=1'b0;d5=1'b0;d6=1'b0;d7=1'b1;
      #10;d0=1'b0;d1=1'b0;d2=1'b0;d3=1'b0;d4=1'b0;d5=1'b0;d6=1'b1;d7=1'b0;
      #10;d0=1'b0;d1=1'b0;d2=1'b0;d3=1'b0;d4=1'b0;d5=1'b1;d6=1'b0;d7=1'b0;
      #10;d0=1'b0;d1=1'b0;d2=1'b0;d3=1'b0;d4=1'b1;d5=1'b0;d6=1'b0;d7=1'b0;
      #10;d0=1'b0;d1=1'b0;d2=1'b0;d3=1'b1;d4=1'b0;d5=1'b0;d6=1'b0;d7=1'b0;
      #10;d0=1'b0;d1=1'b0;d2=1'b1;d3=1'b0;d4=1'b0;d5=1'b0;d6=1'b0;d7=1'b0;
      #10;d0=1'b0;d1=1'b1;d2=1'b0;d3=1'b0;d4=1'b0;d5=1'b0;d6=1'b0;d7=1'b0;
      #10;d0=1'b1;d1=1'b0;d2=1'b0;d3=1'b0;d4=1'b0;d5=1'b0;d6=1'b0;d7=1'b0;
      #20 $finish;
    end
    endmodule
