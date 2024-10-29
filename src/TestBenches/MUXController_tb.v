module MUXController_tb;

    // Inputs
    reg [5:0] funct;
    reg [5:0] op;
    reg [5:0] branchZeroVal;

    // Outputs
    wire ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt;
    wire ForceInstr;

    // Instantiate the Unit Under Test (UUT)
    MUXController uut (
        .funct(funct),
        .op(op),
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
        .sh_amt(sh_amt),
        .branchZeroVal(branchZeroVal)
    );

    initial begin
        // Initialize Inputs for ADD
        funct = 6'b000000;
        op = 6'b100000;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("Output with ADD instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for NOR
        funct = 6'b000000;
        op = 6'b100111;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with NOR instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for SUB
        funct = 6'b000000;
        op = 6'b100010;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SUB instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for AND
        funct = 6'b000000;
        op = 6'b100100;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with AND instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for XOR
        funct = 6'b100110;
        op = 6'b100100;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with XOR instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for OR
        funct = 6'b100101;
        op = 6'b100100;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with OR instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for ORI
        funct = 6'b001101;
        op = 6'b100100;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with ORI instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for SLL
        funct = 6'b000000;
        op = 6'b000000;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SLL instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                  ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);

        // Initialize Inputs for SLT
        funct = 6'b000000;
        op = 6'b101010;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SLT instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);


        // Initialize Inputs for MUL
        funct = 6'b011100;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with MUL instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
          

        // Initialize Inputs for J
        funct = 6'b000010;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with J instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        
        // Initialize Inputs for JR
        funct = 6'b000000;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with JR instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
                
        // Initialize Inputs for JAL
        funct = 6'b000011;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with JAL instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
                
        // Initialize Inputs for ADDI
        funct = 6'b001000;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with ADDI instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for ANDI
        funct = 6'b001100;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with ANDI instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for XORI
        funct = 6'b001110;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with XORI instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for SLTI
        funct = 6'b001010;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SLTI instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for LW
        funct = 6'b100011;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with LW instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for LH
        funct = 6'b100001;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with LH instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for LB
        funct = 6'b100000;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with LB instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for SW
        funct = 6'b101011;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SW instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for SH
        funct = 6'b101001;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SH instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for SB
        funct = 6'b101000;
        op = 6'b101001;
        branchZeroVal = 6'b001001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with SB instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for BGEZ
        funct = 6'b000001;
        op = 6'b101001;
        branchZeroVal = 6'b00001;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with BGEZ instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for BLTZ
        funct = 6'b000001;
        op = 6'b101001;
        branchZeroVal = 6'b00000;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with BLTZ instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        
        // Initialize Inputs for BLEZ
        funct = 6'b000110;
        op = 6'b101001;
        branchZeroVal = 6'b00000;

        // Wait for 100 ns to observe outputs
        #100;
        $display("Output with BLEZ instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for BGTZ
        funct = 6'b000111;
        op = 6'b101001;
        branchZeroVal = 6'b00000;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with BGTZ instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for BNE
        funct = 6'b000101;
        op = 6'b101001;
        branchZeroVal = 6'b00000;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with BNE instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        // Initialize Inputs for BEQ
        funct = 6'b000101;
        op = 6'b101001;
        branchZeroVal = 6'b00000;

        // Wait for 100 ns to observe outputs
        #100;
        $display("\n");
        $display("Output with BEQ instruction: \nZeroInverted: %b\nInverted: %b\nSum: %b\nNextInstr: %b\nNextInstrAddress: %b\nDataWriteVal: %b\ninA: %b\nALUImmReg: %b\nWB_RA: %b\nWBDest: %b\nSign: %b\nsh_amt: %b\nForceInstr: %b",
                ZeroInverted, Inverted, Sum, NextInstr, NextInstrAddress, DataWriteVal, inA, ALUImmReg, WB_RA, WBDest, Sign, sh_amt, ForceInstr);
        
        #100;
        $finish;
        
    end

endmodule
