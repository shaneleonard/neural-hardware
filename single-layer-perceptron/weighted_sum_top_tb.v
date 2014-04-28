`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:03:07 04/22/2014
// Design Name:   weighted_sum_top
// Module Name:   /home/shanel/research/neural-hardware/single-layer-perceptron/weighted_sum_top_tb.v
// Project Name:  single-layer-perceptron
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: weighted_sum_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module weighted_sum_top_tb;

	parameter N = 3;

	// Inputs
	reg clk;
	reg [18*N-1:0] x;
	reg [18*N-1:0] w;

	// Outputs
	wire [47:0] sum;

	// Instantiate the Unit Under Test (UUT)
	weighted_sum_top #(N) uut (
		.clk(clk), 
		.x(x), 
		.w(w), 
		.sum(sum) 
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		x = 0;
		w = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		x = {N{18'd10}};
		w = {{18'd2},{18'd500},{18'd30}};
	end
      
endmodule

