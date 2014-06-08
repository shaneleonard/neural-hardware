`timescale 1ns / 1ps
`define SUM_LATENCY 3
`define THRESHOLD_LATENCY 1 
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
    input enable,
    input [16*N-1:0] x, w,
    output [15:0] y,
    output fire
);

parameter N = 8; // number of inputs

wire [47:0] sum;
weighted_sum_top #(N) weighted_sum(
    .clk(clk),
    .x(x),
    .w(w),
    .sum(sum)
);

activation_function threshold(
    .clk(clk),
    .x(sum),
    .y(y)
);

reg [N + `SUM_LATENCY + `THRESHOLD_LATENCY - 1:0] count;

always @(posedge clk) begin
    if (enable) begin
        count <= 1;
    end else begin
        count <= count << 1;
    end
end

assign fire = count[N + `SUM_LATENCY + `THRESHOLD_LATENCY - 1];

endmodule
