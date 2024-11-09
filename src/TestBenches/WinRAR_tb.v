`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2024 08:27:55 PM
// Design Name: 
// Module Name: top_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

    

module WinRAR_tb;

  // Inputs to the design
  reg clk_0;
  reg rst_0;

  wire [31:0] instrMemAddressOut;
  wire [31:0] WriteData;
  wire [31:0] ALUOut;
  wire [31:0] ReadMem;
  wire [31:0] Instruction;

  // Instantiate the design under test (DUT)
  WinRAR dut (
    .clk(clk_0),
    .rst(rst_0),
    .WriteData(WriteData),
    .ALUOut(ALUOut),
    .ReadMem(ReadMem),
    .Instruction(Instruction),
    .instrMemAddressOut(instrMemAddressOut)
  );

  // Clock generation
  initial begin
    clk_0 = 0;
    $display("WriteData,ALUOut,ReadMem,Instruction,instrMemAddressOut");
    forever #50 clk_0 = ~clk_0;  // Clock period = 10ns (100 MHz)
    
  end

  always @(*) begin
    $display("%h,%h,%h,%h,%h", WriteData, ALUOut, ReadMem, Instruction, instrMemAddressOut);

  end

  // Testbench procedure
  initial begin
    // Initialize inputs
    rst_0 = 1'b1;  // Assert reset
    #100;  
    $stop;
    rst_0 = 1'b0;  // Deassert reset
    #100;
    $stop;
    
    // Run the simulation for 200ns
    #35350;
    
    // End the simulation
    $stop;
  end

endmodule

