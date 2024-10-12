module MUXController (
    funct,
    op,
    ForceInstr,
    ZeroInverted,
    Inverted,
    Sum,
    NextInstr,
    NextInstrAddress,
    DataWriteVal,
    inA,
    ALUImmReg,
    WB_RA,
    WBDest,
    Sign,
    sh_amt,
    branchZeroVal
);
    input [5:0] funct, op, branchZeroVal;
    output reg ForceInstr, 
               ZeroInverted, 
               Inverted,
               Sum,
               NextInstr,
               NextInstrAddress,
               DataWriteVal,
               inA,
               ALUImmReg,
               WB_RA,
               WBDest,
               Sign,
               sh_amt;

    localparam X = 0;
    always @(*) begin
        case ({funct})
            // R-type, ADD, NOR, AND, OR, XOR, SLL, SRL, SLT, SUB, MUL
            6'b000000: begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= (op == 6'b100111);
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 1;
                inA <= 0;
                ALUImmReg <= 0;
                WB_RA <= 0;
                WBDest <= 0;
                Sign <= (op == 101010);
                sh_amt <= ((op == 6'000010) | (op == 6'000000));
            end

            // J
            6'b000010: begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= X;
                DataWriteVal <= X;
                inA <= X;
                ALUImmReg <= X;
                WB_RA <= X;
                WBDest <= X;
                Sign <= X;
                sh_amt <= X;
            end

            // JR
            6'b000010: begin
                ForceInstr <= 1;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0;
                NextInstr <= 1;
                NextInstrAddress <= X;
                DataWriteVal <= X;
                inA <= 1;
                ALUImmReg <= X;
                WB_RA <= X;
                WBDest <= X;
                Sign <= 0;
                sh_amt <= X;
            end

            // JAL
            6'b000011: begin
                ForceInstr <= 1;
                ZeroInverted <= X;
                Inverted <= X;
                Sum <= 1;
                NextInstr <= 0;
                NextInstrAddress <= 1;
                DataWriteVal <= X;
                inA <= X;
                ALUImmReg <= X;
                WB_RA <= 1;
                WBDest <= X;
                Sign <= X;
                sh_amt <= X;
            end
            
            // Addi Instruction
            6'b001000 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1;
                WB_RA <= 0;
                WBDest <= 0;
                Sign <= 0;
                sh_amt <= 0;
            end

            // Slti Instruction
            6'b001010 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 1;
                inA <= 0;
                ALUImmReg <= 1;
                WB_RA <= 0;
                WBDest <= 1;
                Sign <= 1;
                sh_amt <= 0;
            end

            // Andi Instruction
            6'b001100 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1;
                WB_RA <= 0;
                WBDest <= 0;
                Sign <= 0;
                sh_amt <= 0;
            end

            // Ori Instruction
            6'b001101 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1;
                WB_RA <= 0;
                WBDest <= 0;
                Sign <= 0;
                sh_amt <= 0;
            end

            // XORI Instruction
            6'b001110 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1;
                WB_RA <= 0;
                WBDest <= 0;
                Sign <= 0;
                sh_amt <= 0;
            end

            // Load Types
            // Load Word LW
            6'b100011: begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1; 
                WB_RA <= 0;
                WBDest <= 1;
                Sign <= 0;
                sh_amt <= 0;
            end

            // LH
            6'b100001: begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1; 
                WB_RA <= 0;
                WBDest <= 1;
                Sign <= 0;
                sh_amt <= 0;
            end

            // LB
            6'b100000: begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 0;
                inA <= 0;
                ALUImmReg <= 1; 
                WB_RA <= 0;
                WBDest <= 1;
                Sign <= 0;
                sh_amt <= 0;
            end

            // Store Type
            // Store Word SW
            6'b101011 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 1;
                inA <= 0;
                ALUImmReg <= 1; 
                WB_RA <= X;
                WBDest <= X;
                Sign <= 0;
                sh_amt <= 0;
            end

            // Store HalfWord SH
            6'b101001 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 1;
                inA <= 0;
                ALUImmReg <= 1; 
                WB_RA <= X;
                WBDest <= X;
                Sign <= 0;
                sh_amt <= 0;
            end

            // Store Byte SB
            6'b101000 begin
                ForceInstr <= 0;
                ZeroInverted <= X;
                Inverted <= 0;
                Sum <= 0
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 1;
                inA <= 0;
                ALUImmReg <= 1; 
                WB_RA <= X;
                WBDest <= X;
                Sign <= 0;
                sh_amt <= 0;
            end

            // BEQ
            6'b000010: begin
                ForceInstr <= 2;
                ZeroInverted <= 0;
                Inverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= X;
                DataWriteVal <= X;
                inA <= 0;
                ALUImmReg <= 0;
                WB_RA <= X;
                WBDest <= X;
                Sign <= X;
                sh_amt <= 0;
            end

            // BNE
            6'b000010: begin
                ForceInstr <= 2;
                ZeroInverted <= 1;
                Inverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= X;
                DataWriteVal <= X;
                inA <= 0;
                ALUImmReg <= 0;
                WB_RA <= X;
                WBDest <= X;
                Sign <= 0;
                sh_amt <= 0;
            end

            // BGEZ and BLTZ and BLEZ and BGTZ
            6'b000001: begin
                ForceInstr <= (branchZeroVal == 5'd0) ? 5 : 3;
                Inverted <= (branchZeroVal == 5'b00001); // 1 for BGEZ, 0 for BLTZ
                ZeroInverted <= 1;
                Sum <= 0;
                NextInstr <= 0
                NextInstrAddress <= X;
                DataWriteVal <= X;
                inA <= 1;
                ALUImmReg <= X;
                WB_RA <= X;
                WBDest <= 0;
                Sign <= 1;
                sh_amt <= 0;
            end

            // Unsupported Instruction, treated like R-type
            default: begin
                ForceInstr <= X;
                ZeroInverted <= X;
                Sum <= 0;
                NextInstr <= 0;
                NextInstrAddress <= 0;
                DataWriteVal <= 1;
                inA <= 0;
                ALUImmReg <= 0;
                WB_RA <= 0;
                WBDest <= 0;
                Sign <= 0;
                sh_amt <= 0;
            end
        endcase
    end
    
endmodule