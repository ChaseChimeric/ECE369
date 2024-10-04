`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(sign_extend_in, sign_extend_out);

    /* A 16-Bit input word */
    input [15:0] sign_extend_in;
    
    /* A 32-Bit output word */
    output [31:0] sign_extend_out;
    
    /* Fill in the implementation here ... */
     assign sign_extend_out = sign_extend_in[15] ? {16'hFFFF, sign_extend_in} : {16'd0, sign_extend_in};

endmodule
