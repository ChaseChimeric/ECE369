
module WinRARTop_tb;

  // Parameters

  //Ports
  reg clk;
  reg rst;
  wire [6:0] out7;
  wire [7:0] en_out;
  wire [1:0] led;

  WinRARTop  WinRARTop_inst (
    .Clk(clk),
    .Reset(rst),
    .out7(out7),
    .en_out(en_out),
    .led(led)
  );

always #5  clk = ! clk ;

    initial begin
        clk <= 0;
        rst <= 1;
        #10;
        rst <= 0;
    end

endmodule