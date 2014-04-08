`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:55 04/07/2014
// Design Name:   weighted_sum
// Module Name:   /home/shanel/research/neural-hardware/single-layer-perceptron/weighted_sum_tb.v
// Project Name:  single-layer-perceptron
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: weighted_sum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module weighted_sum_tb;

	// Inputs
	reg [7:0] x;
	reg [255:0] w;
	reg clk, rst;

	// Outputs
	wire [31:0] sum;

	// Instantiate the Unit Under Test (UUT)
	weighted_sum uut (
		.x(x), 
		.w(w), 
		.sum(sum),
		.clk(clk),
		.rst(rst)
	);

	initial begin 
		clk = 1;
		#10;
		forever begin
			clk = ~clk;
			#10;
		end
	end

	initial begin
		// Initialize Inputs
		x = 0;
		w = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#105;
		rst = 0;
		#10;

        //////////////////////////////////////////////
        // Homogenous positive weights, no overflow //
        //////////////////////////////////////////////
        
        w = {32'd1, 32'd2, 32'd4, 32'd8, 32'd16, 32'd32, 32'd64, 32'd128};
		
		// Test: single input
		x = 1;
		#200;

		x = 1 << 1;
		#200;
		
		x = 1 << 2;
		#200;
		
		x = 1 << 3;
		#200;
		
		x = 1 << 4;
		#200;
		
		x = 1 << 5;
		#200;

		x = 1 << 6;
		#200;

		x = 1 << 7;
		#200;

		// Test: single input
		x = 1;
		#20;

		x = 1 << 1;
		#20;
		
		x = 1 << 2;
		#20;
		
		x = 1 << 3;
		#20;
		
		x = 1 << 4;
		#20;
		
		x = 1 << 5;
		#20;

		x = 1 << 6;
		#20;

		x = 1 << 7;
		#20;
	end
      
endmodule

