`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 23:17:54
// Design Name: 
// Module Name: encoder_8_3
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


module encoder_8_3 (d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);
  input d0,d1,d2,d3,d4,d5,d6,d7;
  output a,b,c;
  
  assign a=d3|d2|d1|d0;
  assign b=d5|d4|d1|d0;
  assign c=d6|d4|d2|d0;
endmodule