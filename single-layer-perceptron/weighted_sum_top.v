`timescale 1ns / 1ps
`define SPARTAN6_XC6SLX9_DSP_SLICES 16 // number of DSP48 slices on the SPARTAN 6 X9
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Shane Leonard
// 
// Create Date:    13:17:32 04/22/2014 
// Design Name: 
// Module Name:    weighted_sum_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module weighted_sum_top(
	input  clk,
	input  [ 18*N-1 :0 ] x, w,
	output [ 47:0 ] sum
);

parameter N = 8; // number of 18-bit inputs

wire [47:0] carry   [N - 1:0];
wire [47:0] int_sum [N - 1:0];

assign sum = int_sum[N - 1];

weighted_sum_slice start(
	.clk  ( clk        ),
	.a    ( x[17:0]    ),
	.b    ( w[17:0]    ),
	.pcin ( 48'b0      ),
	.pcout( carry[0]   ),
	.p    ( int_sum[0] )
);

generate
	genvar i;
	for (i = 1; i < N; i = i + 1)
	begin:dsp_slice
		
		weighted_sum_slice slice(
			.clk  ( clk         ),
			.a    ( x[18*i-1:0] ),
			.b    ( w[18*i-1:0] ),
			.pcin ( carry[i-1]  ),
			.pcout( carry[i]    ),
			.p    ( int_sum[i]  )
		);

	end
endgenerate

endmodule
