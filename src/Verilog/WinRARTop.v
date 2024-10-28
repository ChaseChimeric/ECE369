module WinRARTop (
    input clk,
    input rst,
    output [6:0] out7,
    output [7:0] en_out
);
    wire [31:0] NumberA;
    wire [31:0] NumberB;
    wire clockMod;

    ClkDiv clkdiv(
        .Clk(Clk), 
        .Rst(Reset), 
        .ClkOut(clockMod));
    
    Two4DigitDisplay uut (
        .Clk(clockMod),
        .NumberA(NumberA[15:0]),
        .NumberB(NumberB[15:0]),
        .out7(),
        .en_out()
    );
    
    WinRAR cpu (
        .clk(clockMod),
        .rst(rst),
        .PC(NumberA),
        .WriteData(NumberB)
    );
    
endmodule