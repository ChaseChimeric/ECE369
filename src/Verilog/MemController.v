module MemController(
<<<<<<< HEAD
    Op;
    Funct;
    MemWrite;
    MemRead;
    RegWrite;
    RegRead;
    Memmode;
=======
    Op,
    Funct,
    MemWrite,
    MemRead,
    RegWrite,
    RegRead,
    Memmode
>>>>>>> dev
);

    input  [5:0] Op;
    input  [5:0] Funct;
<<<<<<< HEAD
    output MemWrite;
    output MemRead;
    output RegWrite;
    output RegRead;
    output [1:0] Memmode;
=======
    output reg MemWrite;
    output reg MemRead;
    output reg RegWrite;
    output reg RegRead;
    output reg [1:0] Memmode;
    
>>>>>>> dev
    localparam X = 2'b0;
    localparam WORD = 2'b0;
    localparam HALF = 2'b1;
    localparam BYTE = 2'b10;

    always @(*) begin
        case (Op)
<<<<<<< HEAD
            6b'100011 : begin   //Load Word
=======
            6'b100011 : begin   //Load Word
>>>>>>> dev
               MemWrite <= 0;
               MemRead <= 1;
               RegWrite <= 1;
               RegRead <= 1;
               Memmode <= WORD;
            end
<<<<<<< HEAD
            6b'100001 : begin   //Load Half
=======
            6'b100001 : begin   //Load Half
>>>>>>> dev
               MemWrite <= 0;
               MemRead <= 1;
               RegWrite <= 1;
               RegRead <= 1;
               Memmode <= HALF;
            end
<<<<<<< HEAD
            6b'100000 : begin   //Load Byte
=======
            6'b100000 : begin   //Load Byte
>>>>>>> dev
               MemWrite <= 0;
               MemRead <= 1;
               RegWrite <= 1;
               RegRead <= 1;
               Memmode <= BYTE;
            end
<<<<<<< HEAD
            6b'101011 : begin   //Store Word
=======
            6'b101011 : begin   //Store Word
>>>>>>> dev
               MemWrite <= 1;
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= WORD;
            end
<<<<<<< HEAD
            6b'101001 : begin   //Store Half
=======
            6'b101001 : begin   //Store Half
>>>>>>> dev
               MemWrite <= 1;
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= HALF;
            end
<<<<<<< HEAD
            6b'101000 : begin   //Store Byte
=======
            6'b101000 : begin   //Store Byte
>>>>>>> dev
               MemWrite <= 1; 
               MemRead <= 0;
               RegWrite <= 0;
               RegRead <= 1;
               Memmode <= BYTE;
            end
<<<<<<< HEAD
            6b'000101 : begin   //Branch not equal to
=======
            6'b000101 : begin   //Branch not equal to
>>>>>>> dev
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 0;
                RegRead <= 1;
                Memmode <= X;
             end
<<<<<<< HEAD
             6b'000100 : begin   //Branch equal to
=======
             6'b000100 : begin   //Branch equal to
>>>>>>> dev
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 0;
                RegRead <= 1;
                Memmode <= X;
             end
<<<<<<< HEAD
             6b'000010 : begin   //Jump
=======
             6'b000010 : begin   //Jump
>>>>>>> dev
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 0;
                RegRead <= 0;
                Memmode <= X;
             end
<<<<<<< HEAD
             6b'000011 : begin   //Jump and Link
=======
             6'b000011 : begin   //Jump and Link
>>>>>>> dev
                MemWrite <= 0; 
                MemRead <= 0;
                RegWrite <= 1;
                RegRead <= 0;
                Memmode <= X;
             end
<<<<<<< HEAD
         


             
            default : begin     //All R-Type , I-Type, SLT(I) and unsupported instructions
               MemWrite <= 0;
               MemRead <= 0;
               RegWrite <= (Funct!=(6'b001000)); // Jump Register
=======

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
               RegWrite <= (!(Funct == (6'b001000) && Op == 6'b000000)); // Jump Register
>>>>>>> dev
               RegRead <= 1;
               Memmode <= X; 
            end

        endcase
    end
endmodule        

