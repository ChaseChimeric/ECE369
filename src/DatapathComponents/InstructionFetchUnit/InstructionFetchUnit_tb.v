`timescale 1ns / 1ps



module InstructionFetchUnit_tb();


    reg Reset;
    reg Clk;
    wire [31:0] Instruction;
    wire [31:0] Result;
    


    InstructionFetchUnit ifu0(
        .Reset(Reset),
        .Clk(Clk),
        .Instruction(Instruction),
        .PCResult(Result)
    );

    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

    initial begin
        Reset <= 1;#50
        Reset <= 0;#10
        #250;
    end



endmodule