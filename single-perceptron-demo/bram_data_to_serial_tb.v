`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:21 05/08/2014
// Design Name:   bram_data_to_serial
// Module Name:   /afs/ir.stanford.edu/users/s/h/shanel/research/sandbox/uart_write_to_ram/bram_data_to_serial_tb.v
// Project Name:  uart_write_to_ram
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bram_data_to_serial
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bram_data_to_serial_tb;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg [3:0] bytes_to_send;
	reg [31:0] read_addr;
	reg [31:0] bram_data_in;

	// Outputs
	wire [7:0] uart_data_out;
	wire uart_data_write;
	wire [31:0] bram_read_addr;
	wire send_complete;

	// Instantiate the Unit Under Test (UUT)
	bram_data_to_serial uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.bytes_to_send(bytes_to_send), 
		.read_addr(read_addr), 
		.uart_data_out(uart_data_out), 
		.uart_data_write(uart_data_write), 
		.bram_data_in(bram_data_in), 
		.bram_read_addr(bram_read_addr), 
		.send_complete(send_complete)
	);

	initial begin 
		clk = 1;
		forever #5 clk = ~clk;
	end 

	initial begin
		// Initialize Inputs
		rst = 1;
		enable = 0;
		bytes_to_send = 0;
		read_addr = 0;
		bram_data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;

		// Add stimulus here
		#10;
		enable = 1;
		bytes_to_send = 4'b0001;
		bram_data_in = {8'd10, 8'd20, 8'd30, 8'd40};
		read_addr = 32'd12345;

		#10;
		enable = 0;

		#300;

		#10;
		enable = 1;
		bytes_to_send = 4'b1001;
		bram_data_in = {8'd10, 8'd20, 8'd30, 8'd40};
		read_addr = 32'd12345;

		#10;
		enable = 0;

		#300;

		#10;
		enable = 1;
		bytes_to_send = 4'b1010;
		bram_data_in = {8'd10, 8'd20, 8'd30, 8'd40};
		read_addr = 32'd12345;

		#10;
		enable = 0;

		#300;

		#10;
		enable = 1;
		bytes_to_send = 4'b1110;
		bram_data_in = {8'd10, 8'd20, 8'd30, 8'd40};
		read_addr = 32'd12345;

		#10;
		enable = 0;

		#300;


		#10;
		enable = 1;
		bytes_to_send = 4'b1111;
		bram_data_in = {8'd10, 8'd20, 8'd30, 8'd40};
		read_addr = 32'd12345;

		#10;
		enable = 0;

		#300;
		$finish;

	end
      
endmodule

