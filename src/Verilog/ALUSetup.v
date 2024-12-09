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

reg [31:0] inADelayReg [5:0];
reg [31:0] inAReg [5:0];
reg [31:0] inBDelayReg [5:0];
reg [31:0] inBReg [5:0];
reg [2:0]  opCodeDelayReg;
reg [2:0]  opCodeReg;
reg [31:0] SHLResInt [7:0];
reg [31:0] SHRResInt [7:0];
integer i;
always @(posedge clk) begin
    if(!rst) begin
        for(i = 0; i < 6; i = i + 1) begin
            inADelayReg[i] <= inA;
            inAReg[i] <= inADelayReg[0];
            inBDelayReg[i] <= inB;
            inBReg[i] <= inBDelayReg[0];

        end
        opCodeDelayReg <= opCode;
        opCodeReg <= opCodeDelayReg;
        inAOut <= inAReg[0];
        inBOut <= (opCodeReg == 1 || opCodeReg == 4) ? ~inBReg[0] : inBReg[0];
        CarryIn <= (opCodeReg == 1 || opCodeReg == 4);
        opCodeOut <= opCodeReg;
        ORRes <= inAReg[1] | inBReg[1];
        ANDRes <= inAReg[2] & inBReg[2];
        XORRes <= inAReg[3] ^ inBReg[3];
        case (inBDelayReg[5][4:0])
            5'b00000 : begin
                SHLResInt[0] <= inADelayReg[4] << 0;
                SHRResInt[0] <= inADelayReg[5] >> 0;
            end
            5'b00001 : begin
                SHLResInt[0] <= inADelayReg[4] << 1;
                SHRResInt[0] <= inADelayReg[5] >> 1;
            end
            5'b00010 : begin
                SHLResInt[0] <= inADelayReg[4] << 2;
                SHRResInt[0] <= inADelayReg[5] >> 2;
            end
            5'b00011 : begin
                SHLResInt[0] <= inADelayReg[4] << 3;
                SHRResInt[0] <= inADelayReg[5] >> 3;
            end
            5'b00100 : begin
                SHLResInt[1] <= inADelayReg[4] << 4;
                SHRResInt[1] <= inADelayReg[5] >> 4;
            end
            5'b00101 : begin
                SHLResInt[1] <= inADelayReg[4] << 5;
                SHRResInt[1] <= inADelayReg[5] >> 5;
            end
            5'b00110 : begin
                SHLResInt[1] <= inADelayReg[4] << 6;
                SHRResInt[1] <= inADelayReg[5] >> 6;
            end
            5'b00111 : begin
                SHLResInt[1] <= inADelayReg[4] << 7;
                SHRResInt[1] <= inADelayReg[5] >> 7;
            end
            5'b01000 : begin
                SHLResInt[2] <= inADelayReg[4] << 8;
                SHRResInt[2] <= inADelayReg[5] >> 8;
            end
            5'b01001 : begin
                SHLResInt[2] <= inADelayReg[4] << 9;
                SHRResInt[2] <= inADelayReg[5] >> 9;
            end
            5'b01010 : begin
                SHLResInt[2] <= inADelayReg[4] << 10;
                SHRResInt[2] <= inADelayReg[5] >> 10;
            end
            5'b01011 : begin
                SHLResInt[2] <= inADelayReg[4] << 11;
                SHRResInt[2] <= inADelayReg[5] >> 11;
            end
            5'b01100 : begin
                SHLResInt[3] <= inADelayReg[4] << 12;
                SHRResInt[3] <= inADelayReg[5] >> 12;
            end
            5'b01101 : begin
                SHLResInt[3] <= inADelayReg[4] << 13;
                SHRResInt[3] <= inADelayReg[5] >> 13;
            end
            5'b01110 : begin
                SHLResInt[3] <= inADelayReg[4] << 14;
                SHRResInt[3] <= inADelayReg[5] >> 14;
            end
            5'b01111 : begin
                SHLResInt[3] <= inADelayReg[4] << 15;
                SHRResInt[3] <= inADelayReg[5] >> 15;
            end
            5'b10000 : begin
                SHLResInt[4] <= inADelayReg[4] << 16;
                SHRResInt[4] <= inADelayReg[5] >> 16;
            end
            5'b10001 : begin
                SHLResInt[4] <= inADelayReg[4] << 17;
                SHRResInt[4] <= inADelayReg[5] >> 17;
            end
            5'b10010 : begin
                SHLResInt[4] <= inADelayReg[4] << 18;
                SHRResInt[4] <= inADelayReg[5] >> 18;
            end
            5'b10011 : begin
                SHLResInt[4] <= inADelayReg[4] << 19;
                SHRResInt[4] <= inADelayReg[5] >> 19;
            end
            5'b10100 : begin
                SHLResInt[5] <= inADelayReg[4] << 20;
                SHRResInt[5] <= inADelayReg[5] >> 20;
            end
            5'b10101 : begin
                SHLResInt[5] <= inADelayReg[4] << 21;
                SHRResInt[5] <= inADelayReg[5] >> 21;
            end
            5'b10110 : begin
                SHLResInt[5] <= inADelayReg[4] << 22;
                SHRResInt[5] <= inADelayReg[5] >> 22;
            end
            5'b10111 : begin
                SHLResInt[5] <= inADelayReg[4] << 23;
                SHRResInt[5] <= inADelayReg[5] >> 23;
            end
            5'b11000 : begin
                SHLResInt[6] <= inADelayReg[4] << 24;
                SHRResInt[6] <= inADelayReg[5] >> 24;
            end
            5'b11001 : begin
                SHLResInt[6] <= inADelayReg[4] << 25;
                SHRResInt[6] <= inADelayReg[5] >> 25;
            end
            5'b11010 : begin
                SHLResInt[6] <= inADelayReg[4] << 26;
                SHRResInt[6] <= inADelayReg[5] >> 26;
            end
            5'b11011 : begin
                SHLResInt[6] <= inADelayReg[4] << 27;
                SHRResInt[6] <= inADelayReg[5] >> 27;
            end
            5'b11100 : begin
                SHLResInt[7] <= inADelayReg[4] << 28;
                SHRResInt[7] <= inADelayReg[5] >> 28;
            end
            5'b11101 : begin
                SHLResInt[7] <= inADelayReg[4] << 29;
                SHRResInt[7] <= inADelayReg[5] >> 29;
            end
            5'b11110 : begin
                SHLResInt[7] <= inADelayReg[4] << 30;
                SHRResInt[7] <= inADelayReg[5] >> 30;
            end
            5'b11111 : begin
                SHLResInt[7] <= inADelayReg[4] << 31;
                SHRResInt[7] <= inADelayReg[5] >> 31;
            end
        endcase
        SHLRes <= SHLResInt[inBReg[5][4:2]];
        SHRRes <= SHRResInt[inBReg[4][4:2]];
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
        for(i = 0; i < 6; i = i + 1) begin
            inAReg[i] <= 0;
            inBReg[i] <= 0;
            inADelayReg[i] <= 0;
            inBDelayReg[i] <= 0;
        end
        for (i = 0; i < 8; i= i + 1) begin
            SHRResInt[i] <= 0;
            SHLResInt[i] <= 0;
        end
        opCodeReg <= 0;
    end
end
    
endmodule
`endif