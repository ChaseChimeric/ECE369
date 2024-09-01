`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0 (
		.Address(Address),
        .Instruction(Instruction)
	);
    integer count;
	initial begin
	   
	   for(count =0; count < 200;count = count +1) begin
	       Address = count;
	       #10;
	   end
	   
	   $finish;

	end

endmodule

