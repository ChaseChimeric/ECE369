`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	integer i;
	initial begin
	# 5;
    for(i = 0; i < 32 * 50; i = i + 50) begin
        WriteData <= i;
        Address <= i/50 * 4;
        MemWrite <= (i / 50) % 2;
        # 20;
        MemWrite <= 0;
        MemRead <= ((i/50) % 3)%2;   
        # 20;     
    end
	$finish;
	end

endmodule

