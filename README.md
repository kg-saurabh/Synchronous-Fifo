# Synchronous FIFO Design and Verification

A synthesizable Synchronous FIFO (First-In, First-Out) memory buffer implemented in Verilog. This design uses a single clock domain for both read and write operations.

## Features
* Configurable data width and memory depth using Verilog parameters.
* Status flags: `Full`and`Empty` to prevent data corruption.
* Clean pointer control logic to handle simultaneous read and write operations safely.

## Project Structure
* `top_sync_fifo.v` - Main RTL design file containing the memory array and control logic.
* `tb_top_fifo_tb.v` - Testbench verifying corner cases (overflow, underflow, simultaneous operations).

## Tools Used
* **Language:** Verilog
* **Simulation:**  Vivado Simulator
* **EDA Tool**  Vivado Simulator
