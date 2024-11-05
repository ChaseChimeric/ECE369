module MemoryAccess(
    input NextInstr,
    input NextInstrAddress,
    input DataWriteVal,
    input WB_RA,
    input MemMode [1:0],
    input ReadAddr [31:0], //from ALUOut
    input ZeroOrNot,
    input ForceInstr,
    input rt [4:0], // instruction 20:16
    input immExtended [15:0], // instruction 16:0
    // alu again but to output
    input NextInstrAddress [31:0],
    input FullInstruction [31:0],
    input WBDest,
    input MemReadEn,
    input MemWriteEn,
    input AdderAdd,
    input RegWrite,


    output NextInstr,
    output NextInstrAddress,
    output DataWriteVal,
    output WB_RA,
    input MemMode [1:0],
    input ReadAddr [31:0], //from ALUOut
    input ZeroOrNot,
    input ForceInstr,
    input rt [4:0], // instruction 20:16
    input immExtended [15:0], // instruction 16:0
    // alu again but to output
    input NextInstrAddress [31:0],
    input FullInstruction [31:0],
    input WBDest,
    input MemReadEn,
    input MemWriteEn,
    input AdderAdd,
    input RegWrite,
);





endmodule
