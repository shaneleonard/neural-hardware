`timescale 1ns / 1ps
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

always @(posedge baud_clk) begin
	en_16_x_baud = ~en_16_x_baud; // halve the 96 MHz clock to 48 MHz
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

wire [7:0] binary = din;

send_binary_as_ascii #(8) bin_to_char(
    .en_16_x_baud(en_16_x_baud),
    .send(rx_data_present),
    .binary_in(binary),
    .ascii_out(dout),
    .data_present(tx_data_present)
);

endmodule
