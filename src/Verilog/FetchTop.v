
module FetchTop (
  //Ports
  input  adderAdd,
  input  sum,
  input  rst,
  input  clk,
  input  nextInstr,
  input  enable,
  input [31:0] jumpAddress,
  input [31:0]  imm,
  input [31:0]  ALUOut,
  output [31:0] nextInstruction,
  output [31:0] instrMemAddressOut,
  output enableOut,
  output [31:0] instrOut
);

  wire [31:0] nextInstructionInt;
  wire [31:0] instrMemAddressOutInt;
  wire enableOutInt;
  wire [31:0] instrOutInt;

  Fetch  Fetch_inst (
    .adderAdd(adderAdd),
    .sum(sum),
    .rst(rst),
    .clk(clk),
    .nextInstr(nextInstr),
    .enable(enable),
    .jumpAddress(jumpAddress),
    .imm(imm),
    .ALUOut(ALUOut),
    .nextInstruction(nextInstructionInt),
    .instrMemAddressOut(instrMemAddressOutInt),
    .enableOut(enableOutInt)
  );
  reg [31:0] nextInstructionReg;
  reg [31:0] instrMemAddressReg;
  reg [0:0]  enableReg;
  always @(posedge clk ) begin
    if(!rst) begin
        nextInstructionReg <= nextInstructionInt;
        instrMemAddressReg <= instrMemAddressOutInt;
        enableReg <= enableOutInt;
    end else begin
        nextInstructionReg <= 0;
        instrMemAddressReg <= 0;
        enableReg <= 0;
    end
  end
  
  InstrMemAccess  InstrMemAccess_inst (
    .nextInstruction(nextInstructionReg),
    .instrMemAddress(instrMemAddressReg),
    .enable(enableReg),
    .rst(rst),
    .clk(clk),
    .instrOut(instrOut),
    .nextInstructionOut(nextInstructionOut),
    .instrMemAddressOut(instrMemAddressOut),
    .enableOut(enableOut)
  );

//always #5  clk = ! clk ;

endmodule