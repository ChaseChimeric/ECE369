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
    enable,
    enableOut
);
    input adderAdd, sum, rst, clk, nextInstr, enable;
    input [31:0] jumpAddress, imm, ALUOut;
    output reg [31:0] instrOut;
    output reg [31:0] nextInstruction;
    output [31:0] instrMemAddressOut;
    output reg enableOut;


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
        .PCResult(PCAdderIn),
        .PCAddResult(internalNextInstr)
    );

    ProgramCounter pc0(
        .Address(addressOut),
        .PCResult(instrMemAddress),
        .Reset(rst),
        .Clk(clk)
    );

    InstructionMemory mem0(
        .Address(instrMemAddress),
        .Instruction(instrOutInternal)
    );

    wire [7:0] instrMemAddressWire = instrMemAddress[10:2];
    wire [7:0] jumpAddressWire = jumpAddress[10:2];
    wire [7:0] internalNextInstrWire = internalNextInstr[10:2];
    wire [7:0] immWire = imm[7:0];
    assign PCAdderIn = ((sum) ? ({22'd0, (instrMemAddressWire + (jumpAddressWire)), 2'd0}) : instrMemAddress);
    assign secondAdderOutput = (adderAdd) ? {22'd0, (internalNextInstrWire + (immWire)), 2'd0} : (internalNextInstr);
    assign addressOut = (enable) ? ((nextInstr) ? ((sum) ? {22'd0, imm[10:2]}: {22'd0, jumpAddress[10:2], 2'd0}) : secondAdderOutput) : instrMemAddress;
    assign instrMemAddressOut = instrMemAddress;
   
    always @(posedge clk) begin
        if (rst) begin
            instrOut <= 0;
            nextInstruction <= 0;
            enableOut <= 1'b1;
        end else begin
            instrOut <= instrOutInternal;
            nextInstruction <= internalNextInstr;
            enableOut <= enable;
        end
    end
endmodule
`endif