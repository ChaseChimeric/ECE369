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
    AdderAdd,
    sh_amt
);
    input [5:0] funct, op;
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
               AdderAdd,
               sh_amt;

    localparam X = 0;
    always @(*) begin
        case ({funct})
            // R-type
            6'b000000: begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= ((op == 6'000010) | (op == 6'000000))
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
                AdderAdd <= 1;
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
                AdderAdd <= 1;
                sh_amt <= X;
            end
            
            // Addi Instruction
            6'b001000 begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // Slti Instruction
            6'b001010 begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // Andi Instruction
            6'b001100 begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // Ori Instruction
            6'b001101 begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // XORI Instruction
            6'b001110 begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // Load Types
            // Load Word
            6'b100011: begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // LH
            6'b100001: begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // LB
            6'b100000: begin
                ForceInstr <= X;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end

            // Store Type
            // Store Word
            6'b101011 begin
                ForceInstr <= X;
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
                AdderAdd <= 1;
                sh_amt <= 0;
            end

            // Store HalfWord
            6'b101001 begin
                ForceInstr <= X;
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
                AdderAdd <= 1;
                sh_amt <= 0;
            end

            // Store Byte
            6'b101000 begin
                ForceInstr <= X;
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
                AdderAdd <= 1;
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
                AdderAdd <= 0;
                sh_amt <= 0;
            end
        endcase
    end
    
endmodule