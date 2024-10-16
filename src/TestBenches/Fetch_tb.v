module Fetch_tb;

  // Parameters
  reg instrAdd;
  reg adderAdd;
  reg sum;
  reg rst;
  reg clk;
  reg [31:0] jumpAddress;
  reg [31:0] imm;
  reg [31:0] ALUOut;
  wire [31:0] instrOut;
  wire [31:0] nextInstr;

  Fetch Fetch_inst (
    .instrAdd(instrAdd),
    .adderAdd(adderAdd),
    .sum(sum),
    .rst(rst),
    .clk(clk),
    .jumpAddress(jumpAddress),
    .imm(imm),
    .ALUOut(ALUOut),
    .instrOut(instrOut),
    .nextInstr(nextInstr)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test all combinations of ternary operator inputs
  initial begin
    $display("Starting Fetch Testbench...");
    clk = 0; rst = 1; 
    #10 rst = 0; // Release reset

    // Test case initialization
    jumpAddress = 100;
    imm = 4;
    ALUOut = 200;

    // Test all 8 combinations
    // Combination 0: sum = 0, adderAdd = 0, nextInstr = 0
    sum = 0; adderAdd = 0; instrAdd = 0;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 1: sum = 0, adderAdd = 0, nextInstr = 1
    sum = 0; adderAdd = 0; instrAdd = 1;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 2: sum = 0, adderAdd = 1, nextInstr = 0
    sum = 0; adderAdd = 1; instrAdd = 0;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 3: sum = 0, adderAdd = 1, nextInstr = 1
    sum = 0; adderAdd = 1; instrAdd = 1;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 4: sum = 1, adderAdd = 0, nextInstr = 0
    sum = 1; adderAdd = 0; instrAdd = 0;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 5: sum = 1, adderAdd = 0, nextInstr = 1
    sum = 1; adderAdd = 0; instrAdd = 1;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 6: sum = 1, adderAdd = 1, nextInstr = 0
    sum = 1; adderAdd = 1; instrAdd = 0;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    // Combination 7: sum = 1, adderAdd = 1, nextInstr = 1
    sum = 1; adderAdd = 1; instrAdd = 1;
    #10 $display("sum = %d, adderAdd = %d, nextInstr = %d | instrOut = %d, nextInstr = %d", sum, adderAdd, nextInstr, instrOut, nextInstr);

    $display("Fetch Testbench Complete.");
    $finish;
  end


endmodule