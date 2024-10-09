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
    AdderAdd
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
               AdderAdd;

    always @(*) begin
        case ({funct, op})
            default: ZeroInverted = 0;
        endcase
    end
    
endmodule