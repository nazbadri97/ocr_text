`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2026 17:23:11
// Design Name: 
// Module Name: seq_test
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


module tb_seq_detector_1011;

    reg  clk, rst, in;
    wire out;

    // Instantiate DUT
    seq_detector_1011 dut (
        .clk(clk), .rst(rst), .in(in), .out(out)
    );

    // 10ns clock
    always #5 clk = ~clk;

    // Input sequence: 1 0 1 1 0 1 1 1 0 1 1
    //                           ^       ^   (detections)
    initial begin
        $dumpfile("seq_det.vcd");
        $dumpvars(0, tb_seq_detector_1011);

        clk = 0; rst = 1; in = 0;
        @(posedge clk); #1;
        rst = 0;

        // Feed: 1 0 1 1 ? detect at 4th bit
        @(posedge clk); #1; in = 1;
        @(posedge clk); #1; in = 0;
        @(posedge clk); #1; in = 1;
        @(posedge clk); #1; in = 1;  // out=1 here

        // Overlapping: continue with 0 1 1 ? second detect
        @(posedge clk); #1; in = 0;
        @(posedge clk); #1; in = 1;
        @(posedge clk); #1; in = 1;  // out=1 here (1011 again)

        @(posedge clk); #1; in = 0;
        #20;
        $display("Simulation complete.");
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | in=%b | state=%s | out=%b",
                  $time, in, dut.current_state.name(), out);
    end

endmodule
