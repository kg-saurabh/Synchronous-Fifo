`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 16:41:59
// Design Name: 
// Module Name: mod_b
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

// Writing the Module by using the finite state Machine
module mod_b(
    input clk,
    input reset,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg read_en
);
    parameter idle = 2'b00, S1 = 2'b01, data_state = 2'b11;
    reg [1:0] state, next_state;

    // 1. ADDED SEQUENTIAL BLOCK: This moves 'state' from X to idle when reset is 1
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= idle;
            data_out <= 8'b0;
        end else begin
            state <= next_state;
            if (read_en) begin
                data_out <= data_in;
            end
        end
    end

    // 2. COMBINATIONAL BLOCK
    always @(*) begin
        // Set safe baseline defaults so outputs are never left unassigned
        next_state = state;
        read_en = 0;
        
        case(state)
            idle: begin 
                next_state = S1;
                read_en = 0;
            end
            
            S1: begin 
                next_state = data_state;
                read_en = 0; // Fixed: explicitly assign to avoid latches
            end
            
            data_state: begin
                next_state = idle;
                read_en = 1;
            end
            
            // ADDED DEFAULT: Safely recovers if the state machine ever hits an unknown X/Z condition
            default: begin
                next_state = idle;
                read_en = 0;
            end
        endcase
    end
    
endmodule

