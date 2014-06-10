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
    input clk,
    input      signed [47 : 0] x,
    output reg signed [15 : 0] y
);

localparam ONESHIFT = 14;
localparam ONE = 48'b1 << ONESHIFT;
localparam NEG_ONE = -ONE;

always @(posedge clk) begin
	if ($signed(x) > $signed(ONE)) begin
		y <= 16'h4000;
	end else if ($signed(x) < $signed(NEG_ONE)) begin
		y <= 16'hc000;
	end else begin
		y <= x[ONESHIFT + 1:ONESHIFT - 14];
	end
end

endmodule