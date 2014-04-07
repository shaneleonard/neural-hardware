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
    input [N-1:0] x,
    input [32*N-1:0] w,
    output [31:0] sum
);

parameter N = 8;

// [TODO] Improve this implementation: right now it takes N cycles to compute
// the sum (one possibility: replace with an O(log(n)) tree)
// [TODO] Account for overflow
wire [32*N-1:0] intermediate_sums;

always @(posedge clk) begin
  intermediate_sums[31:0] <= w[31:0];
end

generate
  genvar i;
  for (i = 1; i < N; i = i + 1)
  begin:weighted_sum
    always @(posedge clk) begin
      intermediate_sums[32*(i+1)-1:32*i] <= intermediate_sums[32*i-1:32*(i-1)] 
                                            + w[32*(i+1)-1:32*i];
    end
  end
endgenerate

assign sum = intermediate_sums[32*N-1:32*(N-1)];

endmodule