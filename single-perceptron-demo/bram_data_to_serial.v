`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:00 05/05/2014 
// Design Name: 
// Module Name:    bram_data_to_serial 
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

module bram_data_to_serial(
    input  clk, rst,

    // Controller interface
    input         enable,
    input  [ 8:0] read_addr,
    input  [ 3:0] bytes_to_read,
    output        send_complete,

    // UART TX interface
    input         uart_buffer_full,
    output reg [ 7:0] uart_data_out,
    output        uart_data_write,

    // BRAM interface
    input  [31:0] bram_data_in,
    output        bram_read_enable,
    output [ 8:0] bram_read_addr
);

//////////////////////////////////////////////////////////////////////////////
//                             Wire Declarations                            //
//////////////////////////////////////////////////////////////////////////////

reg  [5:0] state;
wire       start_state;
reg  [3:0] byte_to_send, bytes_arbited, bytes_sent_so_far; 
wire [3:0] bytes_to_send_latched;

// One-hot FSM states
localparam START    = 6'b100000;
localparam LATCH    = 6'b010000;
localparam WAIT     = 6'b001000;
localparam SEND     = 6'b000100;
localparam UPDATE   = 6'b000010;
localparam COMPLETE = 6'b000001;

//////////////////////////////////////////////////////////////////////////////
//                               Control FSM                                //
//////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
    if (rst) begin
        state <= START;
    end else begin
        case (state)
            START:     state <= enable ? LATCH : START;
            LATCH:     state <= WAIT; 
            WAIT:      state <= !uart_buffer_full ? SEND : WAIT;
            SEND:      state <= UPDATE;
            UPDATE:    state <= (bytes_sent_so_far == bytes_to_send_latched) ? COMPLETE : LATCH;
            COMPLETE:  state <= START;
            default:   state <= START;
        endcase
    end
end

assign start_state     = (state == START);
assign uart_data_write = (state == SEND);
assign send_complete   = (state == COMPLETE);
assign bram_read_enable = (state == WAIT);

//////////////////////////////////////////////////////////////////////////////
//          Latch the RAM read address and select the data to send          //
//////////////////////////////////////////////////////////////////////////////

dffre #(13) address_register (
    .d   ( { read_addr,      bytes_to_read         } ),
    .q   ( { bram_read_addr, bytes_to_send_latched } ),
    .en  ( enable & start_state ),
    .r   ( rst ),
	.clk ( clk )
);

always @(*) begin
    case (byte_to_send)
        4'b1000: uart_data_out = bram_data_in[31:24];
        4'b0100: uart_data_out = bram_data_in[23:16];
        4'b0010: uart_data_out = bram_data_in[15: 8];
        4'b0001: uart_data_out = bram_data_in[ 7: 0];
        default: uart_data_out = 8'b0;
    endcase
end

//////////////////////////////////////////////////////////////////////////////
//                  Logic for selecting the bytes to write                  // 
//////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
    if (rst) begin
        byte_to_send <= 4'b0;
    end else begin
        case (state)
            START:   byte_to_send <= 4'b0;
            LATCH,
            UPDATE:  byte_to_send <= bytes_arbited;
            default: byte_to_send <= byte_to_send;
        endcase
    end
end

always @(posedge clk) begin
    if (rst) begin
        bytes_sent_so_far <= 4'b0;
    end else begin
        case (state)
            START:   bytes_sent_so_far <= 4'b0;
            SEND:    bytes_sent_so_far <= byte_to_send | bytes_sent_so_far;
            default: bytes_sent_so_far <= bytes_sent_so_far; 
        endcase
    end
end

always @(*) begin
    casex (bytes_to_send_latched ^ bytes_sent_so_far)
        4'b1xxx: bytes_arbited = 4'b1000;
        4'b01xx: bytes_arbited = 4'b0100;
        4'b001x: bytes_arbited = 4'b0010;
        4'b0001: bytes_arbited = 4'b0001;
        default: bytes_arbited = 4'b0000; 
    endcase
end

endmodule