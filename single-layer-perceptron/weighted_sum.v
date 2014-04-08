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

reg [N*N-1:0] x_pipeline;

generate
    genvar i;
    for (i = 0; i < N - 1; i = i + 1)
    begin:pipeline

        always @(posedge clk) begin
           x_pipeline[N*(i+2)-1:N*(i+1)] <= x_pipeline[N*(i+1)-1:N*i];
        end

    end
endgenerate

generate
  genvar i;
  for (i = 1; i < N; i = i + 1)
  begin:weighted_sum
  
    wire [31:0] summation_term = x_pipeline[i+N*i] ? w[32*(i+1)-1:32*i] : 32'b0;
    dffr #(32) running_sum_register(
        .d(intermediate_sums[32*i-1:32*(i-1)] + summation_term),
        .q(intermediate_sums[32*(i+1)-1:32*i]),
        .clk(clk),
        .r(rst)
    );
  
  end
endgenerate

assign sum = intermediate_sums[32*N-1:32*(N-1)];

endmodule