`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:48 04/02/2014 
// Design Name: 
// Module Name:    perceptron 
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
module perceptron(
    input clk,
    input rst,
    input x[N-1:1], // perceptron input signals
    input train,    // high when the current input should be used for training
    input learning_rate[31:0], // fixed-point number representing the learning rate
    input expected_y[31:0], // expected perceptron output; used for training
    output y[31:0] // perceptron output
);

parameter N = 8;

wire [32*N - 1:0] weights;
wire delayed_train;
wire [31:0] delayed_learning_rate, delayed_exp_y;
wire [N-1:0] delayed_x;

weighted_sum #(N) weighted_sum(
    .x(x),
    .w(weights),
    .sum(weighted_sum_out)
);

weights #(N) weights_manager(
    .clk(clk),
    .rst(rst),
    .train(delayed_train),
    .x(delayed_x),
    .expected_y(delayed_exp_y),
    .learning_rate(delayed_learning_rate),
    .y(y),
    .weights(weights),
    .bias(bias)
);

activation_function threshold(
    .x(net),
    .y(y)
);

assign net = weighted_sum_out + bias;

endmodule
