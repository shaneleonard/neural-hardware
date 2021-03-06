`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:54:37 04/03/2014 
// Design Name: 
// Module Name:    activation_function 
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
module activation_function(
    input      signed [47 : 0] x,
    output reg signed [47 : 0] y
);
// [TODO] determine whether it is useful or necessary to use 48 bits for y, since
// y will always be <= `ONE

// [TODO] refine this representation
`define ONE 48'h000001000000 /* 24.24 fixed point representation of 1.0 */

// Approximates a sigmoid function
//         / 0, x < 0
// f(x) = {  x, 0 <= x <= 1
//         \ 1, x > 1
always @(*) begin
	if (x[47]) // x < 0
		y = 47'b0;
	else if (x > `ONE)
		y = `ONE;
	else 
		y = x;
end

endmodule