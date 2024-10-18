module Execute_tb;
reg clk;
reg [5:0] funct, op; // Removed branchZeroVal as it is unused
reg [4:0] branchZeroVal;
wire ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, WB_RA, Sign, inA, ALUImmReg, WBDest, sh_amt, ForceInstr;
wire MemReadEn, MemWriteEn, RegWrite;
reg AdderAdd;
wire [1:0] MemMode;
reg [31:0] NextInstr_tb, Instr, DataAtInstr25_21In, DataAtInstr20_16In; // Renamed NextInstr to NextInstr_tb

// MUXController outputs
wire ZeroInvertedOut, InvertedOut, SumOut, NextInstrOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, inAOut, ALUImmRegOut, WBDestOut, SignOut, ForceInstrOut;
wire [31:0] ALUOut;
// Instantiate the MUXController module
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
.MemWrite(MemWriteEn),
.MemRead(MemReadEn),
.RegWrite(RegWrite),
.RegRead(),
.Memmode(MemMode)
);

// Instantiate the Execute module
Execute uut_Execute (
.clk(clk),
.ZeroInverted(ZeroInverted),
.Inverted(Inverted),
.Sum(Sum),
.NextInstruction(NextInstr),
.NextInstrAddress(NextInstrAddress),
.DataWriteVal(DataWriteVal),
.WB_RA(WB_RA),
.Sign(Sign),
.inA(inA),
.ALUImmReg(ALUImmReg),
.WBDest(WBDest),
.ForceInstr(ForceInstr),
.MemReadEn(MemReadEn),
.AdderAdd(AdderAdd),
.MemWriteEn(MemWriteEn),
.sh_amt(sh_amt),
.RegWrite(RegWrite),
.MemMode(MemMode),
.NextInstr(NextInstr_tb), // Updated connection
.Instr(Instr),
.DataAtInstr25_21In(DataAtInstr25_21In),
.DataAtInstr20_16In(DataAtInstr20_16In),
.SumOut(SumOut), // You may remove this if SumOut is already connected in MUXController
.ZeroOrNot(ZeroOrNotOut),
.NextInstructionOut(NextInstructionOut),
.NextInstrAddressOut(NextInstrAddressOut),
.DataWriteValOut(DataWriteValOut),
.WB_RAOut(WB_RAOut),
.RegWriteOut(RegWriteOut),
.MemWriteEnOut(MemWriteEnOut),
.AdderAddOut(AdderAddOut),
.MemReadEnOut(MemReadEnOut),
.WBDestOut(WBDestOut),
.MemModeOut(MemModeOut),
.NextInstrOut(NextInstrOut),
.InstrOut(InstrOut),
.ALUOut(ALUOut)
);

// Clock generation
initial begin
clk = 0;
forever #50 clk = ~clk;
end
reg [4:0] sh_amt_val;
initial begin
op = 6'b0;
branchZeroVal = 5'b0;
sh_amt_val = 5'b0;
funct = 6'b0;
forever #5 Instr = {op, 5'b0, 5'b0, branchZeroVal, sh_amt_val, funct};
end
initial begin
#100
        
// Test scenario 1: R-type instruction (ADD)
sh_amt_val = 6'b0; // Not used in ADD
op = 6'b000000;  // R-type
funct = 6'b100000;  // ADD
DataAtInstr25_21In = 32'h00000005;
DataAtInstr20_16In = 32'h00000003;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type ADD 5 + 3\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        
#100
        
// Test scenario 1: R-type instruction (AND)
op = 6'b000000;  // R-type
funct = 6'b100100;  // AND
DataAtInstr25_21In = 32'hFF00FF00;
DataAtInstr20_16In = 32'hF0F0F0F0;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type AND FF00FF00 & F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (NOR)
op = 6'b000000;  // R-type
funct = 6'b100010;  // NOR
DataAtInstr25_21In = 32'hFF00FF00;
DataAtInstr20_16In = 32'hF0F0F0F0;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type NOR FF00FF00 ^~ F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
// Test scenario 1: R-type instruction (SUB)
op = 6'b000000;  // R-type
funct = 6'b100010;  // SUB
DataAtInstr25_21In = 32'h00000009;
DataAtInstr20_16In = 32'h00000004;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type SUB 9-4\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (XOR)
op = 6'b000000;  // R-type
funct = 6'b100110;  // XOR
DataAtInstr25_21In = 32'hFF00FF00;
DataAtInstr20_16In = 32'hF0F0F0F0;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type XOR FF00FF00 ^ F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (MUL)
op = 6'b011100;  // R-type
funct = 6'b000010;  // MUL
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'h00000002;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type MUL 3 * 2\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (SLL)
op = 6'b000000;  // R-type
funct = 6'b000000;  // SLL
sh_amt_val = 6'd2;
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'h00000004;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type SLL 3 << 2\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
sh_amt_val = 6'd0;
#100
        
// Test scenario 1: R-type instruction (SRL)
op = 6'b000000;  // R-type
funct = 6'b000010;  // SRL
sh_amt_val = 6'd2;
DataAtInstr25_21In = 32'h000000016;
DataAtInstr20_16In = 32'h00000004;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type SRL 22 >> 2\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
sh_amt_val = 6'd0;
#100
        
