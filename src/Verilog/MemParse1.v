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
    input [31:0] AddrOut,
    input clk,
    output [31:0] TopDataOut,
    output [31:0] BottomDataOut,
    output [31:0] ExtraDataOut,
    output [12:0] Addr
);

    always @(posedge clk ) begin
        case (Addr[10:6])
            5'd0    :   TopDataOut <= MemRead0  ;
            5'd1    :   TopDataOut <= MemRead1  ;
            5'd2    :   TopDataOut <= MemRead2  ;
            5'd3    :   TopDataOut <= MemRead3  ;
            5'd4    :   TopDataOut <= MemRead4  ;
            5'd5    :   TopDataOut <= MemRead5  ;
            5'd6    :   TopDataOut <= MemRead6  ;
            5'd7    :   TopDataOut <= MemRead7  ;
            5'd8    :   TopDataOut <= MemRead8  ;
            5'd9    :   TopDataOut <= MemRead9  ;
            5'd10   :   TopDataOut <= MemRead10 ;
            5'd11   :   TopDataOut <= MemRead11 ;
            5'd12   :   TopDataOut <= MemRead12 ;
            5'd13   :   TopDataOut <= MemRead13 ;
            5'd14   :   TopDataOut <= MemRead14 ;
            5'd15   :   TopDataOut <= MemRead15 ;
            5'd16   :   TopDataOut <= MemRead16 ;
            5'd17   :   TopDataOut <= MemRead17 ;
            5'd18   :   TopDataOut <= MemRead18 ;
            5'd19   :   TopDataOut <= MemRead19 ;
            5'd20   :   TopDataOut <= MemRead20 ;
            5'd21   :   TopDataOut <= MemRead21 ;
            5'd22   :   TopDataOut <= MemRead22 ;
            5'd23   :   TopDataOut <= MemRead23 ;
            5'd24   :   TopDataOut <= MemRead24 ;
            5'd25   :   TopDataOut <= MemRead25 ;
            5'd26   :   TopDataOut <= MemRead26 ;
            5'd27   :   TopDataOut <= MemRead27 ;
            5'd28   :   TopDataOut <= MemRead28 ;
            5'd29   :   TopDataOut <= MemRead29 ;
            5'd30   :   TopDataOut <= MemRead30 ;
            5'd31   :   TopDataOut <= MemRead31 ;
            default:    TopDataOut <= 32'd0     ;
        endcase
        case (Addr[11:6])
            5'd0    :   BottomDataOut <= MemRead32 ;
            5'd1    :   BottomDataOut <= MemRead33 ;
            5'd2    :   BottomDataOut <= MemRead34 ;
            5'd3    :   BottomDataOut <= MemRead35 ;
            5'd4    :   BottomDataOut <= MemRead36 ;
            5'd5    :   BottomDataOut <= MemRead37 ;
            5'd6    :   BottomDataOut <= MemRead38 ;
            5'd7    :   BottomDataOut <= MemRead39 ;
            5'd8    :   BottomDataOut <= MemRead40 ;
            5'd9    :   BottomDataOut <= MemRead41 ;
            5'd10   :   BottomDataOut <= MemRead42 ;
            5'd11   :   BottomDataOut <= MemRead43 ;
            5'd12   :   BottomDataOut <= MemRead44 ;
            5'd13   :   BottomDataOut <= MemRead45 ;
            5'd14   :   BottomDataOut <= MemRead46 ;
            5'd15   :   BottomDataOut <= MemRead47 ;
            5'd16   :   BottomDataOut <= MemRead48 ;
            5'd17   :   BottomDataOut <= MemRead49 ;
            5'd18   :   BottomDataOut <= MemRead50 ;
            5'd19   :   BottomDataOut <= MemRead51 ;
            5'd20   :   BottomDataOut <= MemRead52 ;
            5'd21   :   BottomDataOut <= MemRead53 ;
            5'd22   :   BottomDataOut <= MemRead54 ;
            5'd23   :   BottomDataOut <= MemRead55 ;
            5'd24   :   BottomDataOut <= MemRead56 ;
            5'd25   :   BottomDataOut <= MemRead57 ;
            5'd26   :   BottomDataOut <= MemRead58 ;
            5'd27   :   BottomDataOut <= MemRead59 ;
            5'd28   :   BottomDataOut <= MemRead60 ;
            5'd29   :   BottomDataOut <= MemRead61 ;
            5'd30   :   BottomDataOut <= MemRead62 ;
            5'd31   :   BottomDataOut <= MemRead63 ;
            default:    BottomDataOut <= 32'd0     ;
        endcase
        case (Addr[6]) 
            1'd0    :   ExtraDataOut <= WindowRead ;
            1'd1    :   ExtraDataOut <= StackRead  ;
            default :   ExtraDataOut <= 32'd0      ;
        endcase
    end
    
endmodule