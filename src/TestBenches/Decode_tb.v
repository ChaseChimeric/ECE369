
module Decode_tb;

  //Ports
  reg [31:0] InstructionIn;
  reg [31:0]  NextInstructionIn;
  wire [31:0] InstructionOut;
  wire [31:0] NextInstructionOut;
  wire [31:0] DataIn25_21;
  wire [31:0] DataIn20_15;
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
    .sh_amt(sh_amt)
  );

    initial begin
        // Test Add
        clk <= 0;
        # 17;
        InstructionIn <= {6'd0, 5'd1, 5'd2, 5'd3, 5'd0, 6'b100000}
        NextInstructionIn <= 32'd13;
        # 20
        if(InstructionOut == InstructionIn &&
            NextInstructionOut == NextInstructionIn &&
            DataIn25_21 == 100 &&
            DataIn20_15 == 200) begin
                $display("Instruction, NextInstruction and Data Read Valid");
        end else begin
                $display("Instruction, NextInstruction and Data Read Not Valid");
        end
        
        #20; $finish;
        
    end
    
    always #10  clk = ! clk ;

endmodule