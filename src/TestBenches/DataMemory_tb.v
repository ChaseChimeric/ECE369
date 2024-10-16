`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module with signed values and edge cases.
// Testbench ensures memory writes and subsequent reads, as well as re-reading 
// from addresses that were previously read.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg signed [31:0] Address;     // Address for read operation
    reg signed [31:0] WriteAddress; // Address for write operation
    reg signed [31:0] WriteData;   // Data to be written (signed)
    reg Clk;                       // Clock
    reg MemWrite;                  // Control signal for memory write
    reg MemRead;                   // Control signal for memory read
    reg [1:0] MemMode;             // Control signal for memory operation mode

    wire signed [31:0] ReadData;   // Output from memory (signed)

    // Instantiate the DataMemory module
    DataMemory u0(
        .Address(Address),
        .WriteAddress(WriteAddress),
        .WriteData(WriteData),
        .Clk(Clk),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .MemMode(MemMode),
        .ReadData(ReadData)
    );

    // Clock generation
    always #5 Clk = ~Clk;

    initial begin
        Clk = 0;
        MemWrite = 0;
        MemRead = 0;
        MemMode = 2'd0;

        // Wait for reset
        #20;
        
        // Test Case 1: Write and Read a Word (Normal Operation, positive values)
        $display("\n--- Test Case 1: Write and Read Word Mode (Positive Values) ---");
        MemWrite = 1;
        WriteAddress = 8; 
        WriteData = 305419896;  // Positive data (12345678 in hex)
        MemMode = 2'd0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        Address = 8;  // Reading from the same address after write
        #10;
        $display("Address = %d, WriteData = %d, ReadData = %d", Address, WriteData, ReadData);

        // Re-read the data from the same address
        $display("\n--- Re-reading from Address 8 ---");
        #10;
        $display("Address = %d, ReadData = %d", Address, ReadData);

        // Test Case 2: Write and Read a Word (Negative Values)
        $display("\n--- Test Case 2: Write and Read Word Mode (Negative Values) ---");
        MemWrite = 1;
        WriteAddress = 12; 
        WriteData = -305419896;  // Negative data (-12345678 in hex)
        MemMode = 2'd0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        Address = 12;  // Reading from the same address after write
        #10;
        $display("Address = %d, WriteData = %d, ReadData = %d", Address, WriteData, ReadData);

        // Re-read the data from the same address
        $display("\n--- Re-reading from Address 12 ---");
        #10;
        $display("Address = %d, ReadData = %d", Address, ReadData);

        // Test Case 3: Write and Read Half-Word (Positive)
        $display("\n--- Test Case 3: Write and Read Half-Word Mode (Positive) ---");
        MemWrite = 1;
        WriteAddress = 16; 
        WriteData = 4660;  // Positive half-word (00001234 in hex)
        MemMode = 2'd1;
        #10;
        MemWrite = 0;
        MemRead = 1;
        Address = 16;  // Reading from the same address after write
        #10;
        $display("Address = %d, WriteData = %d, ReadData = %d (Half-word)", Address, WriteData, ReadData);

        // Re-read the data from the same address
        $display("\n--- Re-reading from Address 16 ---");
        #10;
        $display("Address = %d, ReadData = %d", Address, ReadData);

        // Test Case 4: Write and Read Byte (Negative)
        $display("\n--- Test Case 4: Write and Read Byte Mode (Negative) ---");
        MemWrite = 1;
        WriteAddress = 28; 
        WriteData = -171;  // Negative byte (-000000AB in hex)
        MemMode = 2'd2;
        #10;
        MemWrite = 0;
        MemRead = 1;
        Address = 28;  // Reading from the same address after write
        #10;
        $display("Address = %d, WriteData = %d, ReadData = %d (Byte)", Address, WriteData, ReadData);

        // Re-read the data from the same address
        $display("\n--- Re-reading from Address 28 ---");
        #10;
        $display("Address = %d, ReadData = %d", Address, ReadData);

        // Edge Case: Lowest Address
        $display("\n--- Test Case 5: Edge Case with Lowest Address ---");
        MemWrite = 1;
        WriteAddress = 0;
        WriteData = -1;
        MemMode = 2'd0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        Address = 0;
        #10;
        $display("Address = %d, WriteData = %d, ReadData = %d", Address, WriteData, ReadData);

        // Re-read the data from the lowest address
        $display("\n--- Re-reading from Address 0 ---");
        #10;
        $display("Address = %d, ReadData = %d", Address, ReadData);

        // Edge Case: Highest Address
        $display("\n--- Test Case 6: Edge Case with Highest Address ---");
        MemWrite = 1;
        WriteAddress = 1020; // Highest address for 1K memory
        WriteData = -1;
        MemMode = 2'd0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        Address = 1020;
        #10;
        $display("Address = %d, WriteData = %d, ReadData = %d", Address, WriteData, ReadData);

        // Re-read the data from the highest address
        $display("\n--- Re-reading from Address 1020 ---");
        #10;
        $display("Address = %d, ReadData = %d", Address, ReadData);

        // End simulation
        $finish;
    end

endmodule
