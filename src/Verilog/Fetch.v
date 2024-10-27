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
    PCAddress
);
    input adderAdd, sum, rst, clk, nextInstr;
    input [31:0] jumpAddress, imm, ALUOut;
    output reg [31:0] instrOut;
    output reg [31:0] nextInstruction;
    output [31:0] PCAddress;


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

    
    assign PCAdderIn = (sum) ? (instrMemAddress + (jumpAddress)) : instrMemAddress;
    assign secondAdderOutput = (adderAdd) ? (internalNextInstr + (imm << 2) - 16) : (internalNextInstr);
    assign addressOut = (nextInstr) ? ((sum) ? imm << 2 : jumpAddress) : secondAdderOutput;
   
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
