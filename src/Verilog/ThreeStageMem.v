module ThreeStageMem (
    input [12:0] Addr,
    input clk,
    input MemWrite,
    input [31:0] WData,
    output [31:0] MemRead
);
    wire [31:0] MemRead0    ;
    wire [31:0] MemRead1    ;
    wire [31:0] MemRead2    ;
    wire [31:0] MemRead3    ;
    wire [31:0] MemRead4    ;
    wire [31:0] MemRead5    ;
    wire [31:0] MemRead6    ;
    wire [31:0] MemRead7    ;
    wire [31:0] MemRead8    ;
    wire [31:0] MemRead9    ;
    wire [31:0] MemRead10   ;
    wire [31:0] MemRead11   ;
    wire [31:0] MemRead12   ;
    wire [31:0] MemRead13   ;
    wire [31:0] MemRead14   ;
    wire [31:0] MemRead15   ;
    wire [31:0] MemRead16   ;
    wire [31:0] MemRead17   ;
    wire [31:0] MemRead18   ;
    wire [31:0] MemRead19   ;
    wire [31:0] MemRead20   ;
    wire [31:0] MemRead21   ;
    wire [31:0] MemRead22   ;
    wire [31:0] MemRead23   ;
    wire [31:0] MemRead24   ;
    wire [31:0] MemRead25   ;
    wire [31:0] MemRead26   ;
    wire [31:0] MemRead27   ;
    wire [31:0] MemRead28   ;
    wire [31:0] MemRead29   ;
    wire [31:0] MemRead30   ;
    wire [31:0] MemRead31   ;
    wire [31:0] MemRead32   ;
    wire [31:0] MemRead33   ;
    wire [31:0] MemRead34   ;
    wire [31:0] MemRead35   ;
    wire [31:0] MemRead36   ;
    wire [31:0] MemRead37   ;
    wire [31:0] MemRead38   ;
    wire [31:0] MemRead39   ;
    wire [31:0] MemRead40   ;
    wire [31:0] MemRead41   ;
    wire [31:0] MemRead42   ;
    wire [31:0] MemRead43   ;
    wire [31:0] MemRead44   ;
    wire [31:0] MemRead45   ;
    wire [31:0] MemRead46   ;
    wire [31:0] MemRead47   ;
    wire [31:0] MemRead48   ;
    wire [31:0] MemRead49   ;
    wire [31:0] MemRead50   ;
    wire [31:0] MemRead51   ;
    wire [31:0] MemRead52   ;
    wire [31:0] MemRead53   ;
    wire [31:0] MemRead54   ;
    wire [31:0] MemRead55   ;
    wire [31:0] MemRead56   ;
    wire [31:0] MemRead57   ;
    wire [31:0] MemRead58   ;
    wire [31:0] MemRead59   ;
    wire [31:0] MemRead60   ;
    wire [31:0] MemRead61   ;
    wire [31:0] MemRead62   ;
    wire [31:0] MemRead63   ;
    wire [31:0] WindowRead  ;
    wire [31:0] StackRead   ;
    wire [12:0] AddrWire [2:0];
    assign AddrWire[0] = Addr;
    MemAccess AccessUnit (
        .Addr(AddrWire[0]),
        .WData(WData),
        .MemWrite(MemWrite),
        .clk(clk),
        .MemRead0 (MemRead0),
        .MemRead1 (MemRead1),
        .MemRead2 (MemRead2),
        .MemRead3 (MemRead3),
        .MemRead4 (MemRead4),
        .MemRead5 (MemRead5),
        .MemRead6 (MemRead6),
        .MemRead7 (MemRead7),
        .MemRead8 (MemRead8),
        .MemRead9 (MemRead9),
        .MemRead10 (MemRead10),
        .MemRead11 (MemRead11),
        .MemRead12 (MemRead12),
        .MemRead13 (MemRead13),
        .MemRead14 (MemRead14),
        .MemRead15 (MemRead15),
        .MemRead16 (MemRead16),
        .MemRead17 (MemRead17),
        .MemRead18 (MemRead18),
        .MemRead19 (MemRead19),
        .MemRead20 (MemRead20),
        .MemRead21 (MemRead21),
        .MemRead22 (MemRead22),
        .MemRead23 (MemRead23),
        .MemRead24 (MemRead24),
        .MemRead25 (MemRead25),
        .MemRead26 (MemRead26),
        .MemRead27 (MemRead27),
        .MemRead28 (MemRead28),
        .MemRead29 (MemRead29),
        .MemRead30 (MemRead30),
        .MemRead31 (MemRead31),
        .MemRead32 (MemRead32),
        .MemRead33 (MemRead33),
        .MemRead34 (MemRead34),
        .MemRead35 (MemRead35),
        .MemRead36 (MemRead36),
        .MemRead37 (MemRead37),
        .MemRead38 (MemRead38),
        .MemRead39 (MemRead39),
        .MemRead40 (MemRead40),
        .MemRead41 (MemRead41),
        .MemRead42 (MemRead42),
        .MemRead43 (MemRead43),
        .MemRead44 (MemRead44),
        .MemRead45 (MemRead45),
        .MemRead46 (MemRead46),
        .MemRead47 (MemRead47),
        .MemRead48 (MemRead48),
        .MemRead49 (MemRead49),
        .MemRead50 (MemRead50),
        .MemRead51 (MemRead51),
        .MemRead52 (MemRead52),
        .MemRead53 (MemRead53),
        .MemRead54 (MemRead54),
        .MemRead55 (MemRead55),
        .MemRead56 (MemRead56),
        .MemRead57 (MemRead57),
        .MemRead58 (MemRead58),
        .MemRead59 (MemRead59),
        .MemRead60 (MemRead60),
        .MemRead61 (MemRead61),
        .MemRead62 (MemRead62),
        .MemRead63 (MemRead63),
        .WindowRead (WindowRead),
        .StackRead (StackRead),
        .AddrOut (AddrWire[1])
    );
    wire [31:0] TopData;
    wire [31:0] BottomData;
    wire [31:0] ExtraData;
    MemParse1 Parse1Unit (
        .MemRead0(MemRead0),
        .MemRead1(MemRead1),
        .MemRead2(MemRead2),
        .MemRead3(MemRead3),
        .MemRead4(MemRead4),
        .MemRead5(MemRead5),
        .MemRead6(MemRead6),
        .MemRead7(MemRead7),
        .MemRead8(MemRead8),
        .MemRead9(MemRead9),
        .MemRead10(MemRead10),
        .MemRead11(MemRead11),
        .MemRead12(MemRead12),
        .MemRead13(MemRead13),
        .MemRead14(MemRead14),
        .MemRead15(MemRead15),
        .MemRead16(MemRead16),
        .MemRead17(MemRead17),
        .MemRead18(MemRead18),
        .MemRead19(MemRead19),
        .MemRead20(MemRead20),
        .MemRead21(MemRead21),
        .MemRead22(MemRead22),
        .MemRead23(MemRead23),
        .MemRead24(MemRead24),
        .MemRead25(MemRead25),
        .MemRead26(MemRead26),
        .MemRead27(MemRead27),
        .MemRead28(MemRead28),
        .MemRead29(MemRead29),
        .MemRead30(MemRead30),
        .MemRead31(MemRead31),
        .MemRead32(MemRead32),
        .MemRead33(MemRead33),
        .MemRead34(MemRead34),
        .MemRead35(MemRead35),
        .MemRead36(MemRead36),
        .MemRead37(MemRead37),
        .MemRead38(MemRead38),
        .MemRead39(MemRead39),
        .MemRead40(MemRead40),
        .MemRead41(MemRead41),
        .MemRead42(MemRead42),
        .MemRead43(MemRead43),
        .MemRead44(MemRead44),
        .MemRead45(MemRead45),
        .MemRead46(MemRead46),
        .MemRead47(MemRead47),
        .MemRead48(MemRead48),
        .MemRead49(MemRead49),
        .MemRead50(MemRead50),
        .MemRead51(MemRead51),
        .MemRead52(MemRead52),
        .MemRead53(MemRead53),
        .MemRead54(MemRead54),
        .MemRead55(MemRead55),
        .MemRead56(MemRead56),
        .MemRead57(MemRead57),
        .MemRead58(MemRead58),
        .MemRead59(MemRead59),
        .MemRead60(MemRead60),
        .MemRead61(MemRead61),
        .MemRead62(MemRead62),
        .MemRead63(MemRead63),
        .WindowRead(WindowRead),
        .StackRead(StackRead),
        .Addr(AddrWire[1]),
        .clk(clk),
        .TopDataOut(TopData),
        .BottomDataOut(BottomData),
        .ExtraDataOut(ExtraData),
        .AddrOut(AddrWire[2])
    );
    MemParse2 Parse2Unit (
        .clk(clk),
        .BottomData(BottomData),
        .TopData(TopData),
        .ExtraData(ExtraData),
        .Addr(AddrWire[2]),
        .MemRead(MemRead)
    );

    
endmodule