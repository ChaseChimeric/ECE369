`ifndef wrtop
`define wrtop
module WinRARTop (
    input Clk,
    input Reset,
    output [6:0] out7,
    output [7:0] en_out,
    output [3:0] led
);
    wire [31:0] NumberA;
    wire [31:0] NumberB;
    
    reg [23:0] clockReg;
    reg [16:0] resetShiftReg;
    
    
    always @(posedge Clk) begin
        if(Reset) begin
            clockReg <= 0;
            resetShiftReg <= 1;
        end else begin
            clockReg <= clockReg + 1;
            resetShiftReg <= (resetShiftReg != 0) ? resetShiftReg +1 : 0;
        end
        
    end
    
    assign led[0] = NumberA < 100;
    assign led[1] = NumberB < 100;
    assign led[2] = resetShiftReg != 0;
    assign led[3] = clockReg[14];
    
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