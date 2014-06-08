`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:02:34 05/09/2014
// Design Name:   serial_data_to_bram
// Module Name:   /afs/ir.stanford.edu/users/s/h/shanel/research/sandbox/uart_write_to_ram/serial_data_to_bram_tb.v
// Project Name:  uart_write_to_ram
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serial_data_to_bram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module serial_data_to_bram_tb;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg [3:0] bytes_to_write;
	reg [31:0] write_addr;
	reg [7:0] uart_data_in;
	reg uart_data_present;

	// Outputs
	wire write_complete;
	wire uart_data_read;
	wire [31:0] bram_data;
	wire bram_write_enable;
	wire [3:0] bram_write_enable_bytes;
	wire [31:0] bram_write_addr;

	// Instantiate the Unit Under Test (UUT)
	serial_data_to_bram uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.bytes_to_write(bytes_to_write), 
		.write_complete(write_complete), 
		.write_addr(write_addr), 
		.uart_data_in(uart_data_in), 
		.uart_data_present(uart_data_present), 
		.uart_data_read(uart_data_read), 
		.bram_data(bram_data), 
		.bram_write_enable(bram_write_enable), 
		.bram_write_enable_bytes(bram_write_enable_bytes), 
		.bram_write_addr(bram_write_addr)
	);

	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		rst = 1;
		enable = 0;
		bytes_to_write = 0;
		write_addr = 0;
		uart_data_in = 0;
		uart_data_present = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;

		// Add stimulus here
		#10;

		enable = 1;
		bytes_to_write = 4'b1010;
		write_addr = 32'd1;
		#10 enable = 0;
		#40;
		uart_data_in = 8'd2;
		uart_data_present = 1;
		

		#50;

		uart_data_present = 0;
		
		#500;
		enable = 1;
		bytes_to_write = 4'b1110;
		write_addr = 32'd2;
		#10 enable = 0;
		#40;
		uart_data_in = 8'd3;
		uart_data_present = 1;
        #20 uart_data_present = 0;
        #50 uart_data_present = 1;
        #50 uart_data_present = 0;

		#500;
		enable = 1;
		bytes_to_write = 4'b1111;
		write_addr = 32'd3;
		#10 enable = 0;
		#40;
		uart_data_in = 8'd4;
		uart_data_present = 1;

        #500;
		enable = 1;
		bytes_to_write = 4'b1111;
		write_addr = 32'd4;
		#10 enable = 0;
		#40;
		uart_data_in = 8'd5;
		uart_data_present = 1;
		$finish;
	end
      
endmodule

