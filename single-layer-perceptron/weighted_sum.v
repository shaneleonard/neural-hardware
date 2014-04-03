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

// stub
assign sum = w[31:0];

endmodule