// Test scenario 1: R-type instruction (SLT)
op = 6'b000000;  // R-type
funct = 6'b101010;  // SLT
DataAtInstr25_21In = 32'hFF00FF00;
DataAtInstr20_16In = 32'hF0F0F0F0;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("R-type SLT FF00FF00 < F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (ADDI)
op = 6'b001000;  // ADDI
funct = 6'b001000;  // IMM = 8
DataAtInstr25_21In = 32'h00000008;
DataAtInstr20_16In = 32'hF0F0F0F0;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type ADDI 8 + 8\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (ANDI)
op = 6'b001100;  // ANDI
funct = 6'b001111;  // IMM = 15
DataAtInstr25_21In = 32'h00000005;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type ANDI 15 & 5 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100
        
// Test scenario 1: R-type instruction (XORI)
op = 6'b001110;  // XORI
funct = 6'b001110;  // IMM = 14
DataAtInstr25_21In = 32'h00000005;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type XORI 14 ^ 5 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (SLTI)
op = 6'b001010;  // SLTI
funct = 6'b001110;  // IMM = 14
DataAtInstr25_21In = 32'h00000005;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type SLTI 5 < 14 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (SLTI)
op = 6'b001010;  // SLTI
funct = 6'b001110;  // IMM = 14
DataAtInstr25_21In = 32'h00000005;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type SLTI 5 < 14 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (LW)
op = 6'b100011;  // LW
funct = 6'b000100;  // IMM = 4
DataAtInstr25_21In = 32'h00000005;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type LW 4 + 5 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (LH)
op = 6'b100001;  // LH
funct = 6'b000100;  // IMM = 4
DataAtInstr25_21In = 32'h00000008;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type LH 4 + 8 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (LB)
op = 6'b100000;  // LB
funct = 6'b001000;  // IMM = 8
DataAtInstr25_21In = 32'h00000001;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type LB 1 + 8 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (SB)
op = 6'b101000;  // SB
funct = 6'b000111;  // IMM = 7
DataAtInstr25_21In = 32'h00000001;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type SB 1 + 7 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (SH)
op = 6'b101001;  // SH
funct = 6'b001000;  // IMM = 8
DataAtInstr25_21In = 32'h00000001;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type SH 1 + 8 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (SW)
op = 6'b101011;  // SW
funct = 6'b000110;  // IMM = 6
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type SW 6 + 3 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (JR)
op = 6'b101011;  // R
funct = 6'b001000;  // JR
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type JR 3 + 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (J)
op = 6'b101011;  // R
funct = 6'b001000;  // JR
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type JR X + X \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (JAL)
op = 6'b000011;  // JAL
funct = 6'b001000;  // JR
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'hF0F0F0FF;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type JAL X + X \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BNE)
op = 6'b000101;  // BNE
funct = 6'b001000;  // BNE
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'h00000003;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BNE 3 XOR 3 != 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BNE)
op = 6'b000101;  // BNE
funct = 6'b001000;  // BNE
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'h00000004;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BNE 3 XOR 4 != 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BEQ)
op = 6'b000100;  // BEQ
funct = 6'b001000;  // BEQ
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'h00000003;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BEQ 3 XOR 3 == 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        
#100;
        
// Test scenario 1: R-type instruction (BEQ)
op = 6'b000100;  // BEQ
funct = 6'b001000;  // BEQ
DataAtInstr25_21In = 32'h00000003;
DataAtInstr20_16In = 32'h00000004;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BEQ 3 XOR 4 == 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BGEZ)
op = 6'b000001;  // BGEZ
branchZeroVal = 5'b00001; // BGEZ
funct = 6'b001000;  // imm = 8
DataAtInstr25_21In = 32'h00000000;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BGEZ 0 >= 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BGEZ)
op = 6'b000001;  // BGEZ
branchZeroVal = 5'b00001; // BGEZ
funct = 6'b001000;  // BGEZ
DataAtInstr25_21In = 32'h00000004;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BGEZ 4 >= 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BGEZ)
op = 6'b000001;  // BGEZ
branchZeroVal = 5'b00001; // BGEZ
funct = 6'b001000;  // BGEZ
DataAtInstr25_21In = 32'hFFFFFFFF;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BGEZ -1 >= 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BLEZ)
op = 6'b000110;  // BLEZ
funct = 6'b001000;  // BLEZ
DataAtInstr25_21In = 32'h00000000;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BLEZ 0 <= 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BLEZ)
op = 6'b000110;  // BLEZ
funct = 6'b001000;  // BGEZ
DataAtInstr25_21In = 32'h00000004;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BLEZ 4 <= 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BLEZ)
op = 6'b000110;  // BLEZ
funct = 6'b001000;  // BLEZ
DataAtInstr25_21In = 32'hFFFFFFFF;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BLEZ -1 <= 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BGTZ)
op = 6'b000111;  // BGTZ
funct = 6'b001000;  // BGTZ
DataAtInstr25_21In = 32'h00000004;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BGTZ 4 > 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
// Test scenario 1: R-type instruction (BLTZ)
op = 6'b000001;  // BLTZ
funct = 6'b001000;  // BLEZ
branchZeroVal = 5'b00000;
DataAtInstr25_21In = 32'hFFFFFFFF;
DataAtInstr20_16In = 32'h00000000;

#100;  // Wait for one clock cycle
        
// Observe the outputs
$display("I-type BLTZ -1 < 0 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
#100;
        
#100;
        
$finish;
end
endmodule