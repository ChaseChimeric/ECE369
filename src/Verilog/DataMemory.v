`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory # (
    parameter MEM_DEPTH = 1024
)
(
    Address, 
    WriteAddress,
    WriteData, 
    Clk, 
    MemWrite, 
    MemRead, 
    ReadData,
    MemMode
); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 
    input [1:0] MemMode;
    input [31:0] WriteAddress;

    output reg [31:0] ReadData; // Contents of memory location at Address

    reg [31:0] mem [MEM_DEPTH-1:0];
    initial begin
        $readmemh("data_memory.mem", mem);
    end

    always @(*) begin
        if(MemRead) begin
            case (MemMode)
                // Read Word Mode
                2'd0: ReadData <= mem[Address[11:2]];

                // Read Half Mode
                2'd1: ReadData <= {16'd0, mem[Address[11:2]][15:0]};

                // Read Byte Mode
                2'd2: ReadData <= {24'd0, mem[Address[11:2]][7:0]};

                // Default is Word Mode
                default: begin
                    ReadData <= mem[Address[11:2]];
                end
            endcase 
        end            
    end
    always @(posedge Clk) begin
        if(MemWrite) begin
            
            case (MemMode)
                // Word Write Mode
                2'd0: mem[WriteAddress >> 2] <= WriteData;

                // Write Half Mode
                2'd1: mem[WriteAddress >> 2] <= {mem[WriteAddress >> 2][31:16], WriteData[15:0]};

                // Write Byte Mode
                2'd2: mem[WriteAddress >> 2] <= {mem[WriteAddress >> 2][31:8], WriteData[7:0]};
                
                // Default is Word Mode
                default:  mem[WriteAddress >> 2] <= WriteData;
            endcase
        end
    end

endmodule
