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
    input [2:0] ForceInstr ,
    input [31:0] rt_dat , // instruction 20:16 DATA AT INStrUCTION
    input [31:0] immExtended , // instruction 15:0
    // alu again but to output
    input [31:0] NextInstrAddress ,
    input [31:0] FullInstruction,
    input WBDest,
    input MemReadEn,
    input MemWriteEn,
    input AdderAdd,
    input RegWrite,
    input NextInstrAddressFlag,

    output reg Sum_out,
    output reg NextInstr_out,
    output reg DataWriteVal_out,
    output reg wb_ra_out,
    output reg [31:0] InstrAdd_out ,
    output reg [31:0] MemoryRead_out , //from ALUOut
    output reg [31:0] immExtended_out , // instruction 16:0
    output reg [31:0] ALU_out ,
    output reg [31:0] NextInstrAddress_out ,
    output reg [31:0]FullInstruction_out ,
    output reg WBDest_out,
    output reg AdderAdd_out,
    output reg RegWrite_out,
    output reg NextInstrAddressFlag_out
);


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

always @(posedge Clk) begin
    case (ForceInstr) 
        3'd0: AdderAdd_out <= 0;
        3'd1: AdderAdd_out <= 1;
        3'd2: AdderAdd_out <= ZeroOrNot;
        3'd3: AdderAdd_out <= ReadAddr;
        3'd4: AdderAdd_out <= ZeroOrNot | ReadAddr;
        default: AdderAdd_out <= 0;
    endcase
end

Mux32Bit2To1 mux2(
    .in0(FullInstruction),
    .in1(ReadAddr),
    .sel(AdderAdd),
    .mux_out(InstrAdd)

);



always @(posedge Clk) begin
    Sum_out <= Sum;
    NextInstr_out <= NextInstr;
    NextInstrAddress_out <= NextInstrAddress;
    DataWriteVal_out <= DataWriteVal;
    wb_ra_out <= wb_ra;
    InstrAdd_out <= InstrAdd_out_sig; //new mux
    MemoryRead_out <= MemoryRead_out_sig;
    immExtended_out <= immExtended;
    ALU_out <= ReadAddr;
    ALU_out <= ReadAddr;
    NextInstrAddress_out <= NextInstrAddress;
    FullInstruction_out <= FullInstruction;
    WBDest_out <= WBDest;
    RegWrite_out <= RegWrite;
    NextInstrAddressFlag_out <= NextInstrAddressFlag;
end


endmodule