`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module ShamtExtend(shamt_in, shamt_out);

    /* A 16-Bit input word */
    input [4:0] shamt_in;
    
    /* A 32-Bit output word */
    output [31:0] sign_extend_out;
    
    /* Fill in the implementation here ... */
    assign sign_extend_out = {27'd0, shamt_in};

endmodule
