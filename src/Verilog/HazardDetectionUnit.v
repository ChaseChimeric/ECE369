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
    if((InstructionInMemory[31:26]== 6'b000000    && InstructionInMemory[5:0]  == 6'b001000)|| 
       (InstructionInWB[31:26]== 6'b000000        && InstructionInWB[5:0]      == 6'b001000)||  
       (InstructionInExecute[31:26] == 6'b000000  && InstructionInExecute[5:0] == 6'b001000) )
       begin
        stall = 1;
       end
    else if(InstructionInMemory[31:26]== 6'b000000 || InstructionInWB[31:26]== 6'b000000 ||  InstructionInExecute[31:26] == 6'b000000 )
    begin
            if(InstructionInDecode[31:26] == 6'b000000 && //Instruction is R- Type 
            (( InstructionInDecode[25:21] == InstructionInMemory [15:11]) ||//Dependency Check
             ( InstructionInDecode[25:21] == InstructionInWB     [15:11]) ||//Dependency check
             ( InstructionInDecode[25:21] == InstructionInExecute[15:11]) ||//Dependency check
             ((InstructionInDecode[20:16] == InstructionInMemory[15:11])  ||//Dependency Check
             ( InstructionInDecode[20:16] == InstructionInWB     [15:11]) ||//Dependency check
             ( InstructionInDecode[20:16] == InstructionInExecute[15:11]))))//Dependency check

            begin
                stall = 1;
            end
            else if((
                InstructionInDecode[31:26]==6'b001000 || //ADDI
                InstructionInDecode[31:26]==6'b001100 || //ANDI     
                InstructionInDecode[31:26]==6'b001110 || //XORI     
                InstructionInDecode[31:26]==6'b001101 || //ORI     
                InstructionInDecode[31:26]==6'b001010 || //SLTI     
                InstructionInDecode[31:26]==6'b100011 || //LW     
                InstructionInDecode[31:26]==6'b100001 || //LH     
                InstructionInDecode[31:26]==6'b100000    //LB     
            ) &&
             ((InstructionInDecode[25:21] == InstructionInMemory [15:11]) ||//Dependency Check
             ( InstructionInDecode[25:21]  == InstructionInWB     [15:11]) ||//Dependency check
             ( InstructionInDecode[25:21]  == InstructionInExecute[15:11])))//Dependency check
              
            begin
                stall = 1;
            end 

            else if((
                InstructionInDecode[31:26]==6'b101011 || //SW
                InstructionInDecode[31:26]==6'b101001 || //SH    
                InstructionInDecode[31:26]==6'b101000  //SB
            ) &&
            ((InstructionInDecode[20:16] == InstructionInMemory[15:11]) ||//Dependency Check
             (InstructionInDecode[20:16] == InstructionInExecute[15:11])))

            begin
                stall = 1;
            end
            else 
            begin
                stall = 0;
            end   
    end
else if (InstructionInMemory[31:26] ==  6'b000001 ||
         InstructionInWB[31:26] ==      6'b000001 ||  
         InstructionInExecute[31:26] == 6'b000001 ||//BGEZ & BLTZ
         InstructionInMemory[31:26] ==  6'b000100 ||
         InstructionInWB[31:26] ==      6'b000100 ||  
         InstructionInExecute[31:26] == 6'b000100 ||//BEQ
         InstructionInMemory[31:26] ==  6'b000101 ||
         InstructionInWB[31:26] ==      6'b000101 ||  
         InstructionInExecute[31:26] == 6'b000101 ||//BNE
         InstructionInMemory[31:26] ==  6'b000111 ||
         InstructionInWB[31:26] ==      6'b000111 ||  
         InstructionInExecute[31:26] == 6'b000111 ||//BGTZ
         InstructionInMemory[31:26] ==  6'b000001 ||
         InstructionInWB[31:26] ==      6'b000001 ||  
         InstructionInExecute[31:26] == 6'b000001 ||//BLEZ
         InstructionInMemory[31:26] ==  6'b000010 ||
         InstructionInWB[31:26] ==      6'b000010 ||  
         InstructionInExecute[31:26] == 6'b000010 ||//J
         InstructionInMemory[31:26] ==  6'b000011 ||
         InstructionInWB[31:26] ==      6'b000011 ||  
         InstructionInExecute[31:26] == 6'b000011   //JAL
         )
 begin
    stall = 1;
end
else if ( InstructionInMemory[31:26] ==  6'b001000 ||
          InstructionInWB[31:26] ==      6'b001000 ||  
          InstructionInExecute[31:26] == 6'b001000 ||//ADDI
          InstructionInMemory[31:26] ==  6'b001100 ||
          InstructionInWB[31:26] ==      6'b001100 ||  
          InstructionInExecute[31:26] == 6'b001100 ||//ANDI
          InstructionInMemory[31:26] ==  6'b001110 ||
          InstructionInWB[31:26] ==      6'b001110 ||  
          InstructionInExecute[31:26] == 6'b001110 ||//XORI
          InstructionInMemory[31:26] ==  6'b001101 ||
          InstructionInWB[31:26] ==      6'b001101 ||  
          InstructionInExecute[31:26] == 6'b001101 ||//ORI
          InstructionInMemory[31:26] ==  6'b001010 ||
          InstructionInWB[31:26] ==      6'b001010 ||  
          InstructionInExecute[31:26] == 6'b001010 ||//SLTI
          InstructionInMemory[31:26] ==  6'b100011 ||
          InstructionInWB[31:26] ==      6'b100011 ||  
          InstructionInExecute[31:26] == 6'b100011 ||//LB
          InstructionInMemory[31:26] ==  6'b100001 ||
          InstructionInWB[31:26] ==      6'b100001 ||  
          InstructionInExecute[31:26] == 6'b100001 ||//LH
          InstructionInMemory[31:26] ==  6'b100000 ||
          InstructionInWB[31:26] ==      6'b100000 ||  
          InstructionInExecute[31:26] == 6'b100000)  //LW
 begin
            if(InstructionInDecode[31:26] == 6'b000000 && //Instruction is R- Type 
            (( InstructionInDecode[25:21] == InstructionInMemory [20:16]) ||//Dependency Check
             ( InstructionInDecode[25:21] == InstructionInWB     [20:16]) ||//Dependency check
             ( InstructionInDecode[25:21] == InstructionInExecute[20:16]) ||//Dependency check
             ((InstructionInDecode[20:16] == InstructionInMemory [20:16]) ||//Dependency Check
             ( InstructionInDecode[20:16] == InstructionInWB     [20:16]) ||//Dependency check
             ( InstructionInDecode[20:16] == InstructionInExecute[20:16]))))//Dependency check

            begin
                stall = 1;
            end
            else if((
                InstructionInDecode[31:26]==6'b001000 || //ADDI
                InstructionInDecode[31:26]==6'b001100 || //ANDI     
                InstructionInDecode[31:26]==6'b001110 || //XORI     
                InstructionInDecode[31:26]==6'b001101 || //ORI     
                InstructionInDecode[31:26]==6'b001010 || //SLTI     
                InstructionInDecode[31:26]==6'b100011 || //LW     
                InstructionInDecode[31:26]==6'b100001 || //LH     
                InstructionInDecode[31:26]==6'b100000    //LB     
            ) &&
             ((InstructionInDecode[25:21] == InstructionInMemory  [20:16]) ||//Dependency Check
             ( InstructionInDecode[25:21]  == InstructionInWB     [20:16]) ||//Dependency check
             ( InstructionInDecode[25:21]  == InstructionInExecute[20:16])))//Dependency check
              
            begin
                stall = 1;
            end 

            else if((
                InstructionInDecode[31:26]==6'b101011 || //SW
                InstructionInDecode[31:26]==6'b101001 || //SH    
                InstructionInDecode[31:26]==6'b101000  //SB
            ) &&
            ((InstructionInDecode[20:16] == InstructionInMemory [20:16]) ||//Dependency Check
             (InstructionInDecode[20:16] == InstructionInExecute[20:16])))

            begin
                stall = 1;
            end
            else 
            begin
                stall = 0;
            end
    end
else if (InstructionInMemory[31:26] ==  6'b101011 ||
         InstructionInWB[31:26] ==      6'b101011 ||  
         InstructionInExecute[31:26] == 6'b101011 ||//SW
         InstructionInMemory[31:26] ==  6'b101001 ||
         InstructionInWB[31:26] ==      6'b101001 ||  
         InstructionInExecute[31:26] == 6'b101001 ||//SH 
         InstructionInMemory[31:26] ==  6'b101000 ||
         InstructionInWB[31:26] ==      6'b101000 ||  
         InstructionInExecute[31:26] == 6'b101000)  //SB
         begin
    
end
          
    






//THIS ONE IS THE END
else begin
    stall = 0;
end
end






    
endmodule
`endif