`timescale 1ns/1ps 


module tb_top_sync_fifo(
    );
    reg clk,reset;
    reg [7:0] data_in;
    wire [7:0] data_out;
    top_sync_fifo inst1(clk,reset,data_in,data_out);
    initial begin
    {clk,data_in,reset} = 0;
    end
    always #5 clk = ~clk;
    initial begin
    #10 reset = 1;
    #10 
    reset = 0;
    data_in = 5;
    #10 
    reset = 0;
    data_in = 10;
    #10
    data_in = 05;
    #10
    $finish;
    end
endmodule
