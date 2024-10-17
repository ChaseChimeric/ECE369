
module Decode_tb;

  //Ports
  reg [31:0] InstructionIn;
  reg [31:0]  NextInstructionIn;
  wire [31:0] InstructionOut;
  wire [31:0] NextInstructionOut;
  wire [31:0] DataIn25_21;
  wire [31:0] DataIn20_15;
  reg [31:0] WriteData;
  reg clk;
  reg  RegWriteIn;
  wire [2:0] ForceInstr;
  wire ZeroInverted;
  wire Inverted;
  wire Sum;
  wire NextInstr;
  wire NextInstrAddress;
  wire DataWriteVal;
  wire ALUImmReg;
  wire WB_RA;
  wire WBDestRdRt;
  wire Sign;
  wire inA;
  wire AdderAdd;
  wire MemReadEn;
  wire MemWriteEn;
  wire RegWriteOut;
  wire sh_amt;
 



  Decode  Decode_inst (
    .InstructionIn(InstructionIn),
    .NextInstructionIn(NextInstructionIn),
    .InstructionOut(InstructionOut),
    .NextInstructionOut(NextInstructionOut),
    .DataIn25_21(DataIn25_21),
    .DataIn20_15(DataIn20_15),
    .clk(clk),
    .RegWriteIn(RegWriteIn),
    .ForceInstr(ForceInstr),
    .ZeroInverted(ZeroInverted),
    .Inverted(Inverted),
    .Sum(Sum),
    .NextInstr(NextInstr),
    .NextInstrAddress(NextInstrAddress),
    .DataWriteVal(DataWriteVal),
    .ALUImmReg(ALUImmReg),
    .WB_RA(WB_RA),
    .WBDestRdRt(WBDestRdRt),
    .Sign(Sign),
    .inA(inA),
    .AdderAdd(AdderAdd),
    .MemReadEn(MemReadEn),
    .MemWriteEn(MemWriteEn),
    .RegWriteOut(RegWriteOut),
    .sh_amt(sh_amt),
    .WriteData(WriteData)
  );
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end
 
    initial begin
      #100
      //R-TYPE ADD
       // Test scenario 1: R-type instruction (ADD)
      InstructionIn={6'b0,5'b111, 5'b1,5'b11, 5'b0,6'b100000};
      RegWriteIn = 0;
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle

      $display("ADD signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      
      #100;
      $finish;
    end
    
    

endmodule