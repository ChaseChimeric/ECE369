`include "ALUSetup.v"
`include "ALUFinalStage.v"
`include "ALUAdderStage.v"
module EighteenStageALU (
    input [31:0] inA,
    input [31:0] inB,
    input [2:0] opCode,
    input clk,
    input rst,
    output [31:0] finalResult,
    output Zero
);
    // Signals for intermediate connections
    wire [31:0] shlRes      [0:16]; 
    wire [31:0] shrRes      [0:16]; 
    wire [31:0] orRes       [0:16]; 
    wire [31:0] andRes      [0:16];
    wire [31:0] xorRes      [0:16];
    wire [31:0] inAInt      [0:16]; 
    wire [31:0] inBInt      [0:15]; 
    wire [3:0] opCodeInt   [0:16];
    wire [0:0]  carrySignals[0:15];
    
    
    // Reg inputs to avoid critical path
    reg [31:0] inAReg;
    reg [31:0] inBReg;
    reg [2:0]  opCodeReg;
    
    always @(posedge clk) begin
        inAReg     <= inA;  
        inBReg     <= inB;  
        opCodeReg  <= opCode; 
    end

    // 1. Instantiate ALUSetup
    ALUSetup setup (
        .inA(inAReg),
        .inB(inBReg),
        .opCode(opCodeReg),
        .clk(clk),
        .rst(rst),
        .inAOut(inAInt[0]),
        .inBOut(inBInt[0]),
        .opCodeOut(opCodeInt[0]),
        .CarryIn(carrySignals[0]),
        .SHLRes(shlRes[0]),
        .SHRRes(shrRes[0]),
        .ORRes(orRes[0]),
        .ANDRes(andRes[0]),
        .XORRes(xorRes[0])
    );

    // 2. Sequentially connect 16 ALUAdderStage instances
    wire [31:0] adderResults[0:15]; // For each stage's output

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_stages
            ALUAdderStage #(
                .SEQUENCEVAL(i)
            ) adderStage (
                .inA(inAInt[i]),                // Unconnected port
                .inB(inBInt[i]),                // Unconnected port
                .CarryIn(carrySignals[i]),            // Unconnected port
                .OpCode(opCodeInt[i]),             // Unconnected port
                .SHLRes(shlRes[i]),             // Unconnected port
                .SHRRes(shrRes[i]),             // Unconnected port
                .ORRes(orRes[i]),              // Unconnected port
                .ANDRes(andRes[i]),             // Unconnected port
                .XORRes(xorRes[i]),             // Unconnected port
                .AdderResIn((i ==0 ) ? 0 : adderResults[i-1]),         // Unconnected port
                .clk(clk),                // Unconnected port
                .rst(rst),
                .CarryOut(carrySignals[i+1]),           // Unconnected port
                .inAOut(inAInt[i+1]),             // Unconnected port
                .inBOut(inBInt[i+1]),             // Unconnected port
                .OpCodeOut(opCodeInt[i+1]),          // Unconnected port
                .SHLResOut(shlRes[i+1]),          // Unconnected port
                .SHRResOut(shrRes[i+1]),          // Unconnected port
                .ORResOut(orRes[i+1]),           // Unconnected port
                .ANDResOut(andRes[i+1]),          // Unconnected port
                .XORResOut(xorRes[i+1]),          // Unconnected port
                .AdderResOut(adderResults[i])         // Unconnected port
            );
        end
    endgenerate
    reg [3:0] opCodeFinal;
    always @(posedge clk) begin
        opCodeFinal <= opCodeInt[16];
    end
    // 3. Pass final stage's result to ALUFinalStage
    ALUFinalStage finalStage (
        .AdderRes(adderResults[15]),  // Last stage output
        .XORRes(xorRes[16]),
        .SHLRes(shlRes[16]),
        .SHRRes(shrRes[16]),
        .ANDRes(andRes[16]),
        .ORRes(orRes[16]),
        .opCode(opCodeFinal),
        .res(finalResult),
        .clk(clk),
        .rst(rst),
        .Zero(Zero)
    );
endmodule
