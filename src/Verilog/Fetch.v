module Fetch (
    rst,
    clk,
    jumpAddress,
    instrAdd,
    imm,
    adderAdd,
    nextInstr,
    sum,
    nextInstr,
    instrOut,
    ALUOut
);
    input instrAdd, adderAdd, sum, rst, clk;
    input [31:0] jumpAddress, imm, ALUOut;
    output reg [31:0] instrOut;
    output reg [31:0] nextInstr;


    wire [31:0] PCAdderIn;
    wire [31:0] PCAddResult;
    wire [31:0] internalNextInstr;
    wire [31:0] secondAdderOutput;
    wire [31:0] programCounterAddress;
    wire [31:0] instrMemAddress;
    wire [31:0] instrOutInternal;
    wire [31:0] addressOut;

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

    
    assign PCAdderIn = (sum) ? (instrMemAddress + (jumpAddress)) : instrMemAddress;
    assign secondAdderOutput = (adderAdd) ? (internalNextInstr + (imm << 2)) : (internalNextInstr);
    assign addressOut = (nextInstr) ? (jumpAddress) : secondAdderOutput;
   
    always @(posedge clk) begin
        instrOut <= instrOutInternal;
        nextInstr <= internalNextInstr;
    end

endmodule