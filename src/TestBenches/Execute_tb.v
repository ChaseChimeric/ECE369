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
        funct = 6'b000000;  // R-type
        op = 6'b100000;  // ADD
        Instr = {funct, 5'b0, 5'b0, 5'b0, 5'b0, op}; // Some example instruction
        DataAtInstr25_21In = 32'h00000005;
        DataAtInstr20_16In = 32'h00000003;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("Test Case 1: R-type ADD");
        $display("ALUOut: %h", ALUOut);
        $display("SumOut: %b", SumOut);
        $display("ZeroOrNot: %b", ZeroOrNotOut);
        $display("NextInstructionOut: %b", NextInstructionOut);
        $display("NextInstrAddressOut: %h", NextInstrAddressOut);
        $display("DataWriteValOut: %h", DataWriteValOut);
        $display("WB_RAOut: %b", WB_RAOut);
        $display("RegWriteOut: %b", RegWriteOut);
        $display("MemWriteEnOut: %b", MemWriteEnOut);
        $display("AdderAddOut: %b", AdderAddOut);
        $display("MemReadEnOut: %b", MemReadEnOut);
        $display("WBDestOut: %b", WBDestOut);
        $display("MemModeOut: %b", MemModeOut);
        $display("NextInstrOut: %h", NextInstrOut);
        $display("InstrOut: %h", InstrOut);
        
        #100
        
        // Test scenario 1: R-type instruction (AND)
        funct = 6'b000000;  // R-type
        op = 6'b100100;  // AND
        Instr = {funct, 5'b0, 5'b0, 5'b0, 5'b0, op};
        DataAtInstr25_21In = 32'hFF00FF00;
        DataAtInstr20_16In = 32'hF0F0F0F0;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("Test Case 1: R-type AND");
        $display("ALUOut: %h", ALUOut);
        $display("SumOut: %b", SumOut);
        $display("ZeroOrNot: %b", ZeroOrNotOut);
        $display("NextInstructionOut: %b", NextInstructionOut);
        $display("NextInstrAddressOut: %h", NextInstrAddressOut);
        $display("DataWriteValOut: %h", DataWriteValOut);
        $display("WB_RAOut: %b", WB_RAOut);
        $display("RegWriteOut: %b", RegWriteOut);
        $display("MemWriteEnOut: %b", MemWriteEnOut);
        $display("AdderAddOut: %b", AdderAddOut);
        $display("MemReadEnOut: %b", MemReadEnOut);
        $display("WBDestOut: %b", WBDestOut);
        $display("MemModeOut: %b", MemModeOut);
        $display("NextInstrOut: %h", NextInstrOut);
        $display("InstrOut: %h", InstrOut);
        
        // Test scenario 2: Load Word instruction (LW)
        funct = 6'b100011;  // LW
        op = 6'b0;  // Not relevant for LW
        Instr = 32'h8C220000;  // Example LW instruction

        #100;  // Wait for one clock cycle
        
        #100
        
        // Test scenario 1: R-type instruction (SUB)
        funct = 6'b000000;  // R-type
        op = 6'b100010;  // SUB
        Instr = {funct, 5'b0, 5'b0, 5'b0, 5'b0, op};
        DataAtInstr25_21In = 32'h00000009;
        DataAtInstr20_16In = 32'h00000004;

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("Test Case 1: R-type SUB");
        $display("ALUOut: %h", ALUOut);
        $display("SumOut: %b", SumOut);
        $display("ZeroOrNot: %b", ZeroOrNotOut);
        $display("NextInstructionOut: %b", NextInstructionOut);
        $display("NextInstrAddressOut: %h", NextInstrAddressOut);
        $display("DataWriteValOut: %h", DataWriteValOut);
        $display("WB_RAOut: %b", WB_RAOut);
        $display("RegWriteOut: %b", RegWriteOut);
        $display("MemWriteEnOut: %b", MemWriteEnOut);
        $display("AdderAddOut: %b", AdderAddOut);
        $display("MemReadEnOut: %b", MemReadEnOut);
        $display("WBDestOut: %b", WBDestOut);
        $display("MemModeOut: %b", MemModeOut);
        $display("NextInstrOut: %h", NextInstrOut);
        $display("InstrOut: %h", InstrOut);
        
        // Test scenario 2: Load Word instruction (LW)
        funct = 6'b100011;  // LW
        op = 6'b0;  // Not relevant for LW
        Instr = 32'h8C220000;  // Example LW instruction

        #100;  // Wait for one clock cycle
        
        // Observe the outputs
        $display("Test Case 2: Load Word (LW)");
        $display("ALUOut: %h", ALUOut);
        $display("SumOut: %b", SumOut);
        $display("ZeroOrNot: %b", ZeroOrNotOut);
        $display("NextInstructionOut: %b", NextInstructionOut);
        $display("NextInstrAddressOut: %h", NextInstrAddressOut);
        $display("DataWriteValOut: %h", DataWriteValOut);
        $display("WB_RAOut: %b", WB_RAOut);
        $display("RegWriteOut: %b", RegWriteOut);
        $display("MemWriteEnOut: %b", MemWriteEnOut);
        $display("AdderAddOut: %b", AdderAddOut);
        $display("MemReadEnOut: %b", MemReadEnOut);
        $display("WBDestOut: %b", WBDestOut);
        $display("MemModeOut: %b", MemModeOut);
        $display("NextInstrOut: %h", NextInstrOut);
        $display("InstrOut: %h", InstrOut);

        $finish;
    end
endmodule
