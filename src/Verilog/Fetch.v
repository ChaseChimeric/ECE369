`ifndef _fetch
`define _fetch
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
    instrMemAddressOut
);
    input rst, clk;
    input [1:0] nextInstrControl;
    input [31:0] jumpAddress;
    output reg [31:0] instrOut;
    output reg [31:0] nextInstruction;
    output [31:0] instrMemAddressOut;


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

    
    always @(*) begin
        case (nextInstrControl)

            // Regular operation
            2'b00:  instrMemAddress <= internalNextInstr;

            // Branching
            2'b01:  instrMemAddress <= internalNextInstr + jumpAddress << 2;

            // J
            2'b10:  instrMemAddress <= jumpAddress << 2;

            // JR
            2'b11:  instrMemAddress <= jumpAddress;

            default: instrMemAddress <= internalNextInstr;
            
        endcase
    end
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