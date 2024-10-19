module WinRAR (
    input clk,
    input rst
);
    // Declare wires for the other inputs and outputs
    wire [31:0] jumpAddressWBFetch;
    wire [31:0] instrAddWBFetch;
    wire [31:0] immWBFetch;
    wire [31:0] adderAddWBFetch;
    wire [31:0] nextInstrFetchDecode;
    wire [31:0] sumWBFetch;
    wire [31:0] instrOutFetchDecode;
    wire [31:0] ALUOutWBFetch;

    // Instantiate the Fetch module
    Fetch fetch (
        .rst(rst),
        .clk(clk),
        .jumpAddress(jumpAddress),
        .instrAdd(instrAdd),
        .imm(imm),
        .adderAdd(adderAdd),
        .nextInstr(nextInstr),
        .sum(sum),
        .instrOut(instrOut),
        .ALUOut(ALUOut)
    );

    Decode decode (
        .clk(clk),
        .InstructionIn(instrOut),           // Wired from Fetch output
        .NextInstructionIn(nextInstr),      // Wired from Fetch output
        .ForceInstr(ForceInstr),
        .ZeroInverted(ZeroInverted),
        .Inverted(Inverted),
        .Sum(sum),                          // Wired from Fetch output
        .NextInstructionOut(NextInstructionOut),
        .NextInstr(nextInstr),              // Wired from Fetch output
        .NextInstrAddress(jumpAddress),     // Wired from Fetch output
        .DataWriteVal(imm),                 // Wired from Fetch output
        .ALUImmReg(ALUImmReg),
        .WB_RA(WB_RA),
        .WBDestRdRt(WBDestRdRt),
        .MemMode(MemMode),
        .Sign(Sign),
        .InstructionOut(InstructionOut),
        .inA(ALUOut),                       // Wired from Fetch output
        .AdderAdd(adderAdd),                // Wired from Fetch output
        .DataIn25_21(DataIn25_21),
        .DataIn20_15(DataIn20_15),
        .MemReadEn(MemReadEn),
        .MemWriteEn(MemWriteEn),
        .RegWriteIn(RegWriteIn),
        .RegWriteOut(RegWriteOut),
        .sh_amt(sh_amt),
        .WriteData(WriteData),
        .RegWriteAddr(RegWriteAddr)
    );


    
endmodule