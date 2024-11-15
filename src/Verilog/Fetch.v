`ifndef fetch
`define fetch
`include "PCAdder.v"
`include "ProgramCounter.v"
`include "InstructionMemory.v"
module Fetch (
    rst,
    clk,
    jumpAddress,
    imm,
    adderAdd,
    nextInstr,
    sum,
    nextInstruction,
    instrOut,
    ALUOut,
    instrMemAddressOut,
    enable
);
    input adderAdd, sum, rst, clk, nextInstr, enable;
    input [31:0] jumpAddress, imm, ALUOut;
    output reg [31:0] instrOut;
    output reg [31:0] nextInstruction;
    output [31:0] instrMemAddressOut;
    
    reg enableFlag;


    wire [31:0] PCAdderIn;
    wire [31:0] PCAddResult;
    wire [31:0] internalNextInstr;
    wire [31:0] secondAdderOutput;
    wire [31:0] programCounterAddress;
    wire [31:0] instrMemAddress;
    wire [31:0] instrOutInternal;
    wire [31:0] addressOut;

    assign PCAddress = addressOut;
    
    PCAdder add0(
        .PCResult((nextInstr) ? ((sum) ? (imm << 2) : jumpAddress) : PCAdderIn),
        .PCAddResult(internalNextInstr)
    );

    ProgramCounter pc0(
        .Address(addressOut),
        .PCResult(instrMemAddress),
        .Reset(rst),
        .Clk(clk)
    );

    InstructionMemory mem0(
        .Address(nextInstr ? ((sum) ? imm << 2 : jumpAddress) : ((sum) ? (instrMemAddress + (jumpAddress)) : (instrMemAddress - 4 * !enable + (imm << 2) * adderAdd))),
        .Instruction(instrOutInternal)
    );

    
    assign PCAdderIn = (sum) ? (instrMemAddress + (jumpAddress)) : instrMemAddress;
    assign secondAdderOutput = (adderAdd) ? (internalNextInstr + (imm << 2) - 16) : (internalNextInstr);
    assign addressOut = (enable | nextInstr) ? ((nextInstr) ? ((sum) ? imm << 2 : jumpAddress) : secondAdderOutput) : instrMemAddress;
    assign instrMemAddressOut = instrMemAddress;
   
    always @(posedge clk) begin
        if (rst) begin
            instrOut <= 0;
            nextInstruction <= 0;
        end else begin
            instrOut <= instrOutInternal;
            nextInstruction <= internalNextInstr;
        end
    end
endmodule
`endif