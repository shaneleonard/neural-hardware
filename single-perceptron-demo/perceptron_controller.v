`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:24 06/07/2014 
// Design Name: 
// Module Name:    perceptron_controller 
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
module perceptron_controller(
	input clk, rst,
	input enable,
	input [8:0] bram_data_addr,
	output [8:0] output_addr,
	input [31:0] bram_data,
	output [15:0] perceptron_out,
	output fire
);

parameter N = 8;
parameter START_ADDR = 9'd0;

wire [16*N-1:0] x,w;

assign output_addr = START_ADDR + N;

generate
	genvar i;
	for (i = 1; i <= N; i = i + 1)
	begin:input_registers

	reg enable_input;
	always @(posedge clk) begin
		if (rst) begin
			enable_input <= 0;
		end else begin
			enable_input <= (bram_data_addr - START_ADDR) == i - 1;
		end
	end

	dffre #(16) x_register(
		.clk(clk),
		.r  (rst),
		.en (enable_input),
		.d  (bram_data[15:0]),
		.q  (x[16*i-1:16*(i-1)])
	);

	dffre #(16) w_register(
		.clk(clk),
		.r  (rst),
		.en (enable_input),
		.d  (bram_data[31:16]),
		.q  (w[16*i-1:16*(i-1)])
	);

	end
endgenerate

perceptron #(N) perceptron(
	.clk    (clk),
	.rst    (rst),
	.enable (enable),
	.x      (x),
	.w      (w),
	.y      (perceptron_out),
	.fire   (fire)
);

endmodule