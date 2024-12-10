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

    reg adderAdd_reg, sum_reg, nextInstr_reg, enable_reg;
    reg [31:0] jumpAddress_reg;
    reg [31:0] imm_reg; 
    reg [31:0] ALUOut_reg;

    always @(posedge clk ) begin
        if(rst) begin
            adderAdd_reg <= 0;
            sum_reg <= 0;
            nextInstr_reg <= 0;
            enable_reg <= 0;
            jumpAddress_reg <= 0;
            imm_reg <= 0;
            ALUOut_reg <= 0;
        end else begin
            adderAdd_reg            <= adderAdd; 
            sum_reg         <= sum; 
            nextInstr_reg           <= nextInstr; 
            enable_reg          <= enable; 
            jumpAddress_reg         <= jumpAddress; 
            imm_reg         <= imm; 
            ALUOut_reg                  <= ALUOut; 
        end
    end


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
    reg [31:0] internalNextInstr_reg;

    ProgramCounter pc0(
        .Address(addressOut),
        .PCResult(instrMemAddress),
        .Reset(rst),
        .Clk(clk)
    );
    reg [31:0] instrMemAddress_reg;

    always @(posedge clk ) begin
        if(rst) begin 
            internalNextInstr_reg <= 0;
            instrMemAddress_reg <= 0;
        end
        internalNextInstr_reg <= internalNextInstr;
        instrMemAddress_reg <= instrMemAddress;
    end

    wire [7:0] instrMemAddressWire = instrMemAddress_reg[10:2];
    wire [7:0] jumpAddressWire = jumpAddress_reg[10:2];
    wire [7:0] internalNextInstrWire = internalNextInstr_reg[9:2];
    wire [7:0] immWire = imm_reg[7:0];
    assign PCAdderIn = ((sum) ? ({22'd0, (instrMemAddressWire + (jumpAddressWire)), 2'd0}) : instrMemAddress);


    // use regs
    assign secondAdderOutput = (adderAdd_reg) ? {22'd0, (internalNextInstrWire + (immWire)), 2'd0} : (internalNextInstr_reg);
    assign addressOut = (enable_reg) ? ((nextInstr_reg) ? ((sum_reg) ? {22'd0, imm_reg[7:0], 2'd0}: {22'd0, jumpAddress_reg[10:2], 2'd0}) : secondAdderOutput) : instrMemAddress;
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