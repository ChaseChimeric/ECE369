
module DataMemory_tb;

    // Parameters

    //Ports
    reg [31:0] Address;
    reg [31:0] WriteData;
    reg Clk;
    reg MemWrite;
    reg MemRead;
    reg [1:0] MemMode;
    wire [31:0] ReadData;

    DataMemory  DataMemory_inst (
        .Address(Address),
        .WriteData(WriteData),
        .Clk(Clk),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .MemMode(MemMode),
        .ReadData(ReadData)
    );


    initial begin
        
        #10
        $finish;
    end

endmodule