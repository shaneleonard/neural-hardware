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
    input [N-1:1] x, // perceptron input signals
    input train,    // high when the current input should be used for training
    input [31:0] learning_rate, // fixed-point number representing the learning rate
    input [31:0] expected_y, // expected perceptron output; used for training
    output [31:0] y // perceptron output
);

parameter N = 8;

wire [32*N - 1:0] weights; // each of the N elements is a signed 32-bit number
wire signed [31:0] weighted_sum_out;
weighted_sum #(N) weighted_sum(
    // inputs
    .x(x),
    .w(weights),
    // output
    .sum(weighted_sum_out)
);

///////////////////////////////////////////////////////////////////////////////
// This pipeline delays the inputs by M clock cycles so that they are        //
// synchronized with the output signal (before being fed into the weights    //
// module)                                                                   //
///////////////////////////////////////////////////////////////////////////////
localparam M = 4; // Number of pipeline stages

wire delayed_train;
wire [31:0] delayed_learning_rate, delayed_exp_y;
wire [N-1:0] delayed_x;

wire [(65 + N) * M - 1:0] pipeline; // 65 + N is the width of all the
                                    // delayed signals combined

`define PIPELINE(i) (pipeline[(65 + N)*((i) + 1) - 1:(65 + N)*(i)])

generate
    genvar i;
    for (i = 0; i < M - 1; i = i + 1)
    begin:pipeline_stage
        always @(posedge clk) begin
            `PIPELINE(i + 1) <= `PIPELINE(i);
        end
    end
endgenerate

assign `PIPELINE(0) = {train, learning_rate, expected_y, x};
assign {delayed_train, delayed_learning_rate, delayed_exp_y, delayed_x} = `PIPELINE(M-1); 

///////////////////////////////////////////////////////////////////////////////

// The weights module maintains the bias and the weights that are applied to
// the perceptron inputs. It trains them according to the learning rule.
wire signed [31:0] bias;
weights #(N) weights_manager(
    // inputs
    .clk(clk),
    .rst(rst),
    .train(delayed_train),
    .x(delayed_x),
    .expected_y(delayed_exp_y),
    .learning_rate(delayed_learning_rate),
    .y(y),
    // outputs
    .weights(weights),
    .bias(bias)
);

// The activation function applies a sigmoid-like squashing function to the 
// weighted sum of the inputs.
wire signed [31:0] net;
assign net = weighted_sum_out + bias;
activation_function threshold(
    .x(net), // input
    .y(y)    // output
);

endmodule
