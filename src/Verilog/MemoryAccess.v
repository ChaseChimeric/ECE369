module MemoryAccess(
    input Clk,
    input Sum,
    input NextInstr,
    input NextInstrAddress,
    input DataWriteVal,
    input wb_ra,
    input MemMode [1:0],
    input ReadAddr [31:0], //from ALUOut
    input ZeroOrNot,
    input ForceInstr,
    input rt_dat [31:0], // instruction 20:16 DATA AT INStrUCTION
    input immExtended [15:0], // instruction 16:0
    // alu again but to output
    input NextInstrAddress [31:0],
    input FullInstruction [31:0],
    input WBDest,
    input MemReadEn,
    input MemWriteEn,
    input AdderAdd,
    input RegWrite,

    output reg Sum_out,
    output reg NextInstr_out,
    output reg NextInstrAddress_out,
    output reg DataWriteVal_out,
    output reg wb_ra_out,
    output reg InstrAdd_out [31:0],
    output reg AdderAdd_out,
    output reg MemoryRead_out [31:0], //from ALUOut
    output reg immExtended_out [15:0], // instruction 16:0
    output reg ALU_out [31:0],
    // alu again but to output
    output reg NextInstrAddress_out [31:0],
    output reg FullInstruction_out [31:0],

    output reg AdderAdd_out,
    output reg RegWrite_out,
);


DataMemory datamemory(
    .Address(ReadAddr), 
    .WriteData(rt_dat), 
    .Clk(Clk), 
    .MemWrite(MemWriteEn), 
    .MemRead(MemReadEn), 
    .ReadData(MemoryRead_out)

);




endmodule