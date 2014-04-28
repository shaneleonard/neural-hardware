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
	input  [ 18*N-1 : 0 ] x, w,
	output [ 47:0 ] sum
);

parameter N = 8; // number of 18-bit inputs

// M = MIN(N, `SPARTAN6_XC6SLX9_DSP_SLICES)
localparam M = `SPARTAN6_XC6SLX9_DSP_SLICES < N ? `SPARTAN6_XC6SLX9_DSP_SLICES : N;

wire [47:0] carry   [N - 1:0];
wire [47:0] int_sum [N - 1:0];

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
	for (i = 1; i < M; i = i + 1)
	begin:dsp_slice
		
		wire [17:0] x_delayed, w_delayed;

		fifo #(.WIDTH(18), .DEPTH(i)) input_fifo(
			.clk( clk                ),
			.in ( x[18*i-1:18*(i-1)] ),
			.out( x_delayed          )
		);

		fifo #(.WIDTH(18), .DEPTH(i)) weight_fifo(
			.clk( clk               ),
			.in ( w[18*i-1:18*(i-1)]),
			.out( w_delayed         )
		);

		weighted_sum_slice slice(
			.clk  ( clk        ),
			.a    ( x_delayed  ),
			.b    ( w_delayed  ),
			.pcin ( carry[i-1] ),
			.pcout( carry[i]   ),
			.p    ( int_sum[i] )
		);

	end
endgenerate

assign sum = int_sum[N - 1];

endmodule