module ALUAdderStage #(
    parameter SEQUENCEVAL = 0
)
(
    input [31:0] inA,
    input [31:0] inB,
    input CarryIn,
    input [2:0] OpCode,
    input [31:0] SHLRes,
    input [31:0] SHRRes,
    input [31:0] ORRes,
    input [31:0] ANDRes,
    input [31:0] XORRes,
    input [31:0] AdderResIn,
    input clk,
    input rst,
    output CarryOut,
    output reg [31:0] inAOut,
    output reg [31:0] inBOut,
    output reg [2:0] OpCodeOut,
    output reg [31:0] SHLResOut,
    output reg [31:0] SHRResOut,
    output reg [31:0] ORResOut,
    output reg [31:0] ANDResOut,
    output reg [31:0] XORResOut,
    output [31:0] AdderResOut
);
    always @(posedge clk) begin
        if(!rst) begin
            inAOut <= inA;
            inBOut <= inB;
            OpCodeOut <= OpCode;
            SHLResOut <= SHLRes;
            SHRResOut <= SHRRes;
            ORResOut <= ORRes;
            ANDResOut <= ANDRes;
            XORResOut <= XORRes;
        end else begin
            inAOut <= 0;
            inBOut <= 0;
            OpCodeOut <= 0;
            SHLResOut <= 0;
            SHRResOut <= 0;
            ORResOut <= 0;
            ANDResOut <= 0;
            XORResOut <= 0;
        end
        
    end
    FullAdder2Bit #(
        .SEQUENCEVAL(SEQUENCEVAL)
    ) adder (
        .inA(inA),
        .inB(inB),
        .resIn(AdderResIn),
        .carryIn(CarryIn),
        .res(AdderResOut),
        .carryOut(CarryOut),
        .clk(clk),
        .rst(rst)
    );
endmodule