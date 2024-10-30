`timescale 1ns / 1ps
`ifndef _top
`define _top


module top(
    input Clk,
    input Reset,
    output [6:0] out7,
    output [7:0] en_out
);

    wire clockMod;
    wire [31:0] intInstruction;
    wire [31:0] intResult;
    
    ClkDiv clkdiv(
        .Clk(Clk), 
        .Rst(Reset), 
        .ClkOut(clockMod));

    InstructionFetchUnit ifu0(
        .Reset(Reset),
        .Clk(clockMod),
        .Instruction(intInstruction),
        .PCResult(intResult)
    );

    Two4DigitDisplay disp(
        .Clk(Clk), 
        .NumberA(intInstruction), 
        .NumberB(intResult), 
        .out7(out7), 
        .en_out(en_out)
        );

endmodule
`endif