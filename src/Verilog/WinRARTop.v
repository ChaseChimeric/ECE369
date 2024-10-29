module WinRARTop (
    input Clk,
    input Reset,
    output [6:0] out7,
    output [7:0] en_out
);
    wire [31:0] NumberA;
    wire [31:0] NumberB;
    wire clockMod;

    ClkDiv clkdiv(
        .Clk(Clk), 
        .Rst(0), 
        .ClkOut(clockMod));
    
    Two4DigitDisplay uut (
        .Clk(Clk),
        .NumberA(NumberA[15:0]),
        .NumberB(NumberB[15:0]),
        .out7(out7),
        .en_out(en_out)
    );
    
    WinRAR cpu (
        .clk(clockMod),
        .rst(Reset),
        .instrMemAddressOut(NumberA),
        .WriteData(NumberB)
    );
    
endmodule