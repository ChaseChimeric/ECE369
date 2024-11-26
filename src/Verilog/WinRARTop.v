`ifndef wrtop
`define wrtop
module WinRARTop (
    input Clk,
    input Reset,
    output [6:0] out7,
    output [7:0] en_out,
    output [1:0] led
);
    wire [31:0] NumberA;
    wire [31:0] NumberB;
    
    reg [14:0] clockReg;
    reg [15:0] resetShiftReg;
    
    
    always @(posedge Clk) begin
        if(Reset) begin
            clockReg <= 0;
            resetShiftReg <= 1;
        end else begin
            clockReg <= clockReg + 1;
            resetShiftReg <= (resetShiftReg != 0) ? resetShiftReg +1 : 0;
        end
        
    end
    
    Two4DigitDisplay uut (
        .Clk(Clk),
        .NumberA(NumberA[15:0]),
        .NumberB(NumberB[15:0]),
        .out7(out7),
        .en_out(en_out)
    );
    
    WinRAR cpu (
        .clk(clockReg[14]),
        .rst(resetShiftReg != 0),
        .XPos(NumberA),
        .YPos(NumberB)
    );
    
endmodule
`endif