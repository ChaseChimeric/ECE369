module Execute_tb;
    reg clk;
    reg [5:0] funct, op, branchZeroVal; // Removed branchZeroVal as it is unused
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

    initial begin
        #100
        
        // Test scenario 1: R-type instruction (ADD)
        op = 6'b000000;  // R-type
        funct = 6'b100000;  // ADD
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct}; // Some example instruction
        DataAtInstr25_21In = 32'h00000005;
        DataAtInstr20_16In = 32'h00000003;

        #100;  // Wait for one clock cycle
        
       // Observe the outputs
        $display("R-type ADD 5 + 3\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        
        #100
        
        // Test scenario 1: R-type instruction (AND)
        op = 6'b000000;  // R-type
        funct = 6'b100100;  // AND
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'hFF00FF00;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
       // Observe the outputs
        $display("R-type AND FF00FF00 & F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (NOR)
        op = 6'b000000;  // R-type
        funct = 6'b100100;  // NOR
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'hFF00FF00;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
       // Observe the outputs
        $display("R-type NOR FF00FF00 ^~ F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        // Test scenario 1: R-type instruction (SUB)
        op = 6'b000000;  // R-type
        funct = 6'b100010;  // SUB
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'h00000009;
        DataAtInstr20_16In = 32'h00000004;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("R-type SUB 9-4\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (XOR)
        op = 6'b000000;  // R-type
        funct = 6'b100110;  // XOR
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'hFF00FF00;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("R-type XOR FF00FF00 ^ F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (XOR)
        op = 6'b000000;  // R-type
        funct = 6'b100110;  // XOR
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'hFF00FF00;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("R-type XOR FF00FF00 ^ F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (SLT)
        op = 6'b000000;  // R-type
        funct = 6'b101010;  // SLT
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'hFF00FF00;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("R-type SLT FF00FF00 < F0F0F0F0\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (ADDI)
        op = 6'b001000;  // ADDI
        funct = 6'b001000;  // IMM = 8
        Instr = {funct, 5'b0, 5'b0, 5'b0, 5'b0, op};
        DataAtInstr25_21In = 32'h00000008;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("I-type ADDI 8 + 8\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (ANDI)
        op = 6'b001100;  // ANDI
        funct = 6'b001111;  // IMM = 15
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'h00000005;
        DataAtInstr20_16In = 32'hF0F0F0FF;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("I-type ANDI 15 & 5 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (XORI)
        op = 6'b001110;  // XORI
        funct = 6'b001110;  // IMM = 14
        Instr = {op, 5'b0, 5'b0, 5'b0, 5'b0, funct};
        DataAtInstr25_21In = 32'h00000005;
        DataAtInstr20_16In = 32'hF0F0F0FF;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("I-type XORI 14 ^ 5 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100;
        
        // Test scenario 1: R-type instruction (SLTI)
        op = 6'b001010;  // SLTI
        funct = 6'b001110;  // IMM = 14
        Instr = {funct, 5'b0, 5'b0, 5'b0, 5'b0, op};
        DataAtInstr25_21In = 32'h00000005;
        DataAtInstr20_16In = 32'hF0F0F0FF;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("I-type SLTI 5 < 14 \nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        
        #100;
        
        // Test scenario 2: Load Word instruction (LW)
        funct = 6'b100011;  // LW
        op = 6'b0;  // Not relevant for LW
        Instr = 32'h8C220000;  // Example LW instruction

        #100;  // Wait for one clock cycle
        
       // Observe the outputs
        $display("R-type LW 5 + 3\nALUOut: %h\nSumOut: %b\nZeroOrNot: %b\nNextInstructionOut: %b\nNextInstrAddressOut: %h\nDataWriteValOut: %h\nWB_RAOut: %b\nRegWriteOut: %b\nMemWriteEnOut: %b\nAdderAddOut: %b\nMemReadEnOut: %b\nWBDestOut: %b\nMemModeOut: %b\nNextInstrOut: %h\nInstrOut: %h\n", ALUOut, SumOut, ZeroOrNotOut, NextInstructionOut, NextInstrAddressOut, DataWriteValOut, WB_RAOut, RegWriteOut, MemWriteEnOut, AdderAddOut, MemReadEnOut, WBDestOut, MemModeOut, NextInstrOut, InstrOut);
        

        $finish;
    end
endmodule
