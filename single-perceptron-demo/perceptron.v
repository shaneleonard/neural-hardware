`timescale 1ns / 1ps
`define SUM_LATENCY 3
`define THRESHOLD_LATENCY 4
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:58 06/06/2014 
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
    input enable,
    input [16*N-1:0] x, w,
    output [15:0] y,
    output fire
);

parameter N = 8; // number of inputs

wire [16*N-1:0] x_latched, w_latched;

dffre #(16*N*2) input_register(
    .clk( clk  ),
    .r  ( rst ),
    .en ( enable ),
    .d  ( {x, w} ),
    .q  ( {x_latched, w_latched} )
);

wire [47:0] sum;
weighted_sum_top #(N) weighted_sum(
    .clk(clk),
    .x(x_latched),
    .w(w_latched),
    .sum(sum)
);

activation_function threshold(
    .clk(clk),
    .x(sum),
    .y(y)
);

reg [N + `SUM_LATENCY + `THRESHOLD_LATENCY - 1:0] count;

always @(posedge clk) begin
    if (rst) begin
        count <= 0;
    end else if (enable) begin
        count <= 1;
    end else begin
        count <= count << 1;
    end
end

assign fire = count[N + `SUM_LATENCY + `THRESHOLD_LATENCY - 1];

endmodule