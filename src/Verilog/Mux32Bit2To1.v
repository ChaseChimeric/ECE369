`timescale 1ns / 1ps

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
    out, 
    inA, 
    inB, 
    sel
);

    output [SIZE-1:0] out;
    
    input [SIZE-1:0] inA;
    input [SIZE-1:0] inB;
    input sel;

    assign out = sel ? inA : inB; 

endmodule
