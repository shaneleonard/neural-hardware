`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:23:12 04/02/2014
// Design Name:
// Module Name:    ff_lib
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

// dff: D flip-flop
// Parametrized width; default of 1
module dff #(parameter WIDTH = 1) (
    input clk,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

always @(posedge clk) 
    q <= d;

endmodule

// dffr: D flip-flop with active high synchronous reset
// Parametrized width; default of 1
module dffr #(parameter WIDTH = 1) (
    input clk,
    input r,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

always @(posedge clk)
    if (r)
        q <= {WIDTH{1'b0}};
    else
        q <= d;
endmodule


    // dffre: D flip-flop with active high enable and reset
    // Parametrized width; default of 1
module dffre #(parameter WIDTH = 1) (
    input clk,
    input r,
    input en,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

always @(posedge clk)
    if (r)
        q <= {WIDTH{1'b0}};
    else if (en)
        q <= d;
    else
        q <= q;
endmodule
