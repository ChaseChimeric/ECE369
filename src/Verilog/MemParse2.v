module MemParse2 (
    input clk,
    input [31:0] BottomData,
    input [31:0] TopData,
    input [31:0] ExtraData,
    input [12:0] Addr,
    output reg [31:0] MemRead
);

    always @(posedge clk ) begin
        case (Addr[12:11])
            2'd0    :   MemRead <= BottomData;
            2'd1    :   MemRead <= TopData;
            2'd2    :   MemRead <= ExtraData; 
            default :   MemRead <= 32'd0;
        endcase
    end
    
endmodule