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
    
    reg [5:0] clockReg;
    reg [5:0] resetShiftReg;
    
    
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
    
    Two4DigitDisplay uut (
        .Clk(clockReg[2]),
        .NumberA(NumberA[15:0]),
        .NumberB(NumberB[15:0]),
        .out7(out7),
        .en_out(en_out)
    );
    
    WinRAR cpu (
        .clk(Clk),
        .rst(resetShiftReg == 3),
        .XPos(NumberA),
        .YPos(NumberB)
    );
    
endmodule
`endif