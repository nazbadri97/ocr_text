`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2026 17:35:49
// Design Name: 
// Module Name: seq_des
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
//  Mealy Machine — 1011 Overlapping Sequence Detector
//  Two-always block FSM (industry standard)
//  Compatible: Verilog-2001 / SystemVerilog
// ============================================================

module seq_des (
    input  wire clk,
    input  wire rst,   // Active-high synchronous reset
    input  wire in,
    output reg  out
);

    // ---- State encoding (one-hot for efficient synthesis) ----
    localparam [3:0]
        S0 = 4'b0001,   // Idle
        S1 = 4'b0010,   // Got '1'
        S2 = 4'b0100,   // Got '10'
        S3 = 4'b1000;   // Got '101'

    reg [3:0] state, next;

    // ---- BLOCK 1: State register (sequential) ----------------
    always @(posedge clk) begin
        if (rst)
            state <= S0;
        else
            state <= next;
    end

    // ---- BLOCK 2: Next-state + output (combinational) --------
    always @(*) begin
        next = S0;      // safe default
        out  = 1'b0;

        case (state)
            S0: next = in ? S1 : S0;

            S1: next = in ? S1 : S2;   // 1?1 restart; 1?0 progress

            S2: next = in ? S3 : S0;   // 10?1 progress; 10?0 reset

            S3: begin
                    if (in) begin
                        next = S1;     // 1011 found; '1' overlaps as new start
                        out  = 1'b1;  // assert output (Mealy: same cycle as last '1')
                    end else
                        next = S2;    // 1010 ? still have "10" prefix
                end

            default: next = S0;
        endcase
    end

endmodule
