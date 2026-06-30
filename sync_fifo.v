`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 23:35:41
// Design Name: 
// Module Name: sync_fifo
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


module sync_fifo(
input clk,reset, write_en,read_en,
input [7:0] data_in,
output reg  [7:0] data_out,
output wire full,empty
    );
    reg [2:0] wr_ptr = 3'b0;
    reg [2:0] rd_ptr = 3'b0; // for representing the location of fifo
    reg [7:0] memory [0:7]; // declared a memory for the storing the data
    integer i = 0;
    always@(posedge clk) begin
    if(reset)
    begin
    for(i = 0;i <8;i = i+1)
    memory[i] <= 0;
    end
     if(write_en && full == 1'b0) begin
    memory[wr_ptr] <= data_in;
    wr_ptr <= wr_ptr + 1'b1;
    end
     if(read_en && empty == 1'b0 ) begin
    data_out <= memory[rd_ptr];
    rd_ptr <= rd_ptr + 1'b1;
    end
    end
    assign full = ((wr_ptr + 1'b1) == rd_ptr) ? 1'b1 : 1'b0 ;
    assign empty =(wr_ptr == rd_ptr);
    
    
endmodule
