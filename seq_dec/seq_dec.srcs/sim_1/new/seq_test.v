`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2026 17:37:44
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


// ============================================================
//  Self-checking testbench — seq_detector_1011
// ============================================================
`timescale 1ns/1ps

module seq_test;

    reg  clk, rst, in;
    wire out;

    seq_des dut (
        .clk(clk), .rst(rst), .in(in), .out(out)
    );

    // 10 ns clock
    always #5 clk = ~clk;

    // Task: apply one bit and optionally check output
    task apply (input bit_in, input exp_out);
        @(negedge clk);
        in = bit_in;
        @(posedge clk); #1;
        if (out !== exp_out)
            $display("FAIL  t=%0t in=%b out=%b exp=%b", $time, in, out, exp_out);
    endtask

    initial begin
        $dumpfile("seq_det.vcd");
        $dumpvars(0, tb_seq_detector);

        clk = 0; rst = 1; in = 0;
        @(posedge clk); #1;
        rst = 0;

        // ---- Test 1: basic detection -------------------------
        // Sequence: 1 0 1 1  ? detect at 4th bit
        apply(1, 0);
        apply(0, 0);
        apply(1, 0);
        apply(1, 1);  // << detect

        // ---- Test 2: overlapping ----------------------------
        // After 1011, the last '1' is S1; feed 0 1 1 ? detect again
        apply(0, 0);
        apply(1, 0);
        apply(1, 1);  // << detect (overlapping)

        // ---- Test 3: no false positive ----------------------
        apply(0, 0);
        apply(1, 0);
        apply(0, 0);
        apply(0, 0);
        apply(1, 0);  // no detection

        // ---- Test 4: back-to-back 10111011 ------------------
        apply(1, 0);
        apply(0, 0);
        apply(1, 0);
        apply(1, 1);  // << detect
        apply(1, 0);
        apply(0, 0);
        apply(1, 0);
        apply(1, 1);  // << detect

        $display("Simulation done.");
        $finish;
    end

endmodule
