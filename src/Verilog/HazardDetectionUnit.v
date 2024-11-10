`ifndef hazarddetectionunit
`define hazarddetectionunit
module HazardDetectionUnit (
    input[31:0] InstructionInDecode,
    input[31:0] InstructionInMemory,
    input[31:0] InstructionInExecute,
    input[31:0] InstructionInWB,
    output reg stall
);
//Dependency if original if there is an R-Type in the pipeline
always @ (*) begin
    if(InstructionInMemory[31:26]== 6'b000000 || InstructionInWB[31:26]== 6'b000000 ||  InstructionInExecute[31:26] == 6'b000000 )
    begin
            if(InstructionInDecode[31:26]== 6'b000000 && //Instruction is R- Type 
            ((InstructionInDecode[25:21] == InstructionInMemory[15:11]) ||//Dependency Check
             (InstructionInDecode[25:21] == InstructionInWB[15:11]) ||//Dependency check
             (InstructionInDecode[25:21] == InstructionInExecute[15:11]) ||//Dependency check
             ((InstructionInDecode[20:16] == InstructionInMemory[15:11]) ||//Dependency Check
             (InstructionInDecode[20:16] == InstructionInWB[15:11]) ||//Dependency check
             (InstructionInDecode[20:16] == InstructionInExecute[15:11]))))//Dependency check

            begin
                stall = 1;
            end
            if((
                InstructionInDecode[31:26]==6'b001000 || //ADDI
                InstructionInDecode[31:26]==6'b001100 || //ANDI     
                InstructionInDecode[31:26]==6'b001110 || //XORI     
                InstructionInDecode[31:26]==6'b001101 || //ORI     
                InstructionInDecode[31:26]==6'b001010 || //SLTI     
                InstructionInDecode[31:26]==6'b100011 || //LW     
                InstructionInDecode[31:26]==6'b100001 || //LH     
                InstructionInDecode[31:26]==6'b100000    //LB     
            ) &&
             ((InstructionInDecode[25:21] == InstructionInMemory[15:11]) ||//Dependency Check
             (InstructionInDecode[25:21] == InstructionInWB[15:11]) ||//Dependency check
             (InstructionInDecode[25:21] == InstructionInExecute[15:11])))//Dependency check
              
            begin
                stall = 1;
            end     
    end
else begin
    stall = 0;
end
end
    
endmodule
`endif