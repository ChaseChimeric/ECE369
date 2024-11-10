
module HazardDetectionUnit_tb;

  // Parameters

  //Ports
  reg [31:0] InstructionInDecode;
  reg [31:0] InstructionInMemory;
  reg [31:0] InstructionInExecute;
  reg [31:0] InstructionInWB;
  wire stall;

  HazardDetectionUnit  HazardDetectionUnit_inst (
    .InstructionInDecode(InstructionInDecode),
    .InstructionInMemory(InstructionInMemory),
    .InstructionInExecute(InstructionInExecute),
    .InstructionInWB(InstructionInWB),
    .stall(stall)
  );

  initial begin
    #100;
    //R-TYPE ADD
     // Test scenario 1: R-type instruction (ADD)
    InstructionInDecode={6'b0,5'b0, 5'b1,5'b11, 5'b0,6'b100000};
    InstructionInExecute={6'b0,5'b11, 5'b1,5'b11, 5'b0,6'b100000};
    InstructionInWB={32'b0};
    InstructionInMemory={32'b0};

    #100;
    $display("STALL: %d\n",stall);

    InstructionInExecute={32'b0};
    InstructionInMemory={6'b0,5'b0, 5'b11,5'b11, 5'b0,6'b100000};
    InstructionInWB={32'b0};

    #100;
    $display("STALL: %d\n",stall);
    InstructionInExecute={32'b0};
    InstructionInMemory={32'b0};
    InstructionInWB={6'b0,5'b0, 5'b1,5'b11, 5'b0,6'b100000};

    #100;
    $display("STALL: %d\n",stall);
    #100;

    $finish;

  end

endmodule