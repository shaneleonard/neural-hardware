`timescale 1ns / 1ps
`include "uart_tx6.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Shane Leonard 
// 
// Create Date:    22:05:18 05/04/2014 
// Design Name: 
// Module Name:    uart_write_to_ram_top 
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

module demo_top(
    input CLK,
    input [7:0] SWITCH, // soft reset
    output [7:0] LED,
    input RX, 
    output TX
);

//////////////////////////////////////////////////////////////////////////////////
//                              Top-Level MCU                                   //
//////////////////////////////////////////////////////////////////////////////////

wire         clk_96Mhz;
wire [ 7:0]  rx_data;
wire         rx_data_present,      rx_command_read;
wire [ 8:0]  write_addr,           read_addr;
wire         write_to_bram_enable, write_to_uart_enable;
wire         write_complete,       send_complete;
wire [ 3:0]  bytes_to_write,       bytes_to_read;

wire perceptron_enable, perceptron_fire;
wire [31:0] perceptron_bram_dout;
wire [8:0]  perceptron_bram_addr;
wire [15:0] perceptron_out;

wire [31:0] bram_data_out;
wire [8:0] bram_data_addr;


uart_ram_mcu simple_mcu (
    .clk ( clk_96Mhz ),
    .rst ( SWITCH[0] ),

    // UART RX interface
    .uart_data_present ( rx_data_present ),
    .uart_data_in      ( rx_data         ),
    .uart_data_read    ( rx_command_read ),

    // Serial to BRAM interface
    .write_to_bram       ( write_to_bram_enable ),
    .bram_write_complete ( write_complete       ),
    .bram_write_addr     ( write_addr           ),
    .bytes_to_write      ( bytes_to_write       ),

    // BRAM to Serial interface
    .send_over_uart     ( write_to_uart_enable ),
    .uart_send_complete ( send_complete        ),
    .bram_read_addr     ( read_addr            ),
    .bytes_to_read      ( bytes_to_read        ),
    
	// Perceptron interface
	.perceptron_enable ( perceptron_enable ),
	.perceptron_fire   ( perceptron_fire   ),
	
    // Misc output
    .switches( SWITCH ),
    .state( LED )
);

perceptron_controller #(8) perceptron(
	.clk            ( clk_96Mhz ),
	.rst            ( SWITCH[0] ),
	.enable         ( perceptron_enable ), 
    .bram_data      ( bram_data_out   ),
    .bram_data_addr ( bram_data_addr  ),
    .output_addr    ( perceptron_bram_addr ),
	.perceptron_out ( perceptron_out  ),
	.fire           ( perceptron_fire )
);

//////////////////////////////////////////////////////////////////////////////////
//                             Clock Management                                 //
//////////////////////////////////////////////////////////////////////////////////

reg clk_48Mhz;

dcm32to96mhz clock_manager (
    // Clock in ports
    .CLK_IN1(CLK), // 32 MHz, 50% duty cycle

    // Clock out ports
    .CLK_OUT1(clk_96Mhz) // 96 MHz, 50% duty cycle
);

always @(posedge clk_96Mhz) begin
    clk_48Mhz = ~clk_48Mhz;
end

//////////////////////////////////////////////////////////////////////////////////
//                        Serial Data to Block Memory                           //
//////////////////////////////////////////////////////////////////////////////////

wire        rx_data_read;
wire [31:0] bram_data_in;
wire [ 8:0] bram_write_addr;
wire        bram_write_enable;
wire [ 3:0] bram_write_enable_bytes;

serial_data_to_bram rx_to_ram (
    .clk ( clk_96Mhz  ), 
    .rst ( SWITCH[0]  ),

    // Controller interface
    .enable         ( write_to_bram_enable ),
    .write_addr     ( write_addr           ),
    .bytes_to_write ( bytes_to_write       ),
    .write_complete ( write_complete       ), //output

    // UART RX interface
    .uart_data_in      ( rx_data         ),
    .uart_data_present ( rx_data_present ),
    .uart_data_read    ( rx_data_read    ), //output

    // BRAM write interface
    .bram_data               ( bram_data_in            ), // output
    .bram_write_enable       ( bram_write_enable       ), // output
    .bram_write_addr         ( bram_write_addr         ), // output
    .bram_write_enable_bytes ( bram_write_enable_bytes )  // output
);

//////////////////////////////////////////////////////////////////////////////////
//                         Block Memory to Serial Data                          //
//////////////////////////////////////////////////////////////////////////////////

wire [ 7:0] tx_data; 
wire        tx_data_write;
wire        tx_buffer_full;
wire [ 8:0] bram_read_addr;

bram_data_to_serial ram_to_tx (
    .clk( clk_96Mhz  ),
    .rst( SWITCH[0]  ),

    // Controller interface
    .enable        ( write_to_uart_enable ),
    .read_addr     ( read_addr            ),
    .bytes_to_read ( bytes_to_read        ),
    .send_complete ( send_complete        ), // output

    // UART TX Interface
    .uart_buffer_full ( tx_buffer_full ),
    .uart_data_out    ( tx_data        ), // output
    .uart_data_write  ( tx_data_write  ), // output

    // BRAM Read Interface
    .bram_data_in     ( bram_data_out    ),
    .bram_read_enable ( bram_read_enable ), 
    .bram_read_addr   ( bram_read_addr   )  // output
);

//////////////////////////////////////////////////////////////////////////////////
//                                Block Memory                                  //
//////////////////////////////////////////////////////////////////////////////////

wire [3:0] bram_enable_bytes;
wire       bram_enable;

assign bram_data_addr    = bram_write_enable ? bram_write_addr : bram_read_addr;
assign bram_enable_bytes = bram_read_enable  ? 4'b0000 : bram_write_enable_bytes;
assign bram_enable       = bram_write_enable | bram_read_enable;

ram ram (
     // UART interface
     .clka  ( clk_96Mhz         ), // input clka
     .ena   ( bram_enable       ), // input ena
     .wea   ( bram_enable_bytes ), // input [ 3 : 0] wea
     .addra ( bram_data_addr    ), // input [ 8 : 0] addra
     .dina  ( bram_data_in      ), // input [31 : 0] dina
     .douta ( bram_data_out     ),

      // Perceptron interface
     .clkb  ( clk_96Mhz       ),          // input clkb
     .enb   ( perceptron_fire ),
     .web   ( 4'b0011         ),
     .addrb ( perceptron_bram_addr     ), // input  [ 8 : 0] addrb
     .dinb  ( {16'b0, perceptron_out } ),
     .doutb ( perceptron_bram_dout     )  // output [31 : 0] doutb
);

//////////////////////////////////////////////////////////////////////////////////
//                         Serial Communication (RX/TX)                         //
//////////////////////////////////////////////////////////////////////////////////

uart_rx6 rx (
    .serial_in           ( RX ),
    .en_16_x_baud        ( clk_48Mhz    ),
    .data_out            ( rx_data      ),
    .buffer_read         ( rx_command_read | rx_data_read ),
    .buffer_data_present ( rx_data_present ),
    .buffer_reset        ( SWITCH[0]       ),
    .clk                 ( clk_96Mhz       ) 
);

uart_tx6 tx (
    .serial_out   ( TX ),
    .en_16_x_baud ( clk_48Mhz      ),
    .data_in      ( tx_data        ),
    .buffer_write ( tx_data_write  ),
    .buffer_full  ( tx_buffer_full ),
    .buffer_reset ( SWITCH[0]      ),
    .clk          ( clk_96Mhz      )
);

endmodule
