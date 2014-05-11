`timescale 1ns / 1ps
`define ASCII_ZERO 8'd48
`define ASCII_ONE  8'd49
`define ASCII_NEWLINE 8'd10
`define ASCII_CAR_RET 8'd13
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:58 04/28/2014 
// Design Name: 
// Module Name:    send_binary_as_ascii 
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
module send_binary_as_ascii(
    input en_16_x_baud,
    input send,
    input [N-1:0] binary_in,
    output reg [7:0] ascii_out,
    output data_present
);

parameter N = 48; // size of input

reg [N-1 : 0] shifted_binary = 0;
reg [N+1 : 0] counter = 0;

always @(posedge en_16_x_baud) begin
	if (send) begin
		shifted_binary <= binary_in;
		counter <= 1;
	end else if (!counter) begin
		shifted_binary <= 0;
		counter <= 0;
	end else begin
		shifted_binary <= shifted_binary << 1;
		counter <= counter << 1;
	end
end

assign data_present = (counter) ? en_16_x_baud : 0;

always @(*) begin
	if (counter[N+1]) begin 
		ascii_out = `ASCII_NEWLINE;
	end else if (counter[N]) begin
		ascii_out = `ASCII_CAR_RET;
	end else begin
		ascii_out = shifted_binary[N - 1] ? `ASCII_ONE : `ASCII_ZERO;
	end
end

endmodule