`timescale 1ns / 1ps

module FullAdder32Bit_tb;

    reg [31:0] inA;
    reg [31:0] inB;
    reg carryIn;
    reg clk;
    wire [31:0] res;

    // Instantiate the FullAdder32Bit module
    FullAdder32Bit uut (
        .inA(inA),
        .inB(inB),
        .carryIn(carryIn),
        .res(res),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Monitor outputs for debugging
        $monitor("Time=%0d | inA=%h, inB=%h, carryIn=%b | res=%h", 
                  $time, inA, inB, carryIn, res);

        // Initialize inputs
        inA = 32'h00000000;
        inB = 32'h00000000;
        carryIn = 0;
        #200;  // Wait for one clock cycle

        // Test Case 1: Add zero to zero, with carryIn = 0
        inA = 32'h00000000;
        inB = 32'h00000000;
        carryIn = 0;
        #200;

        // Test Case 2: Add two small numbers
        inA = 32'h00000001;
        inB = 32'h00000001;
        carryIn = 0;
        #200;

        // Test Case 3: Add numbers with carryIn = 1
        inA = 32'h00000001;
        inB = 32'h00000001;
        carryIn = 1;
        #200;

        // Test Case 4: Add numbers to cause carry out
        inA = 32'hFFFFFFFF;
        inB = 32'h00000001;
        carryIn = 0;
        #200;
        $stop;

        // Test Case 5: Add two large numbers
        inA = 32'h7FFFFFFF;
        inB = 32'h7FFFFFFF;
        carryIn = 0;
        #200;

        // Test Case 6: Random values
        inA = 32'hA5A5A5A5;
        inB = 32'h5A5A5A5A;
        carryIn = 1;
        #200;

        // Test Case 7: Another set of random values
        inA = 32'h12345678;
        inB = 32'h87654321;
        carryIn = 0;
        #200;
        $stop;
        
        inA = 32'd64270;
        inB = 32'd75949;
        carryIn = 0;
        #200;
        $stop;

        // Test Case 8: Carry-in with mixed numbers
        inA = 32'hFFFFFFFF;
        inB = 32'hFFFFFFFF;
        carryIn = 1;
        #200;

        // Finish simulation
    end

endmodule
