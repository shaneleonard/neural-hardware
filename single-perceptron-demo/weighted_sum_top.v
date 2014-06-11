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
	input  [ 16*N-1 : 0 ] x, w,
	output [ 47:0 ] sum
);

parameter N = 8; // number of 16-bit inputs

// M = MIN(N, `SPARTAN6_XC6SLX9_DSP_SLICES)
localparam M = `SPARTAN6_XC6SLX9_DSP_SLICES < N ? `SPARTAN6_XC6SLX9_DSP_SLICES : N;

wire [47:0] carry   [M:0];
wire [47:0] int_sum [M-1:0];

wire [17:0] x_start, w_start;
wire [35:0] p_start;

fifo #(.WIDTH(36), .DEPTH(1)) input_fifo(
	.clk( clk                  ),
	.in ( { x[15], x[15], x[15:0], w[15], w[15], w[15:0] } ),
	.out( { x_start, w_start } )
);

weighted_sum_start_slice start(
	.clk  ( clk             ),
	.a    ( x_start         ),
	.b    ( w_start         ),
	.pcout( carry[0]        ),
	.p    ( p_start         )
);

assign int_sum[0] = p_start;

generate
	genvar i;
	for (i = 2; i < M + 1; i = i + 1)
	begin:dsp_slice
		
		wire [15:0] x_delayed, w_delayed;

		fifo #(.WIDTH(16), .DEPTH(i)) input_fifo(
			.clk( clk                ),
			.in ( x[16*i-1:16*(i-1)] ),
			.out( x_delayed          )
		);

		fifo #(.WIDTH(16), .DEPTH(i)) weight_fifo(
			.clk( clk                ),
			.in ( w[16*i-1:16*(i-1)] ),
			.out( w_delayed          )
		);

		weighted_sum_slice slice(
			.clk  ( clk               ),
			.a    ( {x_delayed[15], x_delayed[15], x_delayed} ),
			.b    ( {w_delayed[15], w_delayed[15], w_delayed} ),
			.pcin ( carry[i-2]        ),
			.pcout( carry[i-1]        ),
			.p    ( int_sum[i-1]      )
		);

	end
endgenerate

assign sum = int_sum[M-1];

endmodule