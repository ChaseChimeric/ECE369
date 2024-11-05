`timescale 1ns / 1ps
`ifndef m32t4
`define m32t4
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit4To1 #(
    parameter SIZE = 32
)
(
    mux_out, 
    in0, 
    in1,
    in2,
    in3, 
    sel
);

    output [SIZE-1:0] mux_out;
    
    input [SIZE-1:0] in0;
    input [SIZE-1:0] in1;
    input [SIZE-1:0] in2;
    input [SIZE-1:0] in3;
    input sel [1:0];

    always @(*) begin
        case (sel)
            2'b00: mux_out <= in0;
            2'b01: mux_out <= in1;
            2'b10: mux_out <= in2;
            2'b11: mux_out <= in3;
        endcase
    end

endmodule
`endif