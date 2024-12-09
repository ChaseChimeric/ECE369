`ifndef _32bitfast
`define _32bitfast
`include "FullAdder32Bit.v" 

module ALU32BitFast# (
	parameter SIZE = 32
)
(
	ALUControl, 
	A, 
	B, 
	ALUResult
);

	input [2:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [SIZE-1:0] A, B;	    // inputs

	output reg [SIZE-1:0] ALUResult;

    FullAdder32Bit plusAdder (
        .inA(inA),
        .inB(inB),
        .carryIn(0),
        .res(PlusAdderRes),
        .carryOut(),
        .clk(clk)
    );

    FullAdder32Bit subAdder (
        .inA(1),
        .inB(~inB),
        .carryIn(0),
        .res(sub1Res),
        .carryOut(),
        .clk(clk)
    );

    FullAdder32Bit subFinalAdder (
        .inA(inA),
        .inB(sub1Res),
        .carryIn(0),
        .res(SubRes),
        .carryOut(),
        .clk(clk)
    );

	always @(A, B, ALUControl) begin
		case(ALUControl) 
			3'd0: ALUResult = PlusAdderRes; 	// If sel is 0, adder
			3'd1: ALUResult = SubRes; 	// If sel is 1, subtracter
			3'd2: ALUResult = ~(A | B); 	// If sel is 2, NOR
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