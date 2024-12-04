`ifndef memacc
`define memacc
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
    output reg [31:0] MemoryRead_out ,
    output reg [31:0] immExtended_out ,
    output reg [31:0] ALU_out ,
    output reg [31:0] NextInstrAddress_out ,
    output reg [31:0] FullInstruction_out ,
    output reg WBDest_out,
    output reg AdderAdd_out,
    output reg RegWrite_out,
    output reg NextInstrAddressFlag_out
);

localparam ENDVAL = 3;
reg [0:0] Sum_out_reg [0:ENDVAL];
reg [0:0] NextInstr_out_reg [0:ENDVAL];
reg [0:0] DataWriteVal_out_reg [0:ENDVAL];
reg [0:0] wb_ra_out_reg [0:ENDVAL];
reg [31:0] InstrAdd_out_reg [0:ENDVAL];
reg [31:0] MemoryRead_out_reg [0:ENDVAL];
reg [31:0] immExtended_out_reg [0:ENDVAL];
reg [31:0] ALU_out_reg [0:ENDVAL];
reg [31:0] NextInstrAddress_out_reg [0:ENDVAL];
reg [31:0] FullInstruction_out_reg [0:ENDVAL];
reg [0:0] WBDest_out_reg [0:ENDVAL];
reg [0:0] AdderAdd_out_reg [0:ENDVAL];
reg [0:0] RegWrite_out_reg [0:ENDVAL];
reg [0:0] NextInstrAddressFlag_out_reg [0:ENDVAL];
wire [31:0] MemoryRead_out_sig;
wire [31:0] InstrAdd_out_sig;



ThreeStageMem datamemory(
    .Addr(ReadAddr[14:2]), 
    .WData(rt_dat), 
    .clk(Clk), 
    .MemWrite(MemWriteEn), 
    .MemRead(MemoryRead_out_sig)
);

reg AdderAdd_out_sig;
integer j;
always @(*) begin
    if (!rst) begin
        case (ForceInstr) 
            3'd0: AdderAdd_out_reg[0] <= 0;
            3'd1: AdderAdd_out_reg[0] <= 1;
            3'd2: AdderAdd_out_reg[0] <= ZeroOrNot;
            3'd3: AdderAdd_out_reg[0] <= ReadAddr[0];
            3'd4: AdderAdd_out_reg[0] <= ZeroOrNot | ReadAddr[0];
            3'd5: AdderAdd_out_reg[0] <= ZeroOrNot & ReadAddr[0];
            default: AdderAdd_out_reg[0] <= 0;
        endcase
        for (j = 0; j < ENDVAL; j = j + 1) begin
            AdderAdd_out_reg[j+1] <= AdderAdd_out_reg[j];
        end
    end else begin
        for (j = 0; j <= ENDVAL; j = j + 1) begin
            AdderAdd_out_reg[j] <= 0;
        end
    end
end

always @(posedge Clk) begin
    if (!rst) begin
        AdderAdd_out <= AdderAdd_out_reg[3];
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
always @(posedge Clk) begin
    InstrAdd_out_reg[0] = (AdderAdd_out_sig) ? ReadAddr : immExtended;
end


