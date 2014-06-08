`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:19 05/10/2014 
// Design Name: 
// Module Name:    uart_ram_mcu 
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

module uart_ram_mcu(
    input clk, rst,

    // UART RX interface
    input uart_data_present,
    input [7:0] uart_data_in,
    output uart_data_read,

    // Serial to BRAM interface
    input bram_write_complete,
    output write_to_bram,
    output [3:0] bytes_to_write,
    output reg [ 8:0] bram_write_addr,

    // BRAM to Serial interface
    input uart_send_complete,
    output send_over_uart,
    output [3:0] bytes_to_read,
    output reg [ 8:0] bram_read_addr,

	// Perceptron interface
	input  perceptron_fire,
	output perceptron_enable,

    // Misc output
    output reg [7:0] state,
    input [7:0] switches
);

//////////////////////////////////////////////////////////////////////////////////
//                             Wire Declarations                                //
//////////////////////////////////////////////////////////////////////////////////

localparam START    = 8'b10000000;
localparam PAUSE    = 8'b01000000;
localparam CMD      = 8'b00100000;
localparam WRITE    = 8'b00010000;
localparam READ     = 8'b00001000;
localparam FIRE     = 8'b00000100;
localparam WAIT     = 8'b00000110;
localparam ADDRESS  = 8'b00000010;
localparam ENABLE   = 8'b00000001;
localparam PAUSE2   = 8'b00000000;

localparam READ_BRAM = 8'd114; // ASCII 'r'
localparam WRITE_BRAM = 8'h77; // ASCII 'w'
localparam FIRE_PERCEPTRON = 8'h70; // ASCII 'p'

reg [1:0] control_path;
wire process_complete;
wire read_path, write_path;

//////////////////////////////////////////////////////////////////////////////////
//                                Control FSM                                   //
//////////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
    if (rst) begin
        state <= START;
    end else begin
        case (state)
            START:       state <= uart_data_present ? PAUSE : START;
            PAUSE:       state <= CMD;
            CMD:         
                if (uart_data_in == READ_BRAM) begin
                    state <= READ;
                end else if (uart_data_in == WRITE_BRAM) begin
                    state <= WRITE;
				end else if (uart_data_in == FIRE_PERCEPTRON) begin
					state <= FIRE;
                end else begin
                    state <= START;
                end
            WRITE,READ:  state <= WAIT;
			FIRE:        state <= PAUSE2;
            WAIT:        state <= uart_data_present ? ADDRESS : WAIT;
            ADDRESS:     state <= ENABLE;
            ENABLE:      state <= PAUSE2;
            PAUSE2:      state <= process_complete ? START : PAUSE2;
            default:     state <= START;
        endcase
    end
end

assign process_complete = bram_write_complete | uart_send_complete | perceptron_fire;

assign write_to_bram  = (state == ENABLE) & write_path;
assign send_over_uart = (state == ENABLE) & read_path;
assign perceptron_enable = (state == FIRE);
assign uart_data_read = (state == CMD) | (state == ADDRESS);

//////////////////////////////////////////////////////////////////////////////////
//                  Logic for tracking the current FSM path                     //
//////////////////////////////////////////////////////////////////////////////////

// control_path tracks whether the FSM is in a write mode or a read mode
always @(posedge clk) begin
    if (rst) begin
        control_path <= 2'b00;
    end else begin
        case (state)
            START:   control_path <= 2'b00;
            WRITE:   control_path <= 2'b10;
            READ:    control_path <= 2'b01;
            default: control_path <= control_path;
        endcase
    end
end
assign read_path = control_path[0];
assign write_path = control_path[1];

//////////////////////////////////////////////////////////////////////////////////
//            Record the read/write address from the input stream               //
//////////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
    if (rst) begin
        bram_write_addr <= 14'b0;
        bram_read_addr  <= 14'b0;
    end else if (state == ADDRESS) begin
        bram_write_addr <= {6'b0, uart_data_in};
        bram_read_addr  <= {6'b0, uart_data_in};
    end else begin
        bram_write_addr <= bram_write_addr;
        bram_read_addr  <= bram_read_addr;
    end
end

//////////////////////////////////////////////////////////////////////////////////
//                 Logic for selecting the bytes to enable                      //
//////////////////////////////////////////////////////////////////////////////////

assign bytes_to_write = switches[7:4];
assign bytes_to_read  = switches[7:4];

endmodule
