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

always @(posedge clk) begin
    if(!rst) begin
        inAOut <= inA;
        inBOut <= (opCode == 1 || opCode == 4) ? ~inB : inB;
        CarryIn <= (opCode == 1 || opCode == 4);
        opCodeOut <= opCode;
        ORRes <= inA | inB;
        ANDRes <= inA & inB;
        XORRes <= inA ^ inB;
        case (inB[4:0])
            5'b00000 : begin
                SHLRes <= inA << 0;
                SHRRes <= inA >> 0;
            end
            5'b00001 : begin
                SHLRes <= inA << 1;
                SHRRes <= inA >> 1;
            end
            5'b00010 : begin
                SHLRes <= inA << 2;
                SHRRes <= inA >> 2;
            end
            5'b00011 : begin
                SHLRes <= inA << 3;
                SHRRes <= inA >> 3;
            end
            5'b00100 : begin
                SHLRes <= inA << 4;
                SHRRes <= inA >> 4;
            end
            5'b00101 : begin
                SHLRes <= inA << 5;
                SHRRes <= inA >> 5;
            end
            5'b00110 : begin
                SHLRes <= inA << 6;
                SHRRes <= inA >> 6;
            end
            5'b00111 : begin
                SHLRes <= inA << 7;
                SHRRes <= inA >> 7;
            end
            5'b01000 : begin
                SHLRes <= inA << 8;
                SHRRes <= inA >> 8;
            end
            5'b01001 : begin
                SHLRes <= inA << 9;
                SHRRes <= inA >> 9;
            end
            5'b01010 : begin
                SHLRes <= inA << 10;
                SHRRes <= inA >> 10;
            end
            5'b01011 : begin
                SHLRes <= inA << 11;
                SHRRes <= inA >> 11;
            end
            5'b01100 : begin
                SHLRes <= inA << 12;
                SHRRes <= inA >> 12;
            end
            5'b01101 : begin
                SHLRes <= inA << 13;
                SHRRes <= inA >> 13;
            end
            5'b01110 : begin
                SHLRes <= inA << 14;
                SHRRes <= inA >> 14;
            end
            5'b01111 : begin
                SHLRes <= inA << 15;
                SHRRes <= inA >> 15;
            end
            5'b10000 : begin
                SHLRes <= inA << 16;
                SHRRes <= inA >> 16;
            end
            5'b10001 : begin
                SHLRes <= inA << 17;
                SHRRes <= inA >> 17;
            end
            5'b10010 : begin
                SHLRes <= inA << 18;
                SHRRes <= inA >> 18;
            end
            5'b10011 : begin
                SHLRes <= inA << 19;
                SHRRes <= inA >> 19;
            end
            5'b10100 : begin
                SHLRes <= inA << 20;
                SHRRes <= inA >> 20;
            end
            5'b10101 : begin
                SHLRes <= inA << 21;
                SHRRes <= inA >> 21;
            end
            5'b10110 : begin
                SHLRes <= inA << 22;
                SHRRes <= inA >> 22;
            end
            5'b10111 : begin
                SHLRes <= inA << 23;
                SHRRes <= inA >> 23;
            end
            5'b11000 : begin
                SHLRes <= inA << 24;
                SHRRes <= inA >> 24;
            end
            5'b11001 : begin
                SHLRes <= inA << 25;
                SHRRes <= inA >> 25;
            end
            5'b11010 : begin
                SHLRes <= inA << 26;
                SHRRes <= inA >> 26;
            end
            5'b11011 : begin
                SHLRes <= inA << 27;
                SHRRes <= inA >> 27;
            end
            5'b11100 : begin
                SHLRes <= inA << 28;
                SHRRes <= inA >> 28;
            end
            5'b11101 : begin
                SHLRes <= inA << 29;
                SHRRes <= inA >> 29;
            end
            5'b11110 : begin
                SHLRes <= inA << 30;
                SHRRes <= inA >> 30;
            end
            5'b11111 : begin
                SHLRes <= inA << 31;
                SHRRes <= inA >> 31;
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
    end
end
    
endmodule