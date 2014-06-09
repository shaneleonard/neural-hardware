`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:47 06/08/2014
// Design Name:   perceptron_controller
// Module Name:   /home/shanel/research/neural-hardware/single-perceptron-demo/perceptron_controller_tb.v
// Project Name:  single-perceptron-demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: perceptron_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module fake_bram (input clk, input [8:0] addr, output reg [31:0] dout);
	always @(posedge clk) begin
		case (addr)
			0: dout <= {16'd2, 16'd2};
			1: dout <= {16'd2, 16'd2};
			2: dout <= {16'd2, 16'd2};
			3: dout <= {16'd2, 16'd2};
			4: dout <= {16'd2, 16'd2};
			5: dout <= {16'd2, 16'd2};
			6: dout <= {16'd2, 16'd2};
			7: dout <= {16'd2, 16'd2};
			default: dout <= 0;
		endcase
	end
endmodule


module perceptron_controller_tb;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg [8:0] start_addr;
	reg [8:0] end_addr;
	wire [31:0] bram_data_in;

	// Outputs
	wire [8:0] bram_data_addr;
	wire [15:0] perceptron_out;
	wire fire;

	// Instantiate the Unit Under Test (UUT)
	perceptron_controller uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.start_addr(start_addr), 
		.end_addr(end_addr), 
		.bram_data_in(bram_data_in), 
		.bram_data_addr(bram_data_addr), 
		.perceptron_out(perceptron_out), 
		.fire(fire)
	);

	initial begin
		clk = 1'b1;
		forever begin
			#5 clk = ~clk;
		end
	end

	fake_bram bram(
		.clk(clk),
		.addr(bram_data_addr),
		.dout(bram_data_in)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		enable = 0;
		start_addr = 9'b0;
		end_addr = 9'd8;

		// Wait 100 ns for global reset to finish
		rst = 1;
		#200;

		rst = 0;
		#200;
        
		// Add stimulus here
		enable = 1; #10 enable = 0;
		#2000;
	end
      
endmodule