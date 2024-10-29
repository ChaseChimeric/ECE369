`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg signed [3:0] ALUControl;   // control bits for ALU operation
	reg signed [31:0] A, B;	        // inputs

	wire signed [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
        #100
        ALUControl = 0;
        A = 15;
        B = -15;
        #10
        $display("inA = %d, inB = %d, op = +, out = %d", A, B, ALUResult);
        #100
        ALUControl = 0;
        A = 32'h80000000;
        B = -1;
        #10
        $display("inA = %d, inB = %d, op = +, out = %d", A, B, ALUResult);
        #100
        ALUControl = 0;
        A = 32'h7FFFFFFF;
        B = 1;
        #10
        $display("inA = %d, inB = %d, op = +, out = %d", A, B, ALUResult);
        #100
        ALUControl = 0;
        A = 32'h7FFFFFFF;
        B = 1;
        #10
        $display("inA = %d, inB = %d, op = +, out = %d", A, B, ALUResult);
        #100
        ALUControl = 1;
        A = 11;
        B = 6;
        #10
        $display("inA = %d, inB = %d, op = -, out = %d", A, B, ALUResult);
        #100
        ALUControl = 1;
        A = 32'h80000000;
        B = 1;
        #10
        $display("inA = %d, inB = %d, op = -, out = %d", A, B, ALUResult);
        #100
        ALUControl = 1;
        A = 32'h7FFFFFFF;
        B = -1;
        #10
        $display("inA = %d, inB = %d, op = -, out = %d", A, B, ALUResult);
        #100
        ALUControl = 2;
        A = 6;
        B = -5;
        #10
        $display("inA = %d, inB = %d, op = *, out = %d", A, B, ALUResult);
        #100
        ALUControl = 2;
        A = 32'hAFFFFFFF;
        B = 2;
        #10
        $display("inA = %d, inB = %d, op = *, out = %d", A, B, ALUResult);
        #100
        ALUControl = 2;
        A = 32'h7FFFFFFF;
        B = 2;
        #10
        $display("inA = %d, inB = %d, op = *, out = %d", A, B, ALUResult);
        #100
        ALUControl = 3;
        A = 32'hFFFF0000;
        B = 32'hF0F0F0F0;
        #10
        $display("inA = %b, inB = %b, op = |, out = %b", A, B, ALUResult);
        #100
        ALUControl = 4;
        A = 32'hFFFF0000;
        B = 32'hF0F0F0F0;
        #10
        $display("inA = %b, inB = %b, op = &, out = %b", A, B, ALUResult);
        #100
        ALUControl = 5;
        A = 32'hFFFF0000;
        B = 32'hF0F0F0F0;
        #10
        $display("inA = %b, inB = %b, op = ^, out = %b", A, B, ALUResult);
        #100
        ALUControl = 5;
        A = 32'hFFFF0000;
        B = 32'h0000FFFF;
        #10
        $display("inA = %b, inB = %b, op = ^, out = %b", A, B, ALUResult);
        #100
        ALUControl = 6;
        A = 64;
        B = 2;
        #10
        $display("inA = %b, inB = %d, op = >>, out = %b", A, B, ALUResult);
        #100
        ALUControl = 6;
        A = 1;
        B = 2;
        #10
        $display("inA = %b, inB = %d, op = >>, out = %b", A, B, ALUResult);
        #100
        ALUControl = 7;
        A = 64;
        B = 2;
        #10
        $display("inA = %b, inB = %d, op = <<, out = %b", A, B, ALUResult);
        #100
        ALUControl = 7;
        A = 64;
        B = 31;
        #10
        $display("inA = %b, inB = %d, op = <<, out = %b", A, B, ALUResult);
        #100
        $finish;
    end
endmodule

