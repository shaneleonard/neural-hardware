`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Shane Leonard 
// 
// Create Date:    00:37:41 05/05/2014 
// Design Name: 
// Module Name:    serial_data_to_bram 
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

module serial_data_to_bram(
    input  clk, rst,

    // Controller interface
    input  enable,
    input  [ 8:0] write_addr,
    input  [ 3:0] bytes_to_write,
    output        write_complete,
    
    // UART RX interface
    input  [ 7:0] uart_data_in,
    input         uart_data_present,
    output        uart_data_read,

    // BRAM interface
    output [31:0] bram_data,
    output        bram_write_enable,
    output [ 8:0] bram_write_addr,
    output reg [ 3:0] bram_write_enable_bytes
);

//////////////////////////////////////////////////////////////////////////////
//                             Wire Declarations                            //
//////////////////////////////////////////////////////////////////////////////

reg  [5:0] state;
wire       start_state;
reg  [3:0] bytes_arbited, bytes_written_so_far;
wire [3:0] bytes_to_write_latched;
wire [7:0] bram_data_partial;

// One-hot FSM states
localparam START    = 6'b100000;
localparam LATCH    = 6'b010000;
localparam WAIT     = 6'b001000;
localparam WRITE    = 6'b000100;
localparam UPDATE   = 6'b000010;
localparam COMPLETE = 6'b000001;

//////////////////////////////////////////////////////////////////////////////
//                                Control FSM                               //
//////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
    if (rst) begin
        state <= START;
    end else begin
        case (state)
            START:     state <= enable ? LATCH : START;
    		LATCH:     state <= WAIT; 
            WAIT:      state <= uart_data_present ? WRITE : WAIT;
            WRITE:     state <= UPDATE;
            UPDATE:    state <= (bytes_written_so_far == bytes_to_write_latched) ? COMPLETE : LATCH;
            COMPLETE:  state <= START;
            default:   state <= START;
        endcase
    end
end

assign start_state       = (state == START);
assign uart_data_read    = (state == WRITE);
assign bram_write_enable = (state == WRITE);
assign write_complete    = (state == COMPLETE);

//////////////////////////////////////////////////////////////////////////////
//                   Latch the RAM data and write address                   // 
//////////////////////////////////////////////////////////////////////////////

dffre #(13) address_register(
    .d   ( { write_addr,      bytes_to_write         } ),
    .q   ( { bram_write_addr, bytes_to_write_latched } ),
    .en  ( enable & start_state ),
    .clk ( clk ),
    .r ( rst )
);

dffre #(8) data_register(
    .d   ( uart_data_in      ),
    .q   ( bram_data_partial ),
    .en  ( uart_data_present ),
    .clk ( clk ),
    .r ( rst )
);

assign bram_data = {4{bram_data_partial}};

//////////////////////////////////////////////////////////////////////////////
//                  Logic for selecting the bytes to write                  // 
//////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
    if (rst) begin
        bram_write_enable_bytes <= 4'b0;
    end else begin
        case (state)
            START:   bram_write_enable_bytes <= 4'b0;
            LATCH,
            UPDATE:  bram_write_enable_bytes <= bytes_arbited;
            default: bram_write_enable_bytes <= bram_write_enable_bytes;
        endcase
    end
end

always @(posedge clk) begin
    if (rst) begin
        bytes_written_so_far <= 4'b0;
    end else begin
        case (state)
            START:   bytes_written_so_far <= 4'b0;
            WRITE:   bytes_written_so_far <= bram_write_enable_bytes | bytes_written_so_far;
            default: bytes_written_so_far <= bytes_written_so_far; 
        endcase
    end
end

always @(*) begin
    casex (bytes_to_write_latched ^ bytes_written_so_far)
        4'b1xxx: bytes_arbited = 4'b1000;
        4'b01xx: bytes_arbited = 4'b0100;
        4'b001x: bytes_arbited = 4'b0010;
        4'b0001: bytes_arbited = 4'b0001;
        default: bytes_arbited = 4'b0000; 
    endcase
end

endmodule