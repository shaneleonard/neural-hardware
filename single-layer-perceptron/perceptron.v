`timescale 1ns / 1ps
`define SUM_LATENCY 3
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
    input  clk,
    input  rst,
    input  [18*N-1 : 0] x,         // perceptron input signals
    input  train,                  // high when the current input should be used for training
    input  [17 : 0] learning_rate, // fixed-point number representing the learning rate
    input  [47 : 0] expected_y,    // expected perceptron output; used for training
    output [47 : 0] y              // perceptron output
);

parameter N = 8;   // number of inputs

wire [18*N-1 : 0] weights; // each of the N elements is a signed number
wire signed [47 : 0] weighted_sum_out;
weighted_sum #(N) weighted_sum_top(
    // inputs
    .clk(clk),
    .x(x),
    .w(weights),
    // output
    .sum(weighted_sum_out)
);

wire delayed_train;
wire [18  : 0] delayed_learning_rate, delayed_exp_y;
wire [N-1 : 0] delayed_x;

fifo #(
    .WIDTH(1 + 18 + 18 + 18*N), 
    .DEPTH(`SUM_LATENCY + N)) 
weights_manager_fifo(
    .clk ( clk ),
    .in  ( {train,         learning_rate,         expected_y,    x        }),
    .out ( {delayed_train, delayed_learning_rate, delayed_exp_y, delayed_x})
);

// The weights module maintains the bias and the weights that are applied to
// the perceptron inputs. It trains them according to the learning rule.
wire signed [18 : 0] bias;
weights #(N) weights_manager(
    // inputs
    .clk           ( clk ),
    .rst           ( rst ),
    .train         ( delayed_train         ),
    .x             ( delayed_x             ),
    .expected_y    ( delayed_exp_y         ),
    .learning_rate ( delayed_learning_rate ),
    .y             ( y ),
    // outputs
    .weights ( weights ),
    .bias    ( bias    )
);

// The activation function applies a sigmoid-like squashing function to the 
// weighted sum of the inputs.
wire signed [47 : 0] net;
assign net = weighted_sum_out + bias;
activation_function threshold(
    .x ( net ),   // input
    .y ( y   )    // output
);

endmodule