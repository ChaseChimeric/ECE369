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

  wire [31:0] XPos;
  wire [31:0] YPos;

  // Instantiate the design under test (DUT)
  WinRAR dut (
    .clk(clk_0),
    .rst(rst_0),
    .XPos(XPos),
    .YPos(YPos)
  );

  // Clock generation
  initial begin
    clk_0 = 0;
    forever #10 clk_0 = ~clk_0;  // Clock period = 10ns (100 MHz)
    
  end

  // Testbench procedure
  initial begin
    // Initialize inputs
    rst_0 = 1'b1;  // Assert reset
    #20;  
    $stop;
    rst_0 = 1'b0;  // Deassert reset
    #20;
    $stop;
    
    // Run the simulation for 200ns
    #35350;
    
    // End the simulation
    $stop;
  end

endmodule