integer i;
always @(posedge Clk) begin
    if (rst) begin
        for (i = 0; i <= ENDVAL; i = i + 1) begin
            Sum_out_reg[i] <= 0;
            NextInstr_out_reg[i] <= 0;
            NextInstrAddress_out_reg[i] <= 0;
            DataWriteVal_out_reg[i] <= 0;
            wb_ra_out_reg[i] <= 0;
            InstrAdd_out_reg[i] <= 0; // new mux
            MemoryRead_out_reg[i] <= 0;
            immExtended_out_reg[i] <= 0;
            ALU_out_reg[i] <= 0;
            FullInstruction_out_reg[i] <= 0;
            WBDest_out_reg[i] <= 0;
            RegWrite_out_reg[i] <= 0;
            NextInstrAddressFlag_out_reg[i] <= 0;
            MemoryRead_out_reg[i] <= 0;
        end
        Sum_out <= 0;
        NextInstr_out <= 0;
        DataWriteVal_out <= 0;
        wb_ra_out <= 0;
        InstrAdd_out <= 0; 
        MemoryRead_out <= 0; 
        immExtended_out <= 0; 
        ALU_out <= 0; 
        NextInstrAddress_out <= 0; 
        FullInstruction_out <= 0; 
        WBDest_out <= 0;
        AdderAdd_out <= 0;
        RegWrite_out <= 0;
        NextInstrAddressFlag_out <= 0;
    end else begin
        Sum_out <= Sum_out_reg[ENDVAL];
        NextInstr_out <= NextInstr_out_reg[ENDVAL];
        NextInstrAddress_out <= NextInstrAddress_out_reg[ENDVAL];
        DataWriteVal_out <= DataWriteVal_out_reg[ENDVAL];
        wb_ra_out <= wb_ra_out_reg[ENDVAL];
        InstrAdd_out <= InstrAdd_out_reg[ENDVAL];
        MemoryRead_out <= MemoryRead_out_sig;
        immExtended_out <= immExtended_out_reg[ENDVAL];
        ALU_out <= ALU_out_reg[ENDVAL];
        NextInstrAddress_out <= NextInstrAddress_out_reg[ENDVAL];
        FullInstruction_out <= FullInstruction_out_reg[ENDVAL];
        WBDest_out <= WBDest_out_reg[ENDVAL];
        RegWrite_out <= RegWrite_out_reg[ENDVAL];
        NextInstrAddressFlag_out <= NextInstrAddressFlag_out_reg[ENDVAL];

        Sum_out_reg[0] <= Sum;
        NextInstr_out_reg[0] <= NextInstr;
        NextInstrAddress_out_reg[0] <= NextInstrAddress;
        DataWriteVal_out_reg[0] <= DataWriteVal;
        wb_ra_out_reg[0] <= wb_ra;
        immExtended_out_reg[0] <= immExtended;
        ALU_out_reg[0] <= ReadAddr;
        NextInstrAddress_out_reg[0] <= NextInstrAddress;
        FullInstruction_out_reg[0] <= FullInstruction;
        WBDest_out_reg[0] <= WBDest;
        RegWrite_out_reg[0] <= RegWrite;
        NextInstrAddressFlag_out_reg[0] <= NextInstrAddressFlag;

        MemoryRead_out <= MemoryRead_out_sig;
        for(i = 0; i < ENDVAL; i = i + 1) begin
            Sum_out_reg[i + 1] <= Sum_out_reg[i];
            NextInstr_out_reg[i + 1] <= NextInstr_out_reg[i];
            NextInstrAddress_out_reg[i + 1] <= NextInstrAddress_out_reg[i];
            DataWriteVal_out_reg[i + 1] <= DataWriteVal_out_reg[i];
            wb_ra_out_reg[i + 1] <= wb_ra_out_reg[i];
            InstrAdd_out_reg[i + 1] <= InstrAdd_out_reg[i];
            MemoryRead_out_reg[i + 1] <= MemoryRead_out_reg[i];
            immExtended_out_reg[i + 1] <= immExtended_out_reg[i];
            ALU_out_reg[i + 1] <= ALU_out_reg[i];
            FullInstruction_out_reg[i + 1] <= FullInstruction_out_reg[i];
            WBDest_out_reg[i + 1] <= WBDest_out_reg[i];
            RegWrite_out_reg[i + 1] <= RegWrite_out_reg[i];
            NextInstrAddressFlag_out_reg[i + 1] <= NextInstrAddressFlag_out_reg[i];
            MemoryRead_out_reg[i + 1] <= MemoryRead_out_reg[i];
        end

    end
    
end


endmodule
`endif
