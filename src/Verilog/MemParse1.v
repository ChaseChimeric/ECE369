module MemParse1 (
    input [31:0] MemRead0,
    input [31:0] MemRead1,
    input [31:0] MemRead2,
    input [31:0] MemRead3,
    input [31:0] MemRead4,
    input [31:0] MemRead5,
    input [31:0] MemRead6,
    input [31:0] MemRead7,
    input [31:0] MemRead8,
    input [31:0] MemRead9,
    input [31:0] MemRead10,
    input [31:0] MemRead11,
    input [31:0] MemRead12,
    input [31:0] MemRead13,
    input [31:0] MemRead14,
    input [31:0] MemRead15,
    input [31:0] MemRead16,
    input [31:0] MemRead17,
    input [31:0] MemRead18,
    input [31:0] MemRead19,
    input [31:0] MemRead20,
    input [31:0] MemRead21,
    input [31:0] MemRead22,
    input [31:0] MemRead23,
    input [31:0] MemRead24,
    input [31:0] MemRead25,
    input [31:0] MemRead26,
    input [31:0] MemRead27,
    input [31:0] MemRead28,
    input [31:0] MemRead29,
    input [31:0] MemRead30,
    input [31:0] MemRead31,
    input [31:0] MemRead32,
    input [31:0] MemRead33,
    input [31:0] MemRead34,
    input [31:0] MemRead35,
    input [31:0] MemRead36,
    input [31:0] MemRead37,
    input [31:0] MemRead38,
    input [31:0] MemRead39,
    input [31:0] MemRead40,
    input [31:0] MemRead41,
    input [31:0] MemRead42,
    input [31:0] MemRead43,
    input [31:0] MemRead44,
    input [31:0] MemRead45,
    input [31:0] MemRead46,
    input [31:0] MemRead47,
    input [31:0] MemRead48,
    input [31:0] MemRead49,
    input [31:0] MemRead50,
    input [31:0] MemRead51,
    input [31:0] MemRead52,
    input [31:0] MemRead53,
    input [31:0] MemRead54,
    input [31:0] MemRead55,
    input [31:0] MemRead56,
    input [31:0] MemRead57,
    input [31:0] MemRead58,
    input [31:0] MemRead59,
    input [31:0] MemRead60,
    input [31:0] MemRead61,
    input [31:0] MemRead62,
    input [31:0] MemRead63,
    input [31:0] WindowRead,
    input [31:0] StackRead,
    input [12:0] Addr,
    input clk,
    output reg [31:0] TopDataOut,
    output reg [31:0] BottomDataOut,
    output reg [31:0] ExtraDataOut,
    output reg [12:0] AddrOut
);
    always @(posedge clk ) begin
        case (Addr[10:6])
            5'd0    :   BottomDataOut <= MemRead0  ;
            5'd1    :   BottomDataOut <= MemRead1  ;
            5'd2    :   BottomDataOut <= MemRead2  ;
            5'd3    :   BottomDataOut <= MemRead3  ;
            5'd4    :   BottomDataOut <= MemRead4  ;
            5'd5    :   BottomDataOut <= MemRead5  ;
            5'd6    :   BottomDataOut <= MemRead6  ;
            5'd7    :   BottomDataOut <= MemRead7  ;
            5'd8    :   BottomDataOut <= MemRead8  ;
            5'd9    :   BottomDataOut <= MemRead9  ;
            5'd10   :   BottomDataOut <= MemRead10 ;
            5'd11   :   BottomDataOut <= MemRead11 ;
            5'd12   :   BottomDataOut <= MemRead12 ;
            5'd13   :   BottomDataOut <= MemRead13 ;
            5'd14   :   BottomDataOut <= MemRead14 ;
            5'd15   :   BottomDataOut <= MemRead15 ;
            5'd16   :   BottomDataOut <= MemRead16 ;
            5'd17   :   BottomDataOut <= MemRead17 ;
            5'd18   :   BottomDataOut <= MemRead18 ;
            5'd19   :   BottomDataOut <= MemRead19 ;
            5'd20   :   BottomDataOut <= MemRead20 ;
            5'd21   :   BottomDataOut <= MemRead21 ;
            5'd22   :   BottomDataOut <= MemRead22 ;
            5'd23   :   BottomDataOut <= MemRead23 ;
            5'd24   :   BottomDataOut <= MemRead24 ;
            5'd25   :   BottomDataOut <= MemRead25 ;
            5'd26   :   BottomDataOut <= MemRead26 ;
            5'd27   :   BottomDataOut <= MemRead27 ;
            5'd28   :   BottomDataOut <= MemRead28 ;
            5'd29   :   BottomDataOut <= MemRead29 ;
            5'd30   :   BottomDataOut <= MemRead30 ;
            5'd31   :   BottomDataOut <= MemRead31 ;
            default:    BottomDataOut <= 32'd0     ;
        endcase
        case (Addr[11:6])
            5'd0    :   TopDataOut  <= MemRead32 ;
            5'd1    :   TopDataOut  <= MemRead33 ;
            5'd2    :   TopDataOut  <= MemRead34 ;
            5'd3    :   TopDataOut  <= MemRead35 ;
            5'd4    :   TopDataOut  <= MemRead36 ;
            5'd5    :   TopDataOut  <= MemRead37 ;
            5'd6    :   TopDataOut  <= MemRead38 ;
            5'd7    :   TopDataOut  <= MemRead39 ;
            5'd8    :   TopDataOut  <= MemRead40 ;
            5'd9    :   TopDataOut  <= MemRead41 ;
            5'd10   :   TopDataOut  <= MemRead42 ;
            5'd11   :   TopDataOut  <= MemRead43 ;
            5'd12   :   TopDataOut  <= MemRead44 ;
            5'd13   :   TopDataOut  <= MemRead45 ;
            5'd14   :   TopDataOut  <= MemRead46 ;
            5'd15   :   TopDataOut  <= MemRead47 ;
            5'd16   :   TopDataOut  <= MemRead48 ;
            5'd17   :   TopDataOut  <= MemRead49 ;
            5'd18   :   TopDataOut  <= MemRead50 ;
            5'd19   :   TopDataOut  <= MemRead51 ;
            5'd20   :   TopDataOut  <= MemRead52 ;
            5'd21   :   TopDataOut  <= MemRead53 ;
            5'd22   :   TopDataOut  <= MemRead54 ;
            5'd23   :   TopDataOut  <= MemRead55 ;
            5'd24   :   TopDataOut  <= MemRead56 ;
            5'd25   :   TopDataOut  <= MemRead57 ;
            5'd26   :   TopDataOut  <= MemRead58 ;
            5'd27   :   TopDataOut  <= MemRead59 ;
            5'd28   :   TopDataOut  <= MemRead60 ;
            5'd29   :   TopDataOut  <= MemRead61 ;
            5'd30   :   TopDataOut  <= MemRead62 ;
            5'd31   :   TopDataOut  <= MemRead63 ;
            default:    TopDataOut  <= 32'd0     ;
        endcase
        case (Addr[6]) 
            1'd0    :   ExtraDataOut <= WindowRead ;
            1'd1    :   ExtraDataOut <= StackRead  ;
            default :   ExtraDataOut <= 32'd0      ;
        endcase
        AddrOut <= Addr;
    end
    
endmodule