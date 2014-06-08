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
	input [8:0] start_addr,
	input [8:0] end_addr,
	input [31:0] bram_data_in,
	output reg [8:0] bram_data_addr,
	output [15:0] perceptron_out,
	output fire
);

parameter N = 8;

reg [2:0] state;
wire load_complete;

localparam START     = 3'b000;
localparam LOAD_DATA = 3'b100;
localparam ACTIVATE  = 3'b010;
localparam PAUSE     = 3'b001;

always @(posedge clk) begin
	if (rst) begin
		state <= START;
	end else begin
		case (state)
			START:     state <= enable ? LOAD_DATA : START;
			LOAD_DATA: state <= load_complete ? ACTIVATE : LOAD_DATA;
			ACTIVATE:  state <= PAUSE;
			PAUSE:     state <= fire ? START : PAUSE;
			default:   state <= START;
		endcase
	end
end

reg [N-1:0] counter;
always @(posedge clk) begin
	if (rst) begin
		counter <= 1;
	end else begin
		case (state)
			LOAD_DATA: counter <= counter << 1;
			default:   counter <= 1;
		endcase
	end
end

assign load_complete = counter[N-1];

always @(posedge clk) begin
	if (rst) begin
		bram_data_addr <= 0;
	end else begin
		case (state)
			LOAD_DATA: bram_data_addr <= bram_data_addr + 1;
			PAUSE:     bram_data_addr <= end_addr;
			default:   bram_data_addr <= start_addr;
		endcase
	end
end

assign perceptron_enable = (state == ACTIVATE);

wire [16*N-1:0] x,w;

assign x[16*N-1:16*(N-1)] = bram_data_in[15:0];
assign w[16*N-1:16*(N-1)] = bram_data_in[31:16];


localparam ONE = 16'b1;

generate
	genvar i;
	for (i = N-1; i > 0; i=i-1) 
	begin:input_pipeline

		dffre #(16) x_shift_register(
			.clk(clk),
			.r(rst),
			.en(state==LOAD_DATA),
			.d( x[16*(i+1)-1:16*i] ),
			.q( x[16*i-1:16*(i-1)] )
		);

		dffre #(16) w_shift_register(
			.clk(clk),
			.r(rst),
			.en(state==LOAD_DATA),
			.d( w[16*(i+1)-1:16*i] ),
			.q( w[16*i-1:16*(i-1)] )
		);

	end
endgenerate

perceptron #(N) perceptron(
	.clk(clk),
	.enable(perceptron_enable),
	.x({N{16'b1}}), 
	.w({N{16'd2}}),
	.y(perceptron_out),
	.fire(fire)
);

endmodule