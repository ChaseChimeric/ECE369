module MemController(
    Op,
    Funct,
    MemWrite,
    MemRead,
    RegWrite,
    RegRead,
    Memmode
);

    input  [5:0] Op;
    input  [5:0] Funct;
    output reg MemWrite;
    output reg MemRead;
    output reg RegWrite;
    output reg RegRead;
    output reg [1:0] Memmode;
    
    localparam X = 2'b0;
    localparam WORD = 2'b0;
    localparam HALF = 2'b1;
    localparam BYTE = 2'b10;

    always @(*) begin
        case (Op)
            6'b100011 : begin   //Load Word
               MemWrite <= 0;
               MemRead <= 1;
               RegWrite <= 1;
               RegRead <= 1;
               Memmode <= WORD;
            end
            6'b100001 : begin   //Load Half
               MemWrite <= 0;
               MemRead <= 1;
               RegWrite <= 1;
               RegRead <= 1;
               Memmode <= HALF;
            end
            6'b100000 : begin   //Load Byte
               MemWrite <= 0;
               MemRead <= 1;
               RegWrite <= 1;
               RegRead <= 1;
               Memmode <= BYTE;
            end
            6'b101011 : begin   //Store Word
               MemWrite <= 1;
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= WORD;
            end
            6'b101001 : begin   //Store Half
               MemWrite <= 1;
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= HALF;
            end
            6'b101000 : begin   //Store Byte
               MemWrite <= 1; 
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= BYTE;
            end
            6'b000101 : begin   //Branch not equal to
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 0;
                RegRead <= 1;
                Memmode <= X;
             end
             6'b000100 : begin   //Branch equal to
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 0;
                RegRead <= 1;
                Memmode <= X;
             end
             6'b000010 : begin   //Jump
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 0;
                RegRead <= 0;
                Memmode <= X;
             end
             6'b000011 : begin   //Jump and Link
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 1;
                RegRead <= 0;
                Memmode <= X;
             end
             6'b000111 : begin   //BGTZ
               MemWrite <= 0; 
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= X;
            end
            6'b000110 : begin   //BLEZ
               MemWrite <= 0; 
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= X;
            end
            6'b000001 : begin   //BLTZ/BGEZ
               MemWrite <= 0; 
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= X;
            end
            
         


             
            default : begin     //All R-Type , I-Type, SLT(I) and unsupported instructions
               MemWrite <= 0;
               MemRead <= 0;
               RegWrite <= (Funct!=(6'b001000)); // Jump Register
               RegRead <= 1;
               Memmode <= X; 
            end

        endcase
    end
endmodule        

