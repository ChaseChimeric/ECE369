`timescale 1ns / 1ps
`ifndef _alu32bit
`define _alu32bit
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit# (
	parameter SIZE = 32
)
(
	ALUControl, 
	A, 
	B, 
	ALUResult, 
	Zero
);

	input [2:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [SIZE-1:0] A, B;	    // inputs

//	reg [SIZE-1:0] ALUResult_int;	// answer
	output reg [SIZE-1:0] ALUResult;
	output Zero;	    // Zero=1 if ALUResult == 0
	
	assign Zero = (ALUResult == 0);

	always @(A, B, ALUControl) begin
		case(ALUControl) 
			3'd0: ALUResult = A + B; 	// If sel is 0, adder
			3'd1: ALUResult = A - B; 	// If sel is 1, subtracter
			3'd2: ALUResult = A * B; 	// If sel is 2, multiplier
			3'd3: ALUResult = A | B; 	// If sel is 3, bitwise OR
			3'd4: ALUResult = A & B; 	// If sel is 4, bitwise AND
			3'd5: ALUResult = A ^ B; 	// If sel is 5, bitwise XOR
			3'd6: ALUResult = A >> B; 	// If sel is 6, A shifted right by B
			3'd7: ALUResult = A << B; 	// If sel is 7, A shifted left by B 
			default: ALUResult = 0;
		endcase
	end
endmodule
`endif