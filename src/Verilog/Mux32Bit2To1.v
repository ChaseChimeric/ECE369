`timescale 1ns / 1ps
`ifndef m32t1
`define m32t1
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit2To1 #(
    parameter SIZE = 32
)
(
    mux_out, 
    in0, 
    in1, 
    sel
);

    output [SIZE-1:0] mux_out;
    
    input [SIZE-1:0] in0;
    input [SIZE-1:0] in1;
    input sel;

    assign mux_out = sel ? in0 : in1; 

endmodule
`endif