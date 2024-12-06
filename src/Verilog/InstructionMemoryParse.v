`ifndef _InstructionMemoryParse
`define _InstructionMemoryParse
module InstructionMemoryParse (
    input rst,
    input clk,
    input [12:0] Address,
    input [31:0] Instruction0,
    input [31:0] Instruction1,
    input [31:0] Instruction2,
    input [31:0] Instruction3,
    output reg [31:0] instrOut,
    output reg [12:0] AddressOut
);
always @(posedge clk ) begin
    case (Address[7:6])
        2'b00: instrOut <= Instruction0; 
        2'b01: instrOut <= Instruction1; 
        2'b10: instrOut <= Instruction2; 
        2'b11: instrOut <= Instruction3; 
        default: instrOut <= 0;
    endcase
    AddressOut <= Address;
end
    
endmodule
`endif