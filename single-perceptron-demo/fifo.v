`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Shane Leonard
// 
// Create Date:    19:52:03 04/27/2014 
// Design Name: 
// Module Name:    fifo 
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
module fifo(
	input clk,
	input [WIDTH - 1:0] in,
	output [WIDTH - 1:0] out
);

parameter WIDTH  = 18;
parameter DEPTH = 2;

wire [WIDTH - 1 : 0] pipe [DEPTH - 1 : 0];

dff #(WIDTH) start(
	.d   ( in      ),
	.q   ( pipe[0] ),
	.clk ( clk     )
);

generate
	genvar i;
	for (i = 0; i < DEPTH - 1; i = i + 1)
	begin:pipeline_stage
		
		dff #(WIDTH) stage(
			.d   ( pipe[i]   ),
			.q   ( pipe[i+1] ),
			.clk ( clk       )
		);

	end
endgenerate

assign out = pipe[DEPTH - 1];

endmodule