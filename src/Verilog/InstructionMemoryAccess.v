`ifndef _InstructionMemoryAccess
`define _InstructionMemoryAccess
module InstructionMemoryAccess (
    input [12:0] Addr,
    input clk,
    output reg [31:0] MemRead0,
    output reg [31:0] MemRead1,
    output reg [31:0] MemRead2,
    output reg [31:0] MemRead3,
    output reg [31:0] AddressOut
);
    reg [31:0] Mem0      [63:0];
    reg [31:0] Mem1      [63:0];
    reg [31:0] Mem2      [63:0];
    reg [31:0] Mem3      [63:0];

    // For Comp
    integer i;
    initial begin
        $readmemh("InstrMem0.mem", Mem0);    
        $readmemh("InstrMem1.mem", Mem1);    
        $readmemh("InstrMem2.mem", Mem2);    
        $readmemh("InstrMem3.mem", Mem3);   
    end

    always @(posedge clk) begin
        MemRead0    <= {24'd0, Mem0[Addr[5:0]]};
        MemRead1    <= {24'd0, Mem1[Addr[5:0]]};
        MemRead2    <= {24'd0, Mem2[Addr[5:0]]};
        MemRead3    <= {24'd0, Mem3[Addr[5:0]]};
        AddressOut <= Addr;
    end


endmodule   
`endif