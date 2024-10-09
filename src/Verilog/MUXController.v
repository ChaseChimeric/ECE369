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

            // slt
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
                Sign <= 0;
                AdderAdd <= 0;
                sh_amt <= ((op == 6'000010) | (op == 6'000000))
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