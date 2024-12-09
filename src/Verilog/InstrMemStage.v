`ifndef _instrmemstage
`define _instrmemstage
`include "InstructionMemoryAccess.v"
`include "InstructionMemoryParse.v"
module InstrMemAccess (
    input [31:0] nextInstruction,
    input [31:0] instrMemAddress,
    input [0:0]  enable,
    input rst,
    input clk,
    output [31:0] instrOut,
    output reg [31:0] nextInstructionOut,
    output reg [31:0] instrMemAddressOut,
    output reg [0:0]  enableOut
);
localparam ENDVAL = 1;
wire [31:0] instrMemAddressInternal;
wire [31:0] Instr0Wire;
wire [31:0] Instr1Wire;
wire [31:0] Instr2Wire;
wire [31:0] Instr3Wire;
InstructionMemoryAccess memAccess(
    .clk(clk),
    .Addr(instrMemAddress[14:2]),
    .MemRead0(Instr0Wire),
    .MemRead1(Instr1Wire),
    .MemRead2(Instr2Wire),
    .MemRead3(Instr3Wire),
    .AddressOut(instrMemAddressInternal)
);

InstructionMemoryParse memParse (
    .rst(rst),
    .clk(clk),
    .Address(instrMemAddressInternal),
    .Instruction0(Instr0Wire),
    .Instruction1(Instr1Wire),
    .Instruction2(Instr2Wire),
    .Instruction3(Instr3Wire),
    .instrOut(instrOut),
    .AddressOut()
);

//Pass Through Values
integer i;
reg [31:0] nextInstructionReg [0:ENDVAL];
reg [0:0]  enableReg          [0:ENDVAL];
reg [31:0] instrMemAddressReg [0:ENDVAL];
always @(posedge clk ) begin
    if(!rst) begin
        nextInstructionOut <= nextInstructionReg[ENDVAL];
        enableOut <= enableReg[ENDVAL];
        instrMemAddressOut <= {19'd0, instrMemAddressReg[ENDVAL][12:0]};
        nextInstructionReg[0] <= nextInstruction;
        enableReg[0] <= enable;
        instrMemAddressReg[0] <= instrMemAddress;
        for(i = 0; i < ENDVAL; i = i + 1) begin
            nextInstructionReg[i+1] <= nextInstructionReg[i];
            enableReg[i+1] <= enableReg[i];
            instrMemAddressReg[i+1] <= instrMemAddressReg[i];
        end
     end else begin
        nextInstructionOut <= 32'd0;
        enableOut <= 1'd1;
        instrMemAddressOut <= 32'd0;
        for(i = 0; i <= ENDVAL; i = i + 1 ) begin
            nextInstructionReg[i] <= 0;
            enableReg[i] <= 0;
            instrMemAddressReg[i] <= 0;
        end
     end
    
end



endmodule
`endif