`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2026 12:04:59
// Design Name: 
// Module Name: and_gate_tb
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


module and_gate_tb();
reg a,b;
wire out;
and_gate dut (.a(a),.b(b),.out(out));

initial begin
a=1'b0;b=1'b0;
#10;a=1'b0;b=1'b1;
#10;a=1'b1;b=1'b0;
#10;a=1'b1;b=1'b1;
#50 $finish;
end
endmodule




