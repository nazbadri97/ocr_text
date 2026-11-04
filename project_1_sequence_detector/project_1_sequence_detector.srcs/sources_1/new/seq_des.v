`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2026 17:29:14
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
//  Mealy Machine: 1011 Sequence Detector (Overlapping)
// ============================================================

module seq_detector_1011 (
    input  wire clk,
    input  wire rst,       // Active-high synchronous reset
    input  wire in,
    output reg  out
);

    // State encoding
    typedef enum logic [1:0] {
        S0 = 2'b00,  // Idle
        S1 = 2'b01,  // Got 1
        S2 = 2'b10,  // Got 10
        S3 = 2'b11   // Got 101
    } state_t;

    state_t current_state, next_state;

    // ---------------------------------------------------------
    // State Register (Sequential)
    // ---------------------------------------------------------
    always @(posedge clk) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // ---------------------------------------------------------
    // Next State Logic + Output Logic (Mealy: depends on input)
    // ---------------------------------------------------------
    always @(*) begin
        // Defaults
        next_state = S0;
        out        = 1'b0;

        case (current_state)
            S0: begin
                if (in) next_state = S1;
                else    next_state = S0;
            end

            S1: begin  // Received: 1
                if (in) next_state = S1;   // 1?1, restart
                else    next_state = S2;   // 1?0
            end

            S2: begin  // Received: 10
                if (in) next_state = S3;   // 10?1
                else    next_state = S0;   // 10?0, reset
            end

            S3: begin  // Received: 101
                if (in) begin
                    next_state = S1;       // 1011 detected! '1' overlaps
                    out        = 1'b1;     // OUTPUT ASSERTED (Mealy)
                end else
                    next_state = S2;       // 101?0 ? back to S2 (got "10")
            end

            default: next_state = S0;
        endcase
    end

endmodule
