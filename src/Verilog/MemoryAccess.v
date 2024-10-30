`ifndef _memoryaccess
`define _memoryaccess
`include "DataMemory.v"
module MemoryAccess(
    input Clk,
    input Sum,
    input rst,
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
    output reg [31:0] FullInstruction_out ,
    output reg WBDest_out,
    output reg AdderAdd_out,
    output reg RegWrite_out,
    output reg NextInstrAddressFlag_out
);


wire [31:0] MemoryRead_out_sig;
wire [31:0] InstrAdd_out_sig;



DataMemory datamemory(
    .Address(ReadAddr), 
    .WriteData(rt_dat), 
    .Clk(Clk), 
    .MemWrite(MemWriteEn), 
    .MemRead(MemReadEn), 
    .ReadData(MemoryRead_out_sig), // add wire?
    .MemMode(MemMode),
    .WriteAddress(ReadAddr)
);

reg AdderAdd_out_sig;
always @(*) begin
    case (ForceInstr) 
        3'd0: AdderAdd_out_sig <= 0;
        3'd1: AdderAdd_out_sig <= 1;
        3'd2: AdderAdd_out_sig <= ZeroOrNot;
        3'd3: AdderAdd_out_sig <= ReadAddr[0];
        3'd4: AdderAdd_out_sig <= ZeroOrNot | ReadAddr[0];
        3'd5: AdderAdd_out_sig <= ZeroOrNot & ReadAddr[0];
        default: AdderAdd_out_sig <= 0;
    endcase
end

always @(posedge Clk) begin
    if (!rst) begin
        AdderAdd_out <= AdderAdd_out_sig;
    end else begin
        AdderAdd_out <= 0;
    end
end

//Mux32Bit2To1 mux2(
//    .in0(immExtended),
//    .in1(ReadAddr),
//    .sel(AdderAdd_out_sig),
//    .mux_out(InstrAdd_out_sig)

//);
assign InstrAdd_out_sig = (AdderAdd_out_sig) ? ReadAddr : immExtended;



always @(posedge Clk) begin
    if (rst) begin
        Sum_out <= 0;
        NextInstr_out <= 0;
        NextInstrAddress_out <= 0;
        DataWriteVal_out <= 0;
        wb_ra_out <= 0;
        InstrAdd_out <= 0; // new mux
        MemoryRead_out <= 0;
        immExtended_out <= 0;
        ALU_out <= 0;
        FullInstruction_out <= 0;
        WBDest_out <= 0;
        RegWrite_out <= 0;
        NextInstrAddressFlag_out <= 0;
        MemoryRead_out <= 0;
    end else begin
        Sum_out <= Sum;
        NextInstr_out <= NextInstr;
        NextInstrAddress_out <= NextInstrAddress;
        DataWriteVal_out <= DataWriteVal;
        wb_ra_out <= wb_ra;
        InstrAdd_out <= InstrAdd_out_sig; //new mux
        MemoryRead_out <= MemoryRead_out_sig;
        immExtended_out <= immExtended;
        ALU_out <= ReadAddr;
        //ALU_out <= ReadAddr;
        NextInstrAddress_out <= NextInstrAddress;
        FullInstruction_out <= FullInstruction;
        WBDest_out <= WBDest;
        RegWrite_out <= RegWrite;
        NextInstrAddressFlag_out <= NextInstrAddressFlag;
        MemoryRead_out <= MemoryRead_out_sig;
    end
    
end

endmodule
`endif