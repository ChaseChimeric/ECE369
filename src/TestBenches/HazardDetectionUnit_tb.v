
module HazardDetectionUnit_tb;

  // Parameters

  //Ports
  reg [31:0] InstructionInDecode;
  reg [31:0] InstuctionInMemory;
  reg [31:0] InstuctionInExecute;
  reg [31:0] InstructionInWB;
  wire stall;

  HazardDetectionUnit  HazardDetectionUnit_inst (
    .InstructionInDecode(InstructionInDecode),
    .InstuctionInMemory(InstuctionInMemory),
    .InstuctionInExecute(InstuctionInExecute),
    .InstructionInWB(InstructionInWB),
    .stall(stall)
  );

//always #5  clk = ! clk ;

endmodule