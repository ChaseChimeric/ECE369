`ifndef hazarddetectionunit
`define hazarddetectionunit
module HazardDetectionUnit (
    input[31:0] InstructionInDecode;
    input[31:0] InstuctionInMemory;
    input[31:0] InstuctionInExecute;
    input[31:0] InstructionInWB;
    output stall;
);
//Dependency if original if there is an R-Type in the pipeline
if(InstructionInMemory[31:26]==0'b000000 || InstructionInWB[31:26]==0'b000000 || [31:26] InstuctionInExecute == 0'b000000 ){
    if(InstructionInDecode[31:26]==0'b000000 && //Instruction is R- Type 
     ((InstructionInDecode[25:21]||InstructionInDecode[20:16]) == //Checks dependency  on either instruction
     (InstructionInMemory[15:11] || InstructionInWB[15:11] || InstructionInExecute[15:11] ) ) ){
        stall = 1;
     }
     if((
        InstructionInDecode[31:26]==0'b001000 || //ADDI
        InstructionInDecode[31:26]==0'b001100 || //ANDI     
        InstructionInDecode[31:26]==0'b001110 || //XORI     
        InstructionInDecode[31:26]==0'b001101 || //ORI     
        InstructionInDecode[31:26]==0'b001010 || //SLTI     
        InstructionInDecode[31:26]==0'b100011 || //LW     
        InstructionInDecode[31:26]==0'b100001 || //LH     
        InstructionInDecode[31:26]==0'b100000 || //LB     
     ) && InstructionInDecode[25:21] == //Value to be used with immediate is equal to possible dependency
     (InstructionInMemory[15:11] || InstructionInWB[15:11] || InstructionInExecute[15:11])        ){
        stall = 1;
     }
     if((
        InstructionInDecode[31:26]==0'b101011 || //SW
        InstructionInDecode[31:26]==0'b101001 || //SH     
        InstructionInDecode[31:26]==0'b101000 || //SB
     ) && InstructionInDecode[20:16] == 
     (InstructionInMemory[15:11] || InstructionInExecute[15:11])  
     )
}
    
endmodule
`endif