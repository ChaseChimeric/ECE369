`ifndef _alusetup
`define _alusetup

module ALUSetup (
    input [31:0] inA,
    input [31:0] inB,
    input [2:0] opCode,
    input clk,
    input rst,
    output reg [31:0] inAOut,
    output reg [31:0] inBOut,
    output reg CarryIn,
    output reg [2:0] opCodeOut,
    output reg [31:0] SHLRes,
    output reg [31:0] SHRRes,
    output reg [31:0] ORRes,
    output reg [31:0] ANDRes,
    output reg [31:0] XORRes
);
reg [31:0] inAReg [4:0];
reg [31:0] inBReg [4:0];
reg [2:0]  opCodeReg;
integer i;
always @(posedge clk) begin
    if(!rst) begin
        for(i = 0; i < 5; i = i + 1) begin
            inAReg[i] <= inA;
            inBReg[i] <= inB;
        end
        opCodeReg <= opCode;
        inAOut <= inAReg[0];
        inBOut <= (opCodeReg == 1 || opCodeReg == 4) ? ~inBReg[0] : inBReg[0];
        CarryIn <= (opCodeReg == 1 || opCodeReg == 4);
        opCodeOut <= opCodeReg;
        ORRes <= inAReg[1] | inBReg[1];
        ANDRes <= inAReg[2] & inBReg[2];
        XORRes <= inAReg[3] ^ inBReg[3];
        case (inB[4:0])
            5'b00000 : begin
                SHLRes <= inAReg[4] << 0;
                SHRRes <= inAReg[5] >> 0;
            end
            5'b00001 : begin
                SHLRes <= inAReg[4] << 1;
                SHRRes <= inAReg[5] >> 1;
            end
            5'b00010 : begin
                SHLRes <= inAReg[4] << 2;
                SHRRes <= inAReg[5] >> 2;
            end
            5'b00011 : begin
                SHLRes <= inAReg[4] << 3;
                SHRRes <= inAReg[5] >> 3;
            end
            5'b00100 : begin
                SHLRes <= inAReg[4] << 4;
                SHRRes <= inAReg[5] >> 4;
            end
            5'b00101 : begin
                SHLRes <= inAReg[4] << 5;
                SHRRes <= inAReg[5] >> 5;
            end
            5'b00110 : begin
                SHLRes <= inAReg[4] << 6;
                SHRRes <= inAReg[5] >> 6;
            end
            5'b00111 : begin
                SHLRes <= inAReg[4] << 7;
                SHRRes <= inAReg[5] >> 7;
            end
            5'b01000 : begin
                SHLRes <= inAReg[4] << 8;
                SHRRes <= inAReg[5] >> 8;
            end
            5'b01001 : begin
                SHLRes <= inAReg[4] << 9;
                SHRRes <= inAReg[5] >> 9;
            end
            5'b01010 : begin
                SHLRes <= inAReg[4] << 10;
                SHRRes <= inAReg[5] >> 10;
            end
            5'b01011 : begin
                SHLRes <= inAReg[4] << 11;
                SHRRes <= inAReg[5] >> 11;
            end
            5'b01100 : begin
                SHLRes <= inAReg[4] << 12;
                SHRRes <= inAReg[5] >> 12;
            end
            5'b01101 : begin
                SHLRes <= inAReg[4] << 13;
                SHRRes <= inAReg[5] >> 13;
            end
            5'b01110 : begin
                SHLRes <= inAReg[4] << 14;
                SHRRes <= inAReg[5] >> 14;
            end
            5'b01111 : begin
                SHLRes <= inAReg[4] << 15;
                SHRRes <= inAReg[5] >> 15;
            end
            5'b10000 : begin
                SHLRes <= inAReg[4] << 16;
                SHRRes <= inAReg[5] >> 16;
            end
            5'b10001 : begin
                SHLRes <= inAReg[4] << 17;
                SHRRes <= inAReg[5] >> 17;
            end
            5'b10010 : begin
                SHLRes <= inAReg[4] << 18;
                SHRRes <= inAReg[5] >> 18;
            end
            5'b10011 : begin
                SHLRes <= inAReg[4] << 19;
                SHRRes <= inAReg[5] >> 19;
            end
            5'b10100 : begin
                SHLRes <= inAReg[4] << 20;
                SHRRes <= inAReg[5] >> 20;
            end
            5'b10101 : begin
                SHLRes <= inAReg[4] << 21;
                SHRRes <= inAReg[5] >> 21;
            end
            5'b10110 : begin
                SHLRes <= inAReg[4] << 22;
                SHRRes <= inAReg[5] >> 22;
            end
            5'b10111 : begin
                SHLRes <= inAReg[4] << 23;
                SHRRes <= inAReg[5] >> 23;
            end
            5'b11000 : begin
                SHLRes <= inAReg[4] << 24;
                SHRRes <= inAReg[5] >> 24;
            end
            5'b11001 : begin
                SHLRes <= inAReg[4] << 25;
                SHRRes <= inAReg[5] >> 25;
            end
            5'b11010 : begin
                SHLRes <= inAReg[4] << 26;
                SHRRes <= inAReg[5] >> 26;
            end
            5'b11011 : begin
                SHLRes <= inAReg[4] << 27;
                SHRRes <= inAReg[5] >> 27;
            end
            5'b11100 : begin
                SHLRes <= inAReg[4] << 28;
                SHRRes <= inAReg[5] >> 28;
            end
            5'b11101 : begin
                SHLRes <= inAReg[4] << 29;
                SHRRes <= inAReg[5] >> 29;
            end
            5'b11110 : begin
                SHLRes <= inAReg[4] << 30;
                SHRRes <= inAReg[5] >> 30;
            end
            5'b11111 : begin
                SHLRes <= inAReg[4] << 31;
                SHRRes <= inAReg[5] >> 31;
            end
            default: begin
                SHLRes <= 0;
                SHRRes <= 0;
            end
        endcase
    end else begin
        inAOut <= 0; 
        inBOut <= 0;
        CarryIn <= 0;
        opCodeOut <= 0;
        SHLRes <= 0;
        SHRRes <= 0;
        ORRes <= 0;
        ANDRes <= 0;
        XORRes <= 0;
        for(i = 0; i < 5; i = i + 1) begin
            inAReg[i] <= 0;
            inBReg[i] <= 0;
        end
        opCodeReg <= 0;
    end
end
    
endmodule
`endif