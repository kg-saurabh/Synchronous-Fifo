`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 16:41:10
// Design Name: 
// Module Name: mod_a
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


module mod_a(
input clk,reset,input[7:0] data_in,
output reg [7:0]data_out,output reg write_en
    );
    always@(posedge clk) begin
    if(reset) begin
    data_out<= 0;
    write_en = 0;
    end
    else begin
    data_out <= data_in;
    write_en = 1;
    end
    end
endmodule
