`ifndef winrar
`define winrar
`include "FetchTop.v"
`include "Decode.v"
`include "Execute.v"
`include "MemoryAccess.v"
`include "WriteBack.v"

//Percent Participation
// Ahmad    33%
// Ryan     33%
// Ryan     33%

module WinRAR (
    input clk,
    input rst,
    output [31:0] XPos,
    output [31:0] YPos
);
    localparam ENDVAL = 30;
    // Declare wires for the other inputs and outputs
    wire [31:0] Full32BitInstruction        [3:0];  // 0 is Fetch
    wire [31:0] NextFull32BitInstruction    [3:0];  // 0 is Fetch
    wire [2:0]  ForceInstrSignalWire        [1:0];  // 
    wire [0:0]  ZeroInvertedSignalWire      [0:0];
    wire [0:0]  ALUInvertedSignalWire       [0:0];
    wire [0:0]  SumFetchSignalWire          [3:0];
    wire [0:0]  NextInstrFetchSignalWire    [3:0];
    wire [0:0]  NextInstrAddressSignalWire  [2:0];
    wire [0:0]  DataWriteValWBSingalWire    [2:0];
    wire [0:0]  ALUImmRegSignalWire         [0:0];
    wire [0:0]  WB_RASignalWire             [2:0];
    wire [0:0]  WBDestRdRtSignalWire        [2:0];
    wire [1:0]  MemModeSignalWire           [1:0];
    wire [0:0]  ALUSignBitSignalWire        [0:0];
    wire [0:0]  SetALUInAZeroSignalWire     [0:0];
    wire [0:0]  AdderAddSignalWire          [3:0];
    wire [31:0] DataInBits25To21ofInstr     [0:0];
    wire [31:0] DataInBits20To15ofInstr     [1:0];
    wire [0:0]  MemReadEnableSignal         [1:0];
    wire [0:0]  MemWriteEnableSignal        [1:0];
    wire [0:0]  RegWriteEnableSignal        [3:0];
    wire [0:0]  UseShiftAmountSignalWire    [0:0];

    wire [0:0]  ZeroOrNotSignalWire         [0:0]; // 0 is Execute
    wire [31:0] ImmediateExtended           [2:0]; // 0 is execute
    wire [31:0] ALUResult                   [1:0]; // 0 is execute

    wire [31:0] InstrAdd                    [1:0];
    wire [31:0] MemoryRead                  [0:0];

    wire [31:0] WriteData32Data             [0:0];
    wire [4:0]  WriteRegister               [0:0];

    reg  [0:0]  enable                      [ENDVAL:0];  // 0 is fetch

    reg [0:0] rstRegs [6:0];
    integer rstRegVal;
    always @(posedge clk ) begin
        for (rstRegVal = 0; rstRegVal <= 6; rstRegVal = rstRegVal + 1) begin
            rstRegs[rstRegVal] <= rst;
        end
    end
    
    wire enableWire;

    // for debug
    assign WriteData = WriteData32Data[0];
    assign ALUOut = ALUResult[0];
    assign ReadMem = MemoryRead[0];
    assign Instruction = Full32BitInstruction[0];

    // Instantiate the Fetch module
    FetchTop fetch_instance (
        .rst(rstRegs[0]),
        .clk(clk),
        .jumpAddress(InstrAdd[1]),
        .imm(ImmediateExtended[2]),
        .adderAdd(AdderAddSignalWire[3]),
        .nextInstr(NextInstrFetchSignalWire[3]),
        .sum(SumFetchSignalWire[3]),
        .nextInstruction(NextFull32BitInstruction[0]),
        .instrOut(Full32BitInstruction[0]),
        .ALUOut(WriteData32Data[0]),
        .instrMemAddressOut(instrMemAddressOut),
        .enable(enable[ENDVAL]),
        .enableOut(enableWire)
    );

    integer i;
    always @(posedge clk ) begin
        if(!rstRegs[1]) begin
            enable[0] <= enableWire;
            for(i = 0; i < ENDVAL; i = i + 1) begin
                enable[i + 1] <= enable[i];
            end
        end else begin
           for(i = 0; i <= ENDVAL; i = i + 1) begin
                enable[i] <= 1'd0;
            end
        end
    end

    Decode decode_instance (
        .clk(clk),
        .rst(rstRegs[2]),
        .InstructionIn(Full32BitInstruction[0]),
        .NextInstructionIn(NextFull32BitInstruction[0]),
        .ForceInstr(ForceInstrSignalWire[0]),
        .ZeroInverted(ZeroInvertedSignalWire[0]),
        .Inverted(ALUInvertedSignalWire[0]),
        .Sum(SumFetchSignalWire[0]),
        .NextInstructionOut(NextFull32BitInstruction[1]),
        .NextInstr(NextInstrFetchSignalWire[0]),
        .NextInstrAddress(NextInstrAddressSignalWire[0]),
        .DataWriteVal(DataWriteValWBSingalWire[0]),
        .ALUImmReg(ALUImmRegSignalWire[0]),
        .WB_RA(WB_RASignalWire[0]),
        .WBDestRdRt(WBDestRdRtSignalWire[0]),
        .MemMode(MemModeSignalWire[0]),
        .Sign(ALUSignBitSignalWire[0]),
        .InstructionOut(Full32BitInstruction[1]),
        .inA(SetALUInAZeroSignalWire[0]),
        .AdderAdd(AdderAddSignalWire[0]),
        .DataIn25_21(DataInBits25To21ofInstr[0]),
        .DataIn20_15(DataInBits20To15ofInstr[0]),
        .MemReadEn(MemReadEnableSignal[0]),
        .MemWriteEn(MemWriteEnableSignal[0]),
        .RegWriteIn(RegWriteEnableSignal[3] & ((enable[ENDVAL-1] & NextInstrFetchSignalWire[3]) | (enable[ENDVAL] & !NextInstrFetchSignalWire[3]))),
        .RegWriteOut(RegWriteEnableSignal[0]),
        .sh_amt(UseShiftAmountSignalWire[0]),
        .WriteData(WriteData32Data[0]),
        .RegWriteAddr(WriteRegister[0]),
        .XPos(YPos),
        .YPos(XPos)
    );


    Execute execute(
      // inputs
      .rst(rstRegs[3]),
      .clk(clk),
      .ZeroInverted(ZeroInvertedSignalWire[0]),
      .Inverted(ALUInvertedSignalWire[0]),
      .Sum(SumFetchSignalWire[0]),
      .NextInstruction(NextInstrFetchSignalWire[0]),
      .NextInstrAddress(NextInstrAddressSignalWire[0]),
      .DataWriteVal(DataWriteValWBSingalWire[0]),
      .WB_RA(WB_RASignalWire[0]),
      .Sign(ALUSignBitSignalWire[0]),
      .inA(SetALUInAZeroSignalWire[0]),
      .ALUImmReg(ALUImmRegSignalWire[0]),
      .WBDest(WBDestRdRtSignalWire[0]),
      .ForceInstr(ForceInstrSignalWire[0]),
      .MemReadEn(MemReadEnableSignal[0]),
      .AdderAdd(AdderAddSignalWire[0]),
      .MemWriteEn(MemWriteEnableSignal[0]),
      .sh_amt(UseShiftAmountSignalWire[0]),
      .RegWrite(RegWriteEnableSignal[0]),
      .MemMode(MemModeSignalWire[0]),
      .NextInstr(NextFull32BitInstruction[1]),
      .Instr(Full32BitInstruction[1]),
      .DataAtInstr25_21In(DataInBits25To21ofInstr[0]),
      .DataAtInstr20_16In(DataInBits20To15ofInstr[0]),
      //outputs
      .SumOut(SumFetchSignalWire[1]),
      .ZeroOrNot(ZeroOrNotSignalWire[0]),
      .NextInstructionOut(NextInstrFetchSignalWire[1]),
      .NextInstrAddressOut(NextInstrAddressSignalWire[1]),
      .DataWriteValOut(DataWriteValWBSingalWire[1]),
      .WB_RAOut(WB_RASignalWire[1]),
      .RegWriteOut(RegWriteEnableSignal[1]),
      .MemWriteEnOut(MemWriteEnableSignal[1]),
      .AdderAddOut(AdderAddSignalWire[1]),
      .MemReadEnOut(MemReadEnableSignal[1]),
      .ForceInstrOut(ForceInstrSignalWire[1]),
      .WBDestOut(WBDestRdRtSignalWire[1]),
      .MemModeOut(MemModeSignalWire[1]),
      .NextInstrOut(NextFull32BitInstruction[2]),
      .InstrOut(Full32BitInstruction[2]),
      .DataAtInstruction20_16(DataInBits20To15ofInstr[1]),
      .ImmediateExtended(ImmediateExtended[0]),
      .ALUOut(ALUResult[0])
    );
    
    

    MemoryAccess memory(
        //inputs
        .Clk(clk),
        .rst(rstRegs[4]),
        .Sum(SumFetchSignalWire[1]),
        .ZeroOrNot(ZeroOrNotSignalWire[0]),
        .NextInstr(NextInstrFetchSignalWire[1]),
        .NextInstrAddressFlag(NextInstrAddressSignalWire[1]),
        .DataWriteVal(DataWriteValWBSingalWire[1]),
        .wb_ra(WB_RASignalWire[1]),
        .RegWrite(RegWriteEnableSignal[1]),
        .MemWriteEn(MemWriteEnableSignal[1]),
        .AdderAdd(AdderAddSignalWire[1]),
        .MemReadEn(MemReadEnableSignal[1]),
        .ForceInstr(ForceInstrSignalWire[1]),
        .WBDest(WBDestRdRtSignalWire[1]),
        .MemMode(MemModeSignalWire[1]),
        .NextInstrAddress(NextFull32BitInstruction[2]),
        .FullInstruction(Full32BitInstruction[2]),
        .rt_dat(DataInBits20To15ofInstr[1]),
        .immExtended(ImmediateExtended[0]),
        .ReadAddr(ALUResult[0]),
        //outputs
        .Sum_out(SumFetchSignalWire[2]),
        .NextInstr_out(NextInstrFetchSignalWire[2]),
        .NextInstrAddressFlag_out(NextInstrAddressSignalWire[2]),
        .DataWriteVal_out(DataWriteValWBSingalWire[2]),
        .wb_ra_out(WB_RASignalWire[2]),
        .RegWrite_out(RegWriteEnableSignal[2]),
        .AdderAdd_out(AdderAddSignalWire[2]),
        .WBDest_out(WBDestRdRtSignalWire[2]),
        .NextInstrAddress_out(NextFull32BitInstruction[3]),
        .FullInstruction_out(Full32BitInstruction[3]),
        .immExtended_out(ImmediateExtended[1]),
        .ALU_out(ALUResult[1]),
        .InstrAdd_out(InstrAdd[0]),
        .MemoryRead_out(MemoryRead[0])
    );

    WriteBack writeback_instance (
        .MemoryRead(MemoryRead[0]),
        .rst(rstRegs[5]),
        .clk(clk),
        .ALUOut(ALUResult[1]),
        .ImmediateExtended(ImmediateExtended[1]),
        .Instruction(Full32BitInstruction[3]),
        .InstrAdd(InstrAdd[0]),
        .NextInstructionAddress(NextFull32BitInstruction[3]),
        .RegWriteEnabled(RegWriteEnableSignal[2]),
        .AdderAdd(AdderAddSignalWire[2]),
        .WB_RA(WB_RASignalWire[2]),
        .NextInstrAddress(NextInstrAddressSignalWire[2]),
        .WBDest(WBDestRdRtSignalWire[2]),
        .NextInstr(NextInstrFetchSignalWire[2]),
        .Sum(SumFetchSignalWire[2]),
        .DataWriteVal(DataWriteValWBSingalWire[2]),
        .WriteData(WriteData32Data[0]),
        .InstrAddOut(InstrAdd[1]),
        .ImmediateExtendedOut(ImmediateExtended[2]),
        .WriteRegister(WriteRegister[0]),
        .SumOut(SumFetchSignalWire[3]),
        .AdderAddOut(AdderAddSignalWire[3]),
        .NextInstrOut(NextInstrFetchSignalWire[3]),
        .RegWriteEnabledOut(RegWriteEnableSignal[3])
    );
endmodule
`endif