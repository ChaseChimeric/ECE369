module WriteBack (
    input [31:0] MemoryRead,
    input [31:0] ALUOut,
    input [31:0] ImmediateExtended,
    input [31:0] Instruction,
    input [31:0] InstrAdd,
    input [31:0] NextInstructionAddress,
    input RegWriteEnabled,
    input AdderAdd,
    input WB_RA, 
    input NextInstrAddress,
    input WBDest,
    input NextInstr,
    input Sum,
    input DataWriteVal,
    output reg [31:0] WriteData,
    output reg [31:0] InstrAddOut,
    output reg [31:0] ImmediateExtendedOut,
    output reg [4:0] WriteRegister,
    output reg SumOut,
    output reg AdderAddOut,
    output reg NextInstrOut,
    output reg RegWriteEnabledOut
);
    reg [31:0] DataWriteValMuxOut;
    reg [31:0] NextInstrAddressMuxOut;
    always @(*) begin
        DataWriteValMuxOut <= (DataWriteVal) ? ALUOut : MemoryRead;
        NextInstrAddressMuxOut <= (NextInstrAddress) ? NextInstructionAddress : DataWriteValMuxOut;
        WriteData <= NextInstrAddressMuxOut;
    end

    reg [4:0] WBDest_rt_rd;
    reg [4:0] WBDest_ra_rt_rd;
    always @(*) begin
        WBDest_rt_rd <= (WBDest) ? Instruction[20:16] : Instruction[15:11];
        WBDest_ra_rt_rd <= (WB_RA) ? (5'b11111) :  WBDest_rt_rd;
        WriteRegister <= WBDest_ra_rt_rd;
    end

    always @(*) begin
        ImmediateExtendedOut <= ImmediateExtended;
        SumOut <= Sum;
        AdderAddOut <= AdderAdd;
        NextInstrOut <= NextInstr;
        InstrAddOut <= InstrAdd;
        RegWriteEnabledOut <= RegWriteEnabled;
    end
    
    
endmodule