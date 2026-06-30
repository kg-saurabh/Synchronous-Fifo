`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 15:58:40
// Design Name: 
// Module Name: tb_sync_fifo
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


module tb_sync_fifo(

    );
    reg clk,reset,write_en,read_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full,empty;
    sync_fifo inst_1( clk,reset,write_en,read_en,data_in,data_out,full,empty);
    initial
    begin
    {clk,reset,write_en,read_en,data_in} = 0;
    end
    always #5 clk = ~clk;
    
    initial
    begin
    reset = 1;
    #10 reset = 0;
    write_en = 1;
    data_in = 7'd5;
    #10 write_en = 1;
    data_in = 10;
    #10
    write_en = 0;
    #10
    read_en = 1;
    #10
    $finish;
    end
    

endmodule
