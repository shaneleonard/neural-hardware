`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:03:34 05/10/2014
// Design Name:   uart_write_to_ram_top
// Module Name:   /afs/ir.stanford.edu/users/s/h/shanel/research/sandbox/uart_write_to_ram/uart_write_to_ram_top_tb.v
// Project Name:  uart_write_to_ram
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart_write_to_ram_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_write_to_ram_top_tb;

	// Inputs
	reg CLK;
	reg JOY_SELECT;
	reg RX;
	reg TX;
	reg write_to_bram_enable;
	reg write_to_uart_enable;
	reg [31:0] write_addr;
	reg [3:0] bytes_to_write;

	// Outputs
    wire write_complete;
	wire send_complete;

	// Instantiate the Unit Under Test (UUT)
	uart_write_to_ram_top uut (
		.CLK(CLK), 
		.JOY_SELECT(JOY_SELECT), 
		.RX(RX), 
		.TX(TX), 
		.write_to_bram_enable(write_to_bram_enable), 
		.write_to_uart_enable(write_to_uart_enable), 
		.write_addr(write_addr), 
		.bytes_to_write(bytes_to_write), 
		.send_complete(send_complete),
		.write_complete(write_complete)
	);

    initial begin
        CLK = 1;
        forever #3 CLK = ~CLK;
    end

	initial begin
		// Initialize Inputs
		JOY_SELECT = 1;
		RX = 0;
		TX = 0;
		write_to_bram_enable = 0;
		write_to_uart_enable = 0;
		write_addr = 1;
		bytes_to_write = 4'b1010;

		// Wait 100 ns for global reset to finish
		#300;
        JOY_SELECT = 0;
        #180;

		// Add stimulus here
        write_to_uart_enable = 1;
        #2 write_to_uart_enable = 0;
        #12000;        
        $finish;
	end
      
endmodule

