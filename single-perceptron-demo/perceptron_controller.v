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

wire [16*N-1:0] x,w;

assign output_addr = 9'd8;

reg [N-1:0] enable_input;

always @(posedge clk) begin
	if (rst) begin
		enable_input <= 0;
	end else begin
		case (bram_data_addr)
			9'd0: enable_input <= {{(N-1){1'b0}}, 1'b1};
			9'd1: enable_input <= {{(N-2){1'b0}}, 2'b10};
			9'd2: enable_input <= {{(N-3){1'b0}}, 3'b100};
			9'd3: enable_input <= {{(N-4){1'b0}}, 4'b1000};
			9'd4: enable_input <= {{(N-5){1'b0}}, 5'b10000};
			9'd5: enable_input <= {{(N-6){1'b0}}, 6'b100000};
			9'd6: enable_input <= {{(N-7){1'b0}}, 7'b1000000};
			9'd7: enable_input <= {{(N-8){1'b0}}, 8'b10000000};
			default: enable_input <= 0;
		endcase
	end
end

generate
	genvar i;
	for (i = 1; i <= N; i = i + 1)
	begin:input_registers

	dffre #(16) x_register(
		.clk(clk),
		.r  (rst),
		.en (enable_input[i-1]),
		.d  (bram_data[15:0]),
		.q  (x[16*i-1:16*(i-1)])
	);

	dffre #(16) w_register(
		.clk(clk),
		.r  (rst),
		.en (enable_input[i-1]),
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