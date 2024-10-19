
module WriteBack_tb;

  // Parameters

  //Ports
  reg [31:0] MemoryRead;
  reg [31:0] ALUOut;
  reg [31:0] ImmediateExtended;
  reg [31:0] Instruction;
  reg [31:0] InstrAdd;
  reg [31:0] NextInstructionAddress;
  reg AdderAdd;
  wire WB_RA;
  wire NextInstrAddress;
  wire WBDest;
  wire NextInstr;
  wire Sum;
  wire DataWriteVal;
  wire [31:0] WriteData;
  wire [31:0] InstrAddOut;
  wire [31:0] ImmediateExtendedOut;
  wire [4:0] WriteRegister;
  wire SumOut;
  wire AdderAddOut;
  wire NextInstrOut;
  reg [5:0] funct, op;
  reg [4:0] branchZeroVal, sh_amt_val;
  wire ZeroInverted, Inverted;
  wire [2:0] ForceInstr;
  wire RegWriteEnabled;

  WriteBack  WriteBack_inst (
    .MemoryRead(MemoryRead),
    .ALUOut(ALUOut),
    .ImmediateExtended(ImmediateExtended),
    .Instruction(Instruction),
    .InstrAdd(InstrAdd),
    .NextInstructionAddress(NextInstructionAddress),
    .AdderAdd(AdderAdd),
    .WB_RA(WB_RA),
    .NextInstrAddress(NextInstrAddress),
    .WBDest(WBDest),
    .NextInstr(NextInstr),
    .Sum(Sum),
    .DataWriteVal(DataWriteVal),
    .WriteData(WriteData),
    .InstrAddOut(InstrAddOut),
    .ImmediateExtendedOut(ImmediateExtendedOut),
    .WriteRegister(WriteRegister),
    .SumOut(SumOut),
    .AdderAddOut(AdderAddOut),
    .NextInstrOut(NextInstrOut),
    .RegWriteEnabled(RegWriteEnabled)
  );
  MUXController muxController (
    .funct(funct),
    .op(op),
    .branchZeroVal(branchZeroVal), // Assuming branchZeroVal is not used; set to 0
    .ForceInstr(ForceInstr),
    .ZeroInverted(ZeroInverted),
    .Inverted(Inverted),
    .Sum(Sum),
    .NextInstr(NextInstr),
    .NextInstrAddress(NextInstrAddress),
    .DataWriteVal(DataWriteVal),
    .inA(inA),
    .ALUImmReg(ALUImmReg),
    .WB_RA(WB_RA),
    .WBDest(WBDest),
    .Sign(Sign),
    .sh_amt(sh_amt)
  );
  MemController memController(
    .Op(op),
    .Funct(funct),
    .MemWrite(),
    .MemRead(),
    .RegWrite(RegWriteEnabled),
    .RegRead(),
    .Memmode()
 );
  
  initial begin
    op = 6'b0;
    branchZeroVal = 5'b0;
    sh_amt_val = 5'b0;
    funct = 6'b0;
    forever #5 Instruction = {op, 5'd10, 5'd20, branchZeroVal, sh_amt_val, funct};
  end

  // Set MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress
  // AdderAdd, just check for copying to output
  initial begin
    #100;
    MemoryRead = 32'd247;
    ALUOut = 32'd391;
    ImmediateExtended = 32'd959;
    InstrAdd = 32'd180;
    NextInstructionAddress = 32'd686;
    branchZeroVal = 5'd30;
    AdderAdd = 0;
    #100;

    op = 6'b000000;  // R-type
    funct = 6'b100000;  // ADD
    #100;
    $display("ADD Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);

    op = 6'b000000;  // R-type
    funct = 6'b100100;  // AND
    #100;
    $display("\nAND Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b000000;  // R-type
    funct = 6'b100111;  // NOR
    #100;
    $display("\nAND Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b000000;  // R-type
    funct = 6'b100010;  // SUB
    #100;
    $display("\nSUB Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b000000;  // R-type
    funct = 6'b100110;  // XOR
    #100;
    $display("\nXOR Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b011100;  // R-type
    funct = 6'b000010;  // MUL
    #100;
    $display("\nMUL Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b000000;  // R-type
    funct = 6'b000000;  // SLL
    #100;
    $display("\nSLL Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b000000;  // R-type
    funct = 6'b000010;  // SRL
    $display("\nSRL Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b000000;  // R-type
    funct = 6'b101010;  // SLT
    #100;
    $display("\nSLT Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b001000;  // ADDI
    funct = 6'b001000;  // IMM = 8
    #100;
    $display("\nADDI Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b001100;  // ANDI
    funct = 6'b001111;  // IMM = 15
    #100;
    $display("\nANDI Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b001110;  // XORI
    funct = 6'b001110;  // IMM = 14
    #100;
    $display("\nXORI Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b001010;  // SLTI
    funct = 6'b001110;  // IMM = 14
    #100;
    $display("\nSLTI Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b100011;  // LW
    funct = 6'b000100;  // IMM = 4
    #100;
    $display("\nLW Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b100001;  // LH
    funct = 6'b000100;  // IMM = 4
    #100;
    $display("\nLH Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    op = 6'b100000;  // LB
    funct = 6'b001000;  // IMM = 8
    #100;
    $display("\nLB Instr:\nMemoryRead: %d\nALUOut: %d\nImmediateExtended: %d\nInstruction: %h\nInstrAdd: %d\nNextInstructionAddress: %d\nAdderAdd: %b\nWB_RA: %b\nNextInstrAddress: %b\nWBDest: %b\nNextInstr: %b\nSum: %b\nDataWriteVal: %b\nWriteData: %d\nInstrAddOut: %d\nImmediateExtendedOut: %d\nWriteRegister: %d\nSumOut: %b\nAdderAddOut: %b\nNextInstrOut: %b\nfunct: %h\nop: %h\nbranchZeroVal: %d\nsh_amt_val: %d\nForceInstr: %b\nZeroInverted: %b\nInverted: %b", MemoryRead, ALUOut, ImmediateExtended, Instruction, InstrAdd, NextInstructionAddress, AdderAdd, WB_RA, NextInstrAddress, WBDest, NextInstr, Sum, DataWriteVal, WriteData, InstrAddOut, ImmediateExtendedOut, WriteRegister, SumOut, AdderAddOut, NextInstrOut, funct, op, branchZeroVal, sh_amt_val, ForceInstr, ZeroInverted, Inverted);
    
    #100;
    $finish;
  end
    
  

//always #5  clk = ! clk ;

endmodule