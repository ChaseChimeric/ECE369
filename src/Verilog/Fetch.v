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
    ALUOut,
    instrMemAddressOut,
    enable,
    enableOut
);
    input adderAdd, sum, rst, clk, nextInstr, enable;
    input [31:0] jumpAddress, imm, ALUOut;
    output reg [31:0] nextInstruction;
    output [31:0] instrMemAddressOut;
    output reg enableOut;


    wire [31:0] PCAdderIn;
    wire [31:0] PCAddResult;
    wire [31:0] internalNextInstr;
    wire [31:0] secondAdderOutput;
    wire [31:0] programCounterAddress;
    wire [31:0] instrMemAddress;
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

    wire [7:0] instrMemAddressWire = instrMemAddress[10:2];
    wire [7:0] jumpAddressWire = jumpAddress[10:2];
    wire [7:0] internalNextInstrWire = internalNextInstr[9:2];
    wire [7:0] immWire = imm[7:0];
    assign PCAdderIn = ((sum) ? ({22'd0, (instrMemAddressWire + (jumpAddressWire)), 2'd0}) : instrMemAddress);
    assign secondAdderOutput = (adderAdd) ? {22'd0, (internalNextInstrWire + (immWire)), 2'd0} : (internalNextInstr);
    assign addressOut = (enable) ? ((nextInstr) ? ((sum) ? {22'd0, imm[7:0], 2'd0}: {22'd0, jumpAddress[10:2], 2'd0}) : secondAdderOutput) : instrMemAddress;
    assign instrMemAddressOut = instrMemAddress;
   
    always @(posedge clk) begin
        if (rst) begin
            nextInstruction <= 0;
            enableOut <= 1'b0;
        end else begin
            nextInstruction <= internalNextInstr;
            enableOut <= enable;
        end
    end
endmodule
`endif