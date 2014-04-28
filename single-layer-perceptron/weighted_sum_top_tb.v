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

	parameter N = 2;

	// Inputs
	reg clk;
	reg [18*N-1:0] x, w;

	reg [17:0] x_val;
	reg [17:0] w_val;

	// Outputs
	wire [47:0] sum;
	wire [17:0] x_delayed, w_delayed;

	// Instantiate the Unit Under Test (UUT)
	weighted_sum_top #(N) uut (
		.clk(clk), 
		.x(x), 
		.w(w), 
		.sum(sum) 
	);

	fifo #(.WIDTH(18*N*2), .DEPTH(3 + N)) input_output_sync(
		.clk(clk),
		.in({x_val, w_val}),
		.out({x_delayed, w_delayed})
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

		// Slight offset for clk
		#2;
        
		x_val = 18'd10;
		w_val = 18'd2;

		x = {N{x_val}};
		w = {N{w_val}};
		#10;

        ////////////////////////////
		//    Add stimulus here   //
        ////////////////////////////
		forever begin 
			x_val = x_val + 1;
			w_val = w_val + 1;
			
			x = {N{x_val}};
			w = {N{w_val}};
			#10;
		end
		////////////////////////////
	end

	always @(posedge clk) begin
		if (N * x_delayed * w_delayed != sum) begin
			$display("Expected %d... Got %d instead", N * x_delayed * w_delayed, sum);
		end
	end
      

    initial begin
    	
    	#1000;
    	$finish;

    end
endmodule