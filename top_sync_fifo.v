`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 17:00:14
// Design Name: 
// Module Name: top_sync_fifo
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

//////////////////////////////////////////////////////////////////////////////////


module top_sync_fifo(
input clk,reset,
input [7:0] data_in_top,
output  [7:0] data_out_top
    );
    wire [7:0] data_out_temp;
    wire[7:0] data_out_fifo;
    wire full,empty;
    wire write_en,read_en;
    mod_a inst1(.reset(reset),.clk(clk),.data_in(data_in_top),.write_en(write_en),.data_out(data_out_temp));
    sync_fifo inst2(clk,reset,write_en,read_en,data_out_temp,data_out_fifo,full,empty);
    mod_b inst3(clk,reset,data_out_fifo,data_out_top,read_en);
endmodule
