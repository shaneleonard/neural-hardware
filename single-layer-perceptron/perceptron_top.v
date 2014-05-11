`timescale 1ns / 1ps
`include "uart_tx6.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:20 04/28/2014 
// Design Name: 
// Module Name:    perceptron_top 
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
module perceptron_top(
	input CLK,
	input RX,
	output TX
);

parameter N = 8; // number of input pairs to the weighted sum module

////////////////////////
// Configure the UART //
////////////////////////
wire [7:0] din, dout;
reg en_16_x_baud = 0;
wire rx_data_present, tx_data_present;
wire baud_clk;

dcm32to96mhz baud_clk_generator
(    // Clock in ports
    .CLK_IN1(CLK),      // IN
    // Clock out ports
    .CLK_OUT1(baud_clk)
);  // OUT

reg baud_count = 0;

always @(posedge baud_clk) begin
	if (~baud_count) begin
		en_16_x_baud <= 1;
	end else begin
		en_16_x_baud <= 0;
	end
	baud_count <= baud_count + 1;
end

uart_rx6 uart_rx6 (
	.serial_in(RX),
	.en_16_x_baud(en_16_x_baud),
	.data_out(din),
	.buffer_read(1),
	.buffer_data_present(rx_data_present),
    //.buffer_half_full(),
    //.buffer_full(),
    .buffer_reset(0),
    .clk(baud_clk)
);

uart_tx6 uart_tx6 (
    .data_in(dout),
    .buffer_write(tx_data_present),
    .buffer_reset(0),
    .en_16_x_baud(en_16_x_baud),
    .serial_out(TX),
    //.buffer_data_present(),
    //.buffer_half_full(),
    //.buffer_full(),
    .clk(baud_clk) 
);

parameter M = 8;

wire [M-1:0] sum = {M{1'b1}};

send_binary_as_ascii #(M) bin_to_char(
    .en_16_x_baud(en_16_x_baud),
    .send(rx_data_present),
    .binary_in(sum),
    .ascii_out(dout),
    .data_present(tx_data_present)
);

// wire [17:0] x_val = 18'd10;
// wire [17:0] w_val = 18'd2;

// wire [18*N-1:0] x = {N*{x_val}};
// wire [18*N-1:0] w = {N*{w_val}};

// weighted_sum_top #(N) weighted_sum(
// 	.clk(baud_clk),
// 	.x(x), 
// 	.w(w),
// 	.sum(sum)
// );

endmodule
