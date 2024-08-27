// The Ryans
// This module is an example for the formot of a Verilog file

module example_module #(
    DATA_WIDTH = 32
) (
    input [DATA_WIDTH-1:0] din,
    input clk,
    input resetn,
    output last_bit_one,
    output reg [DATA_WIDTH-1:0] dout,
);
    // Internal signals / registers
    reg [DATA_WIDTH-1:0] din_clocked_copy;

    // Register Logic
    always @(posedge clk) begin
        if (!resetn) begin
            // Reset logic
            din_clocked_copy <= 0;
        end else begin
            // Regular register logic
            din_clocked_copy <= din;
        end
    end

    // Combinational Logic, either always @(*) or assign statements, 
    // try to avoid both
    always @(*) begin
        last_bit_one <= (din[DATA_WIDTH-1] == 1);
    end

    assign dout = (resetn) ? din_clocked_copy : 0;

endmodule