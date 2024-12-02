module MemAccess (
    input [12:0] Addr,
    input [31:0] WData,
    input MemWrite,
    input clk,
    output reg [31:0] MemRead0,
    output reg [31:0] MemRead1,
    output reg [31:0] MemRead2,
    output reg [31:0] MemRead3,
    output reg [31:0] MemRead4,
    output reg [31:0] MemRead5,
    output reg [31:0] MemRead6,
    output reg [31:0] MemRead7,
    output reg [31:0] MemRead8,
    output reg [31:0] MemRead9,
    output reg [31:0] MemRead10,
    output reg [31:0] MemRead11,
    output reg [31:0] MemRead12,
    output reg [31:0] MemRead13,
    output reg [31:0] MemRead14,
    output reg [31:0] MemRead15,
    output reg [31:0] MemRead16,
    output reg [31:0] MemRead17,
    output reg [31:0] MemRead18,
    output reg [31:0] MemRead19,
    output reg [31:0] MemRead20,
    output reg [31:0] MemRead21,
    output reg [31:0] MemRead22,
    output reg [31:0] MemRead23,
    output reg [31:0] MemRead24,
    output reg [31:0] MemRead25,
    output reg [31:0] MemRead26,
    output reg [31:0] MemRead27,
    output reg [31:0] MemRead28,
    output reg [31:0] MemRead29,
    output reg [31:0] MemRead30,
    output reg [31:0] MemRead31,
    output reg [31:0] MemRead32,
    output reg [31:0] MemRead33,
    output reg [31:0] MemRead34,
    output reg [31:0] MemRead35,
    output reg [31:0] MemRead36,
    output reg [31:0] MemRead37,
    output reg [31:0] MemRead38,
    output reg [31:0] MemRead39,
    output reg [31:0] MemRead40,
    output reg [31:0] MemRead41,
    output reg [31:0] MemRead42,
    output reg [31:0] MemRead43,
    output reg [31:0] MemRead44,
    output reg [31:0] MemRead45,
    output reg [31:0] MemRead46,
    output reg [31:0] MemRead47,
    output reg [31:0] MemRead48,
    output reg [31:0] MemRead49,
    output reg [31:0] MemRead50,
    output reg [31:0] MemRead51,
    output reg [31:0] MemRead52,
    output reg [31:0] MemRead53,
    output reg [31:0] MemRead54,
    output reg [31:0] MemRead55,
    output reg [31:0] MemRead56,
    output reg [31:0] MemRead57,
    output reg [31:0] MemRead58,
    output reg [31:0] MemRead59,
    output reg [31:0] MemRead60,
    output reg [31:0] MemRead61,
    output reg [31:0] MemRead62,
    output reg [31:0] MemRead63,
    output reg [31:0] WindowRead,
    output reg [31:0] StackRead,
    output reg [12:0] AddrOut
);
    reg [7:0] Mem0      [63:0];
    reg [7:0] Mem1      [63:0];
    reg [7:0] Mem2      [63:0];
    reg [7:0] Mem3      [63:0];
    reg [7:0] Mem4      [63:0];
    reg [7:0] Mem5      [63:0];
    reg [7:0] Mem6      [63:0];
    reg [7:0] Mem7      [63:0];
    reg [7:0] Mem8      [63:0];
    reg [7:0] Mem9      [63:0];
    reg [7:0] Mem10     [63:0];
    reg [7:0] Mem11     [63:0];
    reg [7:0] Mem12     [63:0];
    reg [7:0] Mem13     [63:0];
    reg [7:0] Mem14     [63:0];
    reg [7:0] Mem15     [63:0];
    reg [7:0] Mem16     [63:0];
    reg [7:0] Mem17     [63:0];
    reg [7:0] Mem18     [63:0];
    reg [7:0] Mem19     [63:0];
    reg [7:0] Mem20     [63:0];
    reg [7:0] Mem21     [63:0];
    reg [7:0] Mem22     [63:0];
    reg [7:0] Mem23     [63:0];
    reg [7:0] Mem24     [63:0];
    reg [7:0] Mem25     [63:0];
    reg [7:0] Mem26     [63:0];
    reg [7:0] Mem27     [63:0];
    reg [7:0] Mem28     [63:0];
    reg [7:0] Mem29     [63:0];
    reg [7:0] Mem30     [63:0];
    reg [7:0] Mem31     [63:0];
    reg [7:0] Mem32     [63:0];
    reg [7:0] Mem33     [63:0];
    reg [7:0] Mem34     [63:0];
    reg [7:0] Mem35     [63:0];
    reg [7:0] Mem36     [63:0];
    reg [7:0] Mem37     [63:0];
    reg [7:0] Mem38     [63:0];
    reg [7:0] Mem39     [63:0];
    reg [7:0] Mem40     [63:0];
    reg [7:0] Mem41     [63:0];
    reg [7:0] Mem42     [63:0];
    reg [7:0] Mem43     [63:0];
    reg [7:0] Mem44     [63:0];
    reg [7:0] Mem45     [63:0];
    reg [7:0] Mem46     [63:0];
    reg [7:0] Mem47     [63:0];
    reg [7:0] Mem48     [63:0];
    reg [7:0] Mem49     [63:0];
    reg [7:0] Mem50     [63:0];
    reg [7:0] Mem51     [63:0];
    reg [7:0] Mem52     [63:0];
    reg [7:0] Mem53     [63:0];
    reg [7:0] Mem54     [63:0];
    reg [7:0] Mem55     [63:0];
    reg [7:0] Mem56     [63:0];
    reg [7:0] Mem57     [63:0];
    reg [7:0] Mem58     [63:0];
    reg [7:0] Mem59     [63:0];
    reg [7:0] Mem60     [63:0];
    reg [7:0] Mem61     [63:0];
    reg [7:0] Mem62     [63:0];
    reg [7:0] Mem63     [63:0];
    reg [7:0] Window    [63:0];
    reg [31:0] Stack    [63:0];

    // For Comp
    integer i;
    reg [31:0] tempReg [4160:0];
    initial begin
        $readmemh("data_memory.mem", tempReg);
        for (i = 0; i < 64; i = i + 1) begin
            Mem0[i]    = tempReg[i + 0 * 64][7:0]  ;
            Mem1[i]    = tempReg[i + 1 * 64][7:0]  ;
            Mem2[i]    = tempReg[i + 2 * 64][7:0]  ;
            Mem3[i]    = tempReg[i + 3 * 64][7:0]  ;
            Mem4[i]    = tempReg[i + 4 * 64][7:0]  ;
            Mem5[i]    = tempReg[i + 5 * 64][7:0]  ;
            Mem6[i]    = tempReg[i + 6 * 64][7:0]  ;
            Mem7[i]    = tempReg[i + 7 * 64][7:0]  ;
            Mem8[i]    = tempReg[i + 8 * 64][7:0]  ;
            Mem9[i]    = tempReg[i + 9 * 64][7:0]  ;
            Mem10[i]   = tempReg[i + 10 * 64][7:0] ;
            Mem11[i]   = tempReg[i + 11 * 64][7:0] ;
            Mem12[i]   = tempReg[i + 12 * 64][7:0] ;
            Mem13[i]   = tempReg[i + 13 * 64][7:0] ;
            Mem14[i]   = tempReg[i + 14 * 64][7:0] ;
            Mem15[i]   = tempReg[i + 15 * 64][7:0] ;
            Mem16[i]   = tempReg[i + 16 * 64][7:0] ;
            Mem17[i]   = tempReg[i + 17 * 64][7:0] ;
            Mem18[i]   = tempReg[i + 18 * 64][7:0] ;
            Mem19[i]   = tempReg[i + 19 * 64][7:0] ;
            Mem20[i]   = tempReg[i + 20 * 64][7:0] ;
            Mem21[i]   = tempReg[i + 21 * 64][7:0] ;
            Mem22[i]   = tempReg[i + 22 * 64][7:0] ;
            Mem23[i]   = tempReg[i + 23 * 64][7:0] ;
            Mem24[i]   = tempReg[i + 24 * 64][7:0] ;
            Mem25[i]   = tempReg[i + 25 * 64][7:0] ;
            Mem26[i]   = tempReg[i + 26 * 64][7:0] ;
            Mem27[i]   = tempReg[i + 27 * 64][7:0] ;
            Mem28[i]   = tempReg[i + 28 * 64][7:0] ;
            Mem29[i]   = tempReg[i + 29 * 64][7:0] ;
            Mem30[i]   = tempReg[i + 30 * 64][7:0] ;
            Mem31[i]   = tempReg[i + 31 * 64][7:0] ;
            Mem32[i]   = tempReg[i + 32 * 64][7:0] ;
            Mem33[i]   = tempReg[i + 33 * 64][7:0] ;
            Mem34[i]   = tempReg[i + 34 * 64][7:0] ;
            Mem35[i]   = tempReg[i + 35 * 64][7:0] ;
            Mem36[i]   = tempReg[i + 36 * 64][7:0] ;
            Mem37[i]   = tempReg[i + 37 * 64][7:0] ;
            Mem38[i]   = tempReg[i + 38 * 64][7:0] ;
            Mem39[i]   = tempReg[i + 39 * 64][7:0] ;
            Mem40[i]   = tempReg[i + 40 * 64][7:0] ;
            Mem41[i]   = tempReg[i + 41 * 64][7:0] ;
            Mem42[i]   = tempReg[i + 42 * 64][7:0] ;
            Mem43[i]   = tempReg[i + 43 * 64][7:0] ;
            Mem44[i]   = tempReg[i + 44 * 64][7:0] ;
            Mem45[i]   = tempReg[i + 45 * 64][7:0] ;
            Mem46[i]   = tempReg[i + 46 * 64][7:0] ;
            Mem47[i]   = tempReg[i + 47 * 64][7:0] ;
            Mem48[i]   = tempReg[i + 48 * 64][7:0] ;
            Mem49[i]   = tempReg[i + 49 * 64][7:0] ;
            Mem50[i]   = tempReg[i + 50 * 64][7:0] ;
            Mem51[i]   = tempReg[i + 51 * 64][7:0] ;
            Mem52[i]   = tempReg[i + 52 * 64][7:0] ;
            Mem53[i]   = tempReg[i + 53 * 64][7:0] ;
            Mem54[i]   = tempReg[i + 54 * 64][7:0] ;
            Mem55[i]   = tempReg[i + 55 * 64][7:0] ;
            Mem56[i]   = tempReg[i + 56 * 64][7:0] ;
            Mem57[i]   = tempReg[i + 57 * 64][7:0] ;
            Mem58[i]   = tempReg[i + 58 * 64][7:0] ;
            Mem59[i]   = tempReg[i + 59 * 64][7:0] ;
            Mem60[i]   = tempReg[i + 60 * 64][7:0] ;
            Mem61[i]   = tempReg[i + 61 * 64][7:0] ;
            Mem62[i]   = tempReg[i + 62 * 64][7:0] ;
            Mem63[i]   = tempReg[i + 63 * 64][7:0] ;
            Window[i]  = tempReg[i + 64 * 64][7:0] ;
        end
    end
    
    // For Testing idk man

