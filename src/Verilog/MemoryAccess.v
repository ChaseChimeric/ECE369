module MemoryAccess(
    input Clk,
    input Sum,
    input NextInstr,
    //input NextInstrAddress,
    input DataWriteVal,
    input wb_ra,
    input MemMode [1:0],
    input ReadAddr [31:0], //from ALUOut
    input ZeroOrNot,
    input ForceInstr [1:0],
    input rt_dat [31:0], // instruction 20:16 DATA AT INStrUCTION
    input immExtended [15:0], // instruction 15:0
    // alu again but to output
    input NextInstrAddress [31:0],
    input FullInstruction [31:0],
    input WBDest,
    input MemReadEn,
    input MemWriteEn,
    input AdderAdd,
    input RegWrite,

    output reg Sum_out,
    output reg NextInstr_out,
    output reg NextInstrAddress_out,
    output reg DataWriteVal_out,
    output reg wb_ra_out,
    output reg InstrAdd_out [31:0],
    output reg AdderAdd_out,
    output reg MemoryRead_out [31:0], //from ALUOut
    output reg immExtended_out [15:0], // instruction 16:0
    output reg ALU_out [31:0],
    output reg NextInstrAddress_out [31:0],
    output reg FullInstruction_out [31:0],
    output reg WBDest_out,
    output reg AdderAdd_out,
    output reg RegWrite_out,
);

wire AdderAdd_sig;
wire MemoryRead_sig;
wire InstrAdd_sig;


DataMemory datamemory(
    .Address(ReadAddr), 
    .WriteData(rt_dat), 
    .Clk(Clk), 
    .MemWrite(MemWriteEn), 
    .MemRead(MemReadEn), 
    .ReadData(MemoryRead_sig) // add wire?
);

Mux32Bit4to1 mux4(
    .in0(1'b0),
    .in1(1'b1),
    .in2(ZeroOrNot),
    .in3(ReadAddr),
    .sel(ForceInstr),
    .mux_out(AdderAdd_sig)

);

Mux32Bit2To1 mux2(
    .in0(FullInstruction),
    .in1(ReadAddr),
    .sel(AdderAdd_sig),
    .mux_out(InstrAdd_sig)

);



always @(*) begin
    Sum_out <= Sum;
    NextInstr_out <= NextInstr;
    NextInstrAddress_out <= NextInstrAddress;
    DataWriteVal_out <= DataWriteVal;
    wb_ra_out <= wb_ra;
    InstrAdd_out <= //new mux
    AdderAdd_out <= AdderAdd_sig;
    MemoryRead_out <= MemoryRead_sig;
    immExtended_out <= immExtended;
    ALU_out <= ReadAddr;
    NextInstrAddress_out <= NextInstrAddress;
    FullInstruction_out <= FullInstruction;
    WBDest_out <= WBDest;
    RegWrite_out <= RegWrite;
end


endmodule