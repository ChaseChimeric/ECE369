module FullAdder32Bit (
    input [31:0] inA,
    input [31:0] inB,
    input carryIn,
    output [31:0] res,
    output carryOut,
    input clk
);

    wire [15:0] carry;               // Intermediate carry signals
    wire [31:0] res_part[15:0];      // Partial results from each 2-bit adder

    // Instantiate each 2-bit adder explicitly
    FullAdder2Bit adder0  (.inA(inA), .inB(inB), .carryIn(carryIn),  .res(res_part[0]), .carryOut(carry[0]), .clk(clk));
    FullAdder2Bit adder1  (.inA(inA), .inB(inB), .carryIn(carry[0]), .res(res_part[1]), .carryOut(carry[1]), .clk(clk));
    FullAdder2Bit adder2  (.inA(inA), .inB(inB), .carryIn(carry[1]), .res(res_part[2]), .carryOut(carry[2]), .clk(clk));
    FullAdder2Bit adder3  (.inA(inA), .inB(inB), .carryIn(carry[2]), .res(res_part[3]), .carryOut(carry[3]), .clk(clk));
    FullAdder2Bit adder4  (.inA(inA), .inB(inB), .carryIn(carry[3]), .res(res_part[4]), .carryOut(carry[4]), .clk(clk));
    FullAdder2Bit adder5  (.inA(inA), .inB(inB), .carryIn(carry[4]), .res(res_part[5]), .carryOut(carry[5]), .clk(clk));
    FullAdder2Bit adder6  (.inA(inA), .inB(inB), .carryIn(carry[5]), .res(res_part[6]), .carryOut(carry[6]), .clk(clk));
    FullAdder2Bit adder7  (.inA(inA), .inB(inB), .carryIn(carry[6]), .res(res_part[7]), .carryOut(carry[7]), .clk(clk));
    FullAdder2Bit adder8  (.inA(inA), .inB(inB), .carryIn(carry[7]), .res(res_part[8]), .carryOut(carry[8]), .clk(clk));
    FullAdder2Bit adder9  (.inA(inA), .inB(inB), .carryIn(carry[8]), .res(res_part[9]), .carryOut(carry[9]), .clk(clk));
    FullAdder2Bit adder10 (.inA(inA), .inB(inB), .carryIn(carry[9]), .res(res_part[10]), .carryOut(carry[10]), .clk(clk));
    FullAdder2Bit adder11 (.inA(inA), .inB(inB), .carryIn(carry[10]), .res(res_part[11]), .carryOut(carry[11]), .clk(clk));
    FullAdder2Bit adder12 (.inA(inA), .inB(inB), .carryIn(carry[11]), .res(res_part[12]), .carryOut(carry[12]), .clk(clk));
    FullAdder2Bit adder13 (.inA(inA), .inB(inB), .carryIn(carry[12]), .res(res_part[13]), .carryOut(carry[13]), .clk(clk));
    FullAdder2Bit adder14 (.inA(inA), .inB(inB), .carryIn(carry[13]), .res(res_part[14]), .carryOut(carry[14]), .clk(clk));
    FullAdder2Bit adder15 (.inA(inA), .inB(inB), .carryIn(carry[14]), .res(res_part[15]), .carryOut(carry[15]), .clk(clk));

    // Assemble the final 32-bit result by selectively combining the outputs
    assign res = {res_part[15][31:30], res_part[14][29:28], res_part[13][27:26], res_part[12][25:24], 
                  res_part[11][23:22], res_part[10][21:20], res_part[9][19:18], res_part[8][17:16],
                  res_part[7][15:14], res_part[6][13:12], res_part[5][11:10], res_part[4][9:8], 
                  res_part[3][7:6], res_part[2][5:4], res_part[1][3:2], res_part[0][1:0]};

    // The final carry-out from the last 2-bit adder
    assign carryOut = carry[15];

endmodule
