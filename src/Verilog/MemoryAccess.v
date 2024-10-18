module MemoryAccess(
    input Clk,
    input Sum,
    input NextInstr,
    //input NextInstrAddress,
    input DataWriteVal,
    input wb_ra,
    input [1:0] MemMode ,
    input [31:0] ReadAddr , //from ALUOut
    input ZeroOrNot,
    input [1:0] ForceInstr ,
    input [31:0] rt_dat , // instruction 20:16 DATA AT INStrUCTION
    input [15:0] immExtended , // instruction 15:0
    // alu again but to output
    input [31:0] NextInstrAddress ,
    input [31:0] FullInstruction,
    input WBDest,
    input MemReadEn,
    input MemWriteEn,
    input AdderAdd,
    input RegWrite,

    output reg Sum_out,
    output reg NextInstr_out,
    output reg DataWriteVal_out,
    output reg wb_ra_out,
    output reg [31:0] InstrAdd_out ,
    output reg [31:0] MemoryRead_out , //from ALUOut
    output reg [15:0] immExtended_out , // instruction 16:0
    output reg [31:0] ALU_out ,
    output reg [31:0] NextInstrAddress_out ,
    output reg [31:0]FullInstruction_out ,
    output reg WBDest_out,
    output reg AdderAdd_out,
    output reg RegWrite_out
);


wire AdderAdd_out_sig;
wire MemoryRead_out_sig;
wire InstrAdd_out_sig;



DataMemory datamemory(
    .Address(ReadAddr), 
    .WriteData(rt_dat), 
    .Clk(Clk), 
    .MemWrite(MemWriteEn), 
    .MemRead(MemReadEn), 
    .ReadData(MemoryRead) // add wire?
);

Mux32Bit4to1 mux4(
    .in0(1'b0),
    .in1(1'b1),
    .in2(ZeroOrNot),
    .in3(ReadAddr),
    .sel(ForceInstr),
    .mux_out(AdderAdd)

);

Mux32Bit2To1 mux2(
    .in0(FullInstruction),
    .in1(ReadAddr),
    .sel(AdderAdd),
    .mux_out(InstrAdd)

);



always @(*) begin
    Sum_out <= Sum;
    NextInstr_out <= NextInstr;
    NextInstrAddress_out <= NextInstrAddress;
    DataWriteVal_out <= DataWriteVal;
    wb_ra_out <= wb_ra;
    InstrAdd_out <= InstrAdd_out_sig; //new mux
    AdderAdd_out <= AdderAdd_out_sig;
    MemoryRead_out <= MemoryRead_out_sig;
    immExtended_out <= immExtended;
    ALU_out <= ReadAddr;
    NextInstrAddress_out <= NextInstrAddress;
    FullInstruction_out <= FullInstruction;
    WBDest_out <= WBDest;
    RegWrite_out <= RegWrite;
    

end


endmodule