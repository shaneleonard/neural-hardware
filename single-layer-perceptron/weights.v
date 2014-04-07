`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:09 04/06/2014 
// Design Name: 
// Module Name:    weights 
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
module weights(
    input clk,
    input rst,
    input train,
    input [N-1:0] x,
    input [31:0] expected_y,
    input [31:0] learning_rate,
    input [31:0] y,
    output [32*N-1:0] weights,
    output [31:0] bias
);

parameter N = 8;

wire [31:0] delta = desired_output - output;
wire [31:0] adjustment = delta * learning_rate;


wire [31:0] bias_next = bias + adjustment;
dffre #(32) bias_register(
    .d(bias_next),
    .q(bias),
    .en(train),
    .reset(rst)
);

generate
  genvar i;
  for (i = 0; i < N; i = i + 1)
  begin:weights_manager
    dffre #(32) weight_register(
      
    );
  end
endgenerate

endmodule