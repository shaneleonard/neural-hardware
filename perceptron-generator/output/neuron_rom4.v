module neuron_rom4(
    input clk,
    input      [15: 0] addr,
    output reg [15: 0] dout,
);

always @(posedge clk) begin
    case (addr)
        16'd1: dout <= 16'd0.0;
        16'd2: dout <= 16'd0.0;
        16'd3: dout <= 16'd4.0;
        16'd4: dout <= 16'd5.0;
        16'd5: dout <= 16'd6.0;
        16'd6: dout <= 16'd8.0;
        16'd7: dout <= 16'd0.0;
        16'd8: dout <= 16'd0.0;
        16'd9: dout <= 16'd0.0;
        16'd10: dout <= 16'd0.0;
        default: dout <= 16'd0;
    endcase 
end 

endmodule
