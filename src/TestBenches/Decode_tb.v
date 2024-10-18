
module Decode_tb;

  //Ports
  reg [31:0] InstructionIn;
  reg [31:0]  NextInstructionIn;
  reg [4:0] RegWriteAddr;
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
    .WriteData(WriteData),
    .RegWriteAddr(RegWriteAddr)
  );
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end
 
    initial begin
      #100
      //R-TYPE ADD
       // Test scenario 1: R-type instruction (ADD)
      InstructionIn={6'b0,5'b0, 5'b1,5'b11, 5'b0,6'b100000};
      RegWriteIn = 0;
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle

      $display("ADD signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;
      //R-TYPE AND
       // Test scenario 1: R-type instruction (ADD)
      InstructionIn={6'b0,5'd2, 5'd3,5'b10, 5'b0,6'b100100};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("AND signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b0,5'd4, 5'd5,5'b1, 5'b0,6'b100111};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("NOR signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;
    

      InstructionIn={6'b0,5'd6, 5'd7,5'b1, 5'b0,6'b100010};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("SUB signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b0,5'd8, 5'd9,5'b1, 5'b0,6'b100110};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("XOR signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b0,5'd10, 5'd11,5'b1, 5'b0,6'b100010};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("MUL signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b0,5'd0, 5'd12,5'b1, 5'b10,6'b000000};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("SLL signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b0,5'd0, 5'd13,5'b1, 5'b10,6'b000010};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("SRL signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b0,5'd14, 5'd15,5'b1, 5'b0,6'b101010};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("SLT signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b001000,5'd14, 5'd15,5'b1, 5'b0,6'b001000};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("ADDI signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b001100,5'd18, 5'd19,5'b1, 5'b0,6'b001111};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("ANDI signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b001110,5'd20, 5'd21,5'b1, 5'b0,6'b001110};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("XORI signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b001010,5'd16, 5'd17,5'b1, 5'b0,6'b001110};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("SLTI signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b100011,5'd16, 5'd17,5'b1, 5'b0,6'b000100};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("LW signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b100001,5'd16, 5'd17,5'b1, 5'b0,6'b000100};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("LH signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;

      InstructionIn={6'b100000,5'd31, 5'd30,5'b1, 5'b0,6'b000100};
      RegWriteIn = 0;
      RegWriteAddr = {5'b10};
      WriteData = 32'd6;
      #100;  // Wait for one clock cycle
      
      $display("LB signal wires: ForceInstr %d \nZeroInverted %b \nInverted %b \nSum %b \nNextInstr %b \nNextInstrAdress %b \nDataWriteVal %b \nALUImmReg %b \nWB_RA %b \nWBDestRdRt %b \nSign %b \ninA %b \nAdderAdd %b \nMemReadEn %b \nMemWriteEn %b \nRegWriteOut %b \nsh_amt %b",ForceInstr,ZeroInverted,Inverted,Sum,NextInstr,NextInstrAddress,DataWriteVal,ALUImmReg,WB_RA,WBDestRdRt,Sign,inA,AdderAdd,MemReadEn,MemWriteEn,RegWriteOut,sh_amt);
      $display("Reg Values %d and %d",DataIn25_21,DataIn20_15);
      #100;
      $finish;
    end
    
    

endmodule