`timescale 1ns / 10ns
`include "uart_tx6.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:11:54 04/29/2014
// Design Name:   send_binary_as_ascii
// Module Name:   /home/shanel/research/neural-hardware/single-layer-perceptron/send_binary_as_ascii_tb.v
// Project Name:  single-layer-perceptron
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: send_binary_as_ascii
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module send_binary_as_ascii_tb;

	parameter M = 8;

	// Inputs
	reg baud_clk;
	reg en_16_x_baud = 0;
	reg send;
	reg [M-1:0] binary_in = {M{1'b1}};

	// Outputs
	wire [7:0] ascii_out;
	wire data_present;

	// Instantiate the Unit Under Test (UUT)
	send_binary_as_ascii #(M) uut (
		.en_16_x_baud(en_16_x_baud), 
		.send(send), 
		.binary_in(binary_in), 
		.ascii_out(ascii_out), 
		.data_present(data_present)
	);

	wire TX;
	uart_tx6 uart_tx6 (
    	.data_in(ascii_out),
    	.buffer_write(data_present),
    	.buffer_reset(0),
    	.en_16_x_baud(en_16_x_baud),
    	.serial_out(TX),
    	//.buffer_data_present(),
    	//.buffer_half_full(),
    	//.buffer_full(),
    	.clk(baud_clk) 
	);

	always @(posedge baud_clk) begin
		en_16_x_baud = ~en_16_x_baud;
	end

	initial begin
		baud_clk = 1;
		forever begin
			#5 baud_clk = ~baud_clk;
		end
	end

	initial begin
		// Initialize Inputs
		send = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		send = 1; #5 send = 0;
		#1000;
		$finish;
	end
      
endmodule

