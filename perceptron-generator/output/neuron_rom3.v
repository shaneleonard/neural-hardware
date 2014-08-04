module neuron_rom3(
    input clk,
    input [16 - 1: 0] addr,
    output [16 - 1: 0] dout,
);

always @(posedge clk) begin
    case (addr)
        16'd1: dout <= 16'h0000;
        16'd2: dout <= 16'h0000;
        16'd3: dout <= 16'h0300;
        16'd4: dout <= 16'h0400;
        16'd5: dout <= 16'h0500;
        16'd6: dout <= 16'h0600;
        16'd7: dout <= 16'h0000;
        16'd8: dout <= 16'h0000;
        16'd9: dout <= 16'h0000;
        16'd10: dout <= 16'h0000;
        default: dout <= 16'd0;
    endcase 
end 

endmodule
