`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:12 04/02/2014 
// Design Name: 
// Module Name:    weighted_sum 
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
module weighted_sum(
    input clk,
    input rst,
    input [N-1:0] x,
    input [32*N-1:0] w,
    output [31:0] sum
);

parameter N = 8;

// [TODO] Improve this implementation: right now it takes N cycles to compute
// the sum (one possibility: replace with an O(log(n)) tree)
// [TODO] Account for overflow
wire [32*N-1:0] intermediate_sums;

wire [31:0] initial_term = x[0] ? w[31:0] : 32'b0;
dffr #(32) initial_sum_register(
    .d(initial_term),
    .q(intermediate_sums[31:0]),
    .clk(clk),
    .r(rst)
);

localparam M = N; // number of required pipeline stages

wire [M*N-1:0] x_pipeline;

assign x_pipeline[N-1:0] = x;

generate
    genvar i;
    for (i = 0; i < M - 1; i = i + 1)
    begin:pipeline

        dffr #(N) x_pipeline_stage(
            .d(x_pipeline[N*(i+1)-1:N*i]),
            .q(x_pipeline[N*(i+2)-1:N*(i+1)]),
            .clk(clk),
            .r(rst)
        );

    end
endgenerate

generate
  genvar j;
  for (j = 1; j < N; j = j + 1)
  begin:weighted_sum
  
    wire [31:0] summation_term = x_pipeline[j+N*j] ? w[32*(j+1)-1:32*j] : 32'b0;
    dffr #(32) running_sum_register(
        .d(intermediate_sums[32*j-1:32*(j-1)] + summation_term),
        .q(intermediate_sums[32*(j+1)-1:32*j]),
        .clk(clk),
        .r(rst)
    );
  
  end
endgenerate

assign sum = intermediate_sums[32*N-1:32*(N-1)];

endmodule