//     integer i1;
//     integer i2;
//     integer i3;
//     integer i4;
//     integer i5;
//     initial begin
//        for(i1 = 0; i1 < 64; i1 = i1 + 1) begin
//            Mem0[i1] = i1;
//            Mem4[i1] = i1;
//            Mem8[i1] = i1;
//            Mem12[i1] = i1;
//            Mem16[i1] = i1;
//            Mem20[i1] = i1;
//            Mem24[i1] = i1;
//            Mem28[i1] = i1;
//            Mem32[i1] = i1;
//            Mem36[i1] = i1;
//            Mem40[i1] = i1;
//            Mem44[i1] = i1;
//            Mem48[i1] = i1;
//            Mem52[i1] = i1;
//            Mem56[i1] = i1;
//            Mem60[i1] = i1;
//            Window[i1] = i1 * 2 + 3;
//        end
//        for(i2 = 64; i2 < 128; i2 = i2 + 1) begin
//            Mem1[i2-64] = i2;
//            Mem5[i2-64] = i2;
//            Mem9[i2-64] = i2;
//            Mem13[i2-64] = i2;
//            Mem17[i2-64] = i2;
//            Mem21[i2-64] = i2;
//            Mem25[i2-64] = i2;
//            Mem29[i2-64] = i2;
//            Mem33[i2-64] = i2;
//            Mem37[i2-64] = i2;
//            Mem41[i2-64] = i2;
//            Mem45[i2-64] = i2;
//            Mem49[i2-64] = i2;
//            Mem53[i2-64] = i2;
//            Mem57[i2-64] = i2;
//            Mem61[i2-64] = i2;
//        end
//        for(i3 = 128; i3 < 192; i3 = i3 + 1) begin
//            Mem2[i3-128] = i3;
//            Mem6[i3-128] = i3;
//            Mem10[i3-128] = i3;
//            Mem14[i3-128] = i3;
//            Mem18[i3-128] = i3;
//            Mem22[i3-128] = i3;
//            Mem26[i3-128] = i3;
//            Mem30[i3-128] = i3;
//            Mem34[i3-128] = i3;
//            Mem38[i3-128] = i3;
//            Mem42[i3-128] = i3;
//            Mem46[i3-128] = i3;
//            Mem50[i3-128] = i3;
//            Mem54[i3-128] = i3;
//            Mem58[i3-128] = i3;
//            Mem62[i3-128] = i3;
//        end
//        for(i4 = 192; i4 < 255; i4 = i4 + 1) begin
//            Mem3[i4-192] = i4;
//            Mem7[i4-192] = i4;
//            Mem11[i4-192] = i4;
//            Mem15[i4-192] = i4;
//            Mem19[i4-192] = i4;
//            Mem23[i4-192] = i4;
//            Mem27[i4-192] = i4;
//            Mem31[i4-192] = i4;
//            Mem35[i4-192] = i4;
//            Mem39[i4-192] = i4;
//            Mem43[i4-192] = i4;
//            Mem47[i4-192] = i4;
//            Mem51[i4-192] = i4;
//            Mem55[i4-192] = i4;
//            Mem59[i4-192] = i4;
//            Mem63[i4-192] = i4;
//        end
//        for(i5 = 0; i5 < 64; i5 = i5 + 1) begin
//            Stack[i5] = i5 * 100 + 100;
//        end
//     end

    always @(posedge clk) begin
        MemRead0    <= {24'd0, Mem0[Addr[5:0]]};
        MemRead1    <= {24'd0, Mem1[Addr[5:0]]};
        MemRead2    <= {24'd0, Mem2[Addr[5:0]]};
        MemRead3    <= {24'd0, Mem3[Addr[5:0]]};
        MemRead4    <= {24'd0, Mem4[Addr[5:0]]};
        MemRead5    <= {24'd0, Mem5[Addr[5:0]]};
        MemRead6    <= {24'd0, Mem6[Addr[5:0]]};
        MemRead7    <= {24'd0, Mem7[Addr[5:0]]};
        MemRead8    <= {24'd0, Mem8[Addr[5:0]]};
        MemRead9    <= {24'd0, Mem9[Addr[5:0]]};
        MemRead10   <= {24'd0, Mem10[Addr[5:0]]};
        MemRead11   <= {24'd0, Mem11[Addr[5:0]]};
        MemRead12   <= {24'd0, Mem12[Addr[5:0]]};
        MemRead13   <= {24'd0, Mem13[Addr[5:0]]};
        MemRead14   <= {24'd0, Mem14[Addr[5:0]]};
        MemRead15   <= {24'd0, Mem15[Addr[5:0]]};
        MemRead16   <= {24'd0, Mem16[Addr[5:0]]};
        MemRead17   <= {24'd0, Mem17[Addr[5:0]]};
        MemRead18   <= {24'd0, Mem18[Addr[5:0]]};
        MemRead19   <= {24'd0, Mem19[Addr[5:0]]};
        MemRead20   <= {24'd0, Mem20[Addr[5:0]]};
        MemRead21   <= {24'd0, Mem21[Addr[5:0]]};
        MemRead22   <= {24'd0, Mem22[Addr[5:0]]};
        MemRead23   <= {24'd0, Mem23[Addr[5:0]]};
        MemRead24   <= {24'd0, Mem24[Addr[5:0]]};
        MemRead25   <= {24'd0, Mem25[Addr[5:0]]};
        MemRead26   <= {24'd0, Mem26[Addr[5:0]]};
        MemRead27   <= {24'd0, Mem27[Addr[5:0]]};
        MemRead28   <= {24'd0, Mem28[Addr[5:0]]};
        MemRead29   <= {24'd0, Mem29[Addr[5:0]]};
        MemRead30   <= {24'd0, Mem30[Addr[5:0]]};
        MemRead31   <= {24'd0, Mem31[Addr[5:0]]};
        MemRead32   <= {24'd0, Mem32[Addr[5:0]]};
        MemRead33   <= {24'd0, Mem33[Addr[5:0]]};
        MemRead34   <= {24'd0, Mem34[Addr[5:0]]};
        MemRead35   <= {24'd0, Mem35[Addr[5:0]]};
        MemRead36   <= {24'd0, Mem36[Addr[5:0]]};
        MemRead37   <= {24'd0, Mem37[Addr[5:0]]};
        MemRead38   <= {24'd0, Mem38[Addr[5:0]]};
        MemRead39   <= {24'd0, Mem39[Addr[5:0]]};
        MemRead40   <= {24'd0, Mem40[Addr[5:0]]};
        MemRead41   <= {24'd0, Mem41[Addr[5:0]]};
        MemRead42   <= {24'd0, Mem42[Addr[5:0]]};
        MemRead43   <= {24'd0, Mem43[Addr[5:0]]};
        MemRead44   <= {24'd0, Mem44[Addr[5:0]]};
        MemRead45   <= {24'd0, Mem45[Addr[5:0]]};
        MemRead46   <= {24'd0, Mem46[Addr[5:0]]};
        MemRead47   <= {24'd0, Mem47[Addr[5:0]]};
        MemRead48   <= {24'd0, Mem48[Addr[5:0]]};
        MemRead49   <= {24'd0, Mem49[Addr[5:0]]};
        MemRead50   <= {24'd0, Mem50[Addr[5:0]]};
        MemRead51   <= {24'd0, Mem51[Addr[5:0]]};
        MemRead52   <= {24'd0, Mem52[Addr[5:0]]};
        MemRead53   <= {24'd0, Mem53[Addr[5:0]]};
        MemRead54   <= {24'd0, Mem54[Addr[5:0]]};
        MemRead55   <= {24'd0, Mem55[Addr[5:0]]};
        MemRead56   <= {24'd0, Mem56[Addr[5:0]]};
        MemRead57   <= {24'd0, Mem57[Addr[5:0]]};
        MemRead58   <= {24'd0, Mem58[Addr[5:0]]};
        MemRead59   <= {24'd0, Mem59[Addr[5:0]]};
        MemRead60   <= {24'd0, Mem60[Addr[5:0]]};
        MemRead61   <= {24'd0, Mem61[Addr[5:0]]};
        MemRead62   <= {24'd0, Mem62[Addr[5:0]]};
        MemRead63   <= {24'd0, Mem63[Addr[5:0]]};
        WindowRead  <= {24'd0, Window[Addr[5:0]]};
        StackRead   <= Stack[Addr[5:0]];
        if(MemWrite) begin
            Stack[Addr[5:0]] <= WData;
        end
        AddrOut <= Addr; 
    end


    
endmodule   