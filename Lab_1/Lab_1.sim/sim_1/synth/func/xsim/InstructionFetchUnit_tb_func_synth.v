// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Sep  1 18:14:40 2024
// Host        : zeroDay running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/ryfon/Documents/Code/ECE369/Lab_1/Lab_1.sim/sim_1/synth/func/xsim/InstructionFetchUnit_tb_func_synth.v
// Design      : InstructionFetchUnit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module InstructionFetchUnit
   (Reset,
    Clk,
    Instruction,
    PCResult);
  input Reset;
  input Clk;
  output [31:0]Instruction;
  output [31:0]PCResult;

  wire Clk;
  wire Clk_IBUF;
  wire Clk_IBUF_BUFG;
  wire [31:0]Instruction;
  wire [12:0]Instruction_OBUF;
  wire [31:0]PCResult;
  wire [31:2]PCResult_OBUF;
  wire Reset;
  wire Reset_IBUF;
  wire pc0_n_0;
  wire pc0_n_1;
  wire pc0_n_2;
  wire pc0_n_3;
  wire pc0_n_4;
  wire pc0_n_5;
  wire pc0_n_6;
  wire pc0_n_7;
  wire pc0_n_8;
  wire pc0_n_9;
  wire [15:13]\NLW_Instruction_OBUF[31]_inst_i_1_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_Instruction_OBUF[31]_inst_i_1_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_Instruction_OBUF[31]_inst_i_1_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_Instruction_OBUF[31]_inst_i_1_DOPBDOP_UNCONNECTED ;

  BUFG Clk_IBUF_BUFG_inst
       (.I(Clk_IBUF),
        .O(Clk_IBUF_BUFG));
  IBUF Clk_IBUF_inst
       (.I(Clk),
        .O(Clk_IBUF));
  OBUF \Instruction_OBUF[0]_inst 
       (.I(Instruction_OBUF[0]),
        .O(Instruction[0]));
  OBUF \Instruction_OBUF[10]_inst 
       (.I(Instruction_OBUF[10]),
        .O(Instruction[10]));
  OBUF \Instruction_OBUF[11]_inst 
       (.I(Instruction_OBUF[11]),
        .O(Instruction[11]));
  OBUF \Instruction_OBUF[12]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[12]));
  OBUF \Instruction_OBUF[13]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[13]));
  OBUF \Instruction_OBUF[14]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[14]));
  OBUF \Instruction_OBUF[15]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[15]));
  OBUF \Instruction_OBUF[16]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[16]));
  OBUF \Instruction_OBUF[17]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[17]));
  OBUF \Instruction_OBUF[18]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[18]));
  OBUF \Instruction_OBUF[19]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[19]));
  OBUF \Instruction_OBUF[1]_inst 
       (.I(Instruction_OBUF[1]),
        .O(Instruction[1]));
  OBUF \Instruction_OBUF[20]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[20]));
  OBUF \Instruction_OBUF[21]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[21]));
  OBUF \Instruction_OBUF[22]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[22]));
  OBUF \Instruction_OBUF[23]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[23]));
  OBUF \Instruction_OBUF[24]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[24]));
  OBUF \Instruction_OBUF[25]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[25]));
  OBUF \Instruction_OBUF[26]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[26]));
  OBUF \Instruction_OBUF[27]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[27]));
  OBUF \Instruction_OBUF[28]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[28]));
  OBUF \Instruction_OBUF[29]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[29]));
  OBUF \Instruction_OBUF[2]_inst 
       (.I(Instruction_OBUF[2]),
        .O(Instruction[2]));
  OBUF \Instruction_OBUF[30]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[30]));
  OBUF \Instruction_OBUF[31]_inst 
       (.I(Instruction_OBUF[12]),
        .O(Instruction[31]));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d13" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "13312" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "12" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h002D002A002700240021001E001B001800150012000F000C0009000600030000),
    .INIT_01(256'h005D005A005700540051004E004B004800450042003F003C0039003600330030),
    .INIT_02(256'h008D008A008700840081007E007B007800750072006F006C0069006600630060),
    .INIT_03(256'h00BD00BA00B700B400B100AE00AB00A800A500A2009F009C0099009600930090),
    .INIT_04(256'h00ED00EA00E700E400E100DE00DB00D800D500D200CF00CC00C900C600C300C0),
    .INIT_05(256'h011D011A011701140111010E010B01080105010200FF00FC00F900F600F300F0),
    .INIT_06(256'h014D014A014701440141013E013B013801350132012F012C0129012601230120),
    .INIT_07(256'h017D017A017701740171016E016B016801650162015F015C0159015601530150),
    .INIT_08(256'h01AD01AA01A701A401A1019E019B019801950192018F018C0189018601830180),
    .INIT_09(256'h01DD01DA01D701D401D101CE01CB01C801C501C201BF01BC01B901B601B301B0),
    .INIT_0A(256'h020D020A02070204020101FE01FB01F801F501F201EF01EC01E901E601E301E0),
    .INIT_0B(256'h023D023A023702340231022E022B022802250222021F021C0219021602130210),
    .INIT_0C(256'h026D026A026702640261025E025B025802550252024F024C0249024602430240),
    .INIT_0D(256'h029D029A029702940291028E028B028802850282027F027C0279027602730270),
    .INIT_0E(256'h02CD02CA02C702C402C102BE02BB02B802B502B202AF02AC02A902A602A302A0),
    .INIT_0F(256'h02FD02FA02F702F402F102EE02EB02E802E502E202DF02DC02D902D602D302D0),
    .INIT_10(256'h032D032A032703240321031E031B031803150312030F030C0309030603030300),
    .INIT_11(256'h035D035A035703540351034E034B034803450342033F033C0339033603330330),
    .INIT_12(256'h038D038A038703840381037E037B037803750372036F036C0369036603630360),
    .INIT_13(256'h03BD03BA03B703B403B103AE03AB03A803A503A2039F039C0399039603930390),
    .INIT_14(256'h03ED03EA03E703E403E103DE03DB03D803D503D203CF03CC03C903C603C303C0),
    .INIT_15(256'h041D041A041704140411040E040B04080405040203FF03FC03F903F603F303F0),
    .INIT_16(256'h044D044A044704440441043E043B043804350432042F042C0429042604230420),
    .INIT_17(256'h047D047A047704740471046E046B046804650462045F045C0459045604530450),
    .INIT_18(256'h04AD04AA04A704A404A1049E049B049804950492048F048C0489048604830480),
    .INIT_19(256'h04DD04DA04D704D404D104CE04CB04C804C504C204BF04BC04B904B604B304B0),
    .INIT_1A(256'h050D050A05070504050104FE04FB04F804F504F204EF04EC04E904E604E304E0),
    .INIT_1B(256'h053D053A053705340531052E052B052805250522051F051C0519051605130510),
    .INIT_1C(256'h056D056A056705640561055E055B055805550552054F054C0549054605430540),
    .INIT_1D(256'h059D059A059705940591058E058B058805850582057F057C0579057605730570),
    .INIT_1E(256'h05CD05CA05C705C405C105BE05BB05B805B505B205AF05AC05A905A605A305A0),
    .INIT_1F(256'h05FD05FA05F705F405F105EE05EB05E805E505E205DF05DC05D905D605D305D0),
    .INIT_20(256'h062D062A062706240621061E061B061806150612060F060C0609060606030600),
    .INIT_21(256'h065D065A065706540651064E064B064806450642063F063C0639063606330630),
    .INIT_22(256'h068D068A068706840681067E067B067806750672066F066C0669066606630660),
    .INIT_23(256'h06BD06BA06B706B406B106AE06AB06A806A506A2069F069C0699069606930690),
    .INIT_24(256'h06ED06EA06E706E406E106DE06DB06D806D506D206CF06CC06C906C606C306C0),
    .INIT_25(256'h071D071A071707140711070E070B07080705070206FF06FC06F906F606F306F0),
    .INIT_26(256'h074D074A074707440741073E073B073807350732072F072C0729072607230720),
    .INIT_27(256'h077D077A077707740771076E076B076807650762075F075C0759075607530750),
    .INIT_28(256'h07AD07AA07A707A407A1079E079B079807950792078F078C0789078607830780),
    .INIT_29(256'h07DD07DA07D707D407D107CE07CB07C807C507C207BF07BC07B907B607B307B0),
    .INIT_2A(256'h080D080A08070804080107FE07FB07F807F507F207EF07EC07E907E607E307E0),
    .INIT_2B(256'h083D083A083708340831082E082B082808250822081F081C0819081608130810),
    .INIT_2C(256'h086D086A086708640861085E085B085808550852084F084C0849084608430840),
    .INIT_2D(256'h089D089A089708940891088E088B088808850882087F087C0879087608730870),
    .INIT_2E(256'h08CD08CA08C708C408C108BE08BB08B808B508B208AF08AC08A908A608A308A0),
    .INIT_2F(256'h08FD08FA08F708F408F108EE08EB08E808E508E208DF08DC08D908D608D308D0),
    .INIT_30(256'h092D092A092709240921091E091B091809150912090F090C0909090609030900),
    .INIT_31(256'h095D095A095709540951094E094B094809450942093F093C0939093609330930),
    .INIT_32(256'h098D098A098709840981097E097B097809750972096F096C0969096609630960),
    .INIT_33(256'h09BD09BA09B709B409B109AE09AB09A809A509A2099F099C0999099609930990),
    .INIT_34(256'h09ED09EA09E709E409E109DE09DB09D809D509D209CF09CC09C909C609C309C0),
    .INIT_35(256'h0A1D0A1A0A170A140A110A0E0A0B0A080A050A0209FF09FC09F909F609F309F0),
    .INIT_36(256'h0A4D0A4A0A470A440A410A3E0A3B0A380A350A320A2F0A2C0A290A260A230A20),
    .INIT_37(256'h0A7D0A7A0A770A740A710A6E0A6B0A680A650A620A5F0A5C0A590A560A530A50),
    .INIT_38(256'h0AAD0AAA0AA70AA40AA10A9E0A9B0A980A950A920A8F0A8C0A890A860A830A80),
    .INIT_39(256'h0ADD0ADA0AD70AD40AD10ACE0ACB0AC80AC50AC20ABF0ABC0AB90AB60AB30AB0),
    .INIT_3A(256'h0B0D0B0A0B070B040B010AFE0AFB0AF80AF50AF20AEF0AEC0AE90AE60AE30AE0),
    .INIT_3B(256'h0B3D0B3A0B370B340B310B2E0B2B0B280B250B220B1F0B1C0B190B160B130B10),
    .INIT_3C(256'h0B6D0B6A0B670B640B610B5E0B5B0B580B550B520B4F0B4C0B490B460B430B40),
    .INIT_3D(256'h0B9D0B9A0B970B940B910B8E0B8B0B880B850B820B7F0B7C0B790B760B730B70),
    .INIT_3E(256'h0BCD0BCA0BC70BC40BC10BBE0BBB0BB80BB50BB20BAF0BAC0BA90BA60BA30BA0),
    .INIT_3F(256'h0BFD0BFA0BF70BF40BF10BEE0BEB0BE80BE50BE20BDF0BDC0BD90BD60BD30BD0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    \Instruction_OBUF[31]_inst_i_1 
       (.ADDRARDADDR({pc0_n_0,pc0_n_1,pc0_n_2,pc0_n_3,pc0_n_4,pc0_n_5,pc0_n_6,pc0_n_7,pc0_n_8,pc0_n_9,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(Clk_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({\NLW_Instruction_OBUF[31]_inst_i_1_DOADO_UNCONNECTED [15:13],Instruction_OBUF}),
        .DOBDO(\NLW_Instruction_OBUF[31]_inst_i_1_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_Instruction_OBUF[31]_inst_i_1_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_Instruction_OBUF[31]_inst_i_1_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  OBUF \Instruction_OBUF[3]_inst 
       (.I(Instruction_OBUF[3]),
        .O(Instruction[3]));
  OBUF \Instruction_OBUF[4]_inst 
       (.I(Instruction_OBUF[4]),
        .O(Instruction[4]));
  OBUF \Instruction_OBUF[5]_inst 
       (.I(Instruction_OBUF[5]),
        .O(Instruction[5]));
  OBUF \Instruction_OBUF[6]_inst 
       (.I(Instruction_OBUF[6]),
        .O(Instruction[6]));
  OBUF \Instruction_OBUF[7]_inst 
       (.I(Instruction_OBUF[7]),
        .O(Instruction[7]));
  OBUF \Instruction_OBUF[8]_inst 
       (.I(Instruction_OBUF[8]),
        .O(Instruction[8]));
  OBUF \Instruction_OBUF[9]_inst 
       (.I(Instruction_OBUF[9]),
        .O(Instruction[9]));
  OBUF \PCResult_OBUF[0]_inst 
       (.I(1'b0),
        .O(PCResult[0]));
  OBUF \PCResult_OBUF[10]_inst 
       (.I(PCResult_OBUF[10]),
        .O(PCResult[10]));
  OBUF \PCResult_OBUF[11]_inst 
       (.I(PCResult_OBUF[11]),
        .O(PCResult[11]));
  OBUF \PCResult_OBUF[12]_inst 
       (.I(PCResult_OBUF[12]),
        .O(PCResult[12]));
  OBUF \PCResult_OBUF[13]_inst 
       (.I(PCResult_OBUF[13]),
        .O(PCResult[13]));
  OBUF \PCResult_OBUF[14]_inst 
       (.I(PCResult_OBUF[14]),
        .O(PCResult[14]));
  OBUF \PCResult_OBUF[15]_inst 
       (.I(PCResult_OBUF[15]),
        .O(PCResult[15]));
  OBUF \PCResult_OBUF[16]_inst 
       (.I(PCResult_OBUF[16]),
        .O(PCResult[16]));
  OBUF \PCResult_OBUF[17]_inst 
       (.I(PCResult_OBUF[17]),
        .O(PCResult[17]));
  OBUF \PCResult_OBUF[18]_inst 
       (.I(PCResult_OBUF[18]),
        .O(PCResult[18]));
  OBUF \PCResult_OBUF[19]_inst 
       (.I(PCResult_OBUF[19]),
        .O(PCResult[19]));
  OBUF \PCResult_OBUF[1]_inst 
       (.I(1'b0),
        .O(PCResult[1]));
  OBUF \PCResult_OBUF[20]_inst 
       (.I(PCResult_OBUF[20]),
        .O(PCResult[20]));
  OBUF \PCResult_OBUF[21]_inst 
       (.I(PCResult_OBUF[21]),
        .O(PCResult[21]));
  OBUF \PCResult_OBUF[22]_inst 
       (.I(PCResult_OBUF[22]),
        .O(PCResult[22]));
  OBUF \PCResult_OBUF[23]_inst 
       (.I(PCResult_OBUF[23]),
        .O(PCResult[23]));
  OBUF \PCResult_OBUF[24]_inst 
       (.I(PCResult_OBUF[24]),
        .O(PCResult[24]));
  OBUF \PCResult_OBUF[25]_inst 
       (.I(PCResult_OBUF[25]),
        .O(PCResult[25]));
  OBUF \PCResult_OBUF[26]_inst 
       (.I(PCResult_OBUF[26]),
        .O(PCResult[26]));
  OBUF \PCResult_OBUF[27]_inst 
       (.I(PCResult_OBUF[27]),
        .O(PCResult[27]));
  OBUF \PCResult_OBUF[28]_inst 
       (.I(PCResult_OBUF[28]),
        .O(PCResult[28]));
  OBUF \PCResult_OBUF[29]_inst 
       (.I(PCResult_OBUF[29]),
        .O(PCResult[29]));
  OBUF \PCResult_OBUF[2]_inst 
       (.I(PCResult_OBUF[2]),
        .O(PCResult[2]));
  OBUF \PCResult_OBUF[30]_inst 
       (.I(PCResult_OBUF[30]),
        .O(PCResult[30]));
  OBUF \PCResult_OBUF[31]_inst 
       (.I(PCResult_OBUF[31]),
        .O(PCResult[31]));
  OBUF \PCResult_OBUF[3]_inst 
       (.I(PCResult_OBUF[3]),
        .O(PCResult[3]));
  OBUF \PCResult_OBUF[4]_inst 
       (.I(PCResult_OBUF[4]),
        .O(PCResult[4]));
  OBUF \PCResult_OBUF[5]_inst 
       (.I(PCResult_OBUF[5]),
        .O(PCResult[5]));
  OBUF \PCResult_OBUF[6]_inst 
       (.I(PCResult_OBUF[6]),
        .O(PCResult[6]));
  OBUF \PCResult_OBUF[7]_inst 
       (.I(PCResult_OBUF[7]),
        .O(PCResult[7]));
  OBUF \PCResult_OBUF[8]_inst 
       (.I(PCResult_OBUF[8]),
        .O(PCResult[8]));
  OBUF \PCResult_OBUF[9]_inst 
       (.I(PCResult_OBUF[9]),
        .O(PCResult[9]));
  IBUF Reset_IBUF_inst
       (.I(Reset),
        .O(Reset_IBUF));
  ProgramCounter pc0
       (.ADDRARDADDR({pc0_n_0,pc0_n_1,pc0_n_2,pc0_n_3,pc0_n_4,pc0_n_5,pc0_n_6,pc0_n_7,pc0_n_8,pc0_n_9}),
        .Clk(Clk_IBUF_BUFG),
        .PCResult(PCResult_OBUF),
        .Reset_IBUF(Reset_IBUF));
endmodule

module ProgramCounter
   (ADDRARDADDR,
    PCResult,
    Reset_IBUF,
    Clk);
  output [9:0]ADDRARDADDR;
  output [29:0]PCResult;
  input Reset_IBUF;
  input Clk;

  wire [9:0]ADDRARDADDR;
  wire [11:2]Address;
  wire Clk;
  wire \Instruction_OBUF[31]_inst_i_12_n_2 ;
  wire \Instruction_OBUF[31]_inst_i_12_n_3 ;
  wire \Instruction_OBUF[31]_inst_i_13_n_0 ;
  wire \Instruction_OBUF[31]_inst_i_13_n_1 ;
  wire \Instruction_OBUF[31]_inst_i_13_n_2 ;
  wire \Instruction_OBUF[31]_inst_i_13_n_3 ;
  wire \Instruction_OBUF[31]_inst_i_14_n_0 ;
  wire \Instruction_OBUF[31]_inst_i_14_n_1 ;
  wire \Instruction_OBUF[31]_inst_i_14_n_2 ;
  wire \Instruction_OBUF[31]_inst_i_14_n_3 ;
  wire \Instruction_OBUF[31]_inst_i_15_n_0 ;
  wire [29:0]PCResult;
  wire \PCResult[2]_i_2_n_0 ;
  wire \PCResult_reg[10]_i_1_n_0 ;
  wire \PCResult_reg[10]_i_1_n_1 ;
  wire \PCResult_reg[10]_i_1_n_2 ;
  wire \PCResult_reg[10]_i_1_n_3 ;
  wire \PCResult_reg[10]_i_1_n_4 ;
  wire \PCResult_reg[10]_i_1_n_5 ;
  wire \PCResult_reg[10]_i_1_n_6 ;
  wire \PCResult_reg[10]_i_1_n_7 ;
  wire \PCResult_reg[14]_i_1_n_0 ;
  wire \PCResult_reg[14]_i_1_n_1 ;
  wire \PCResult_reg[14]_i_1_n_2 ;
  wire \PCResult_reg[14]_i_1_n_3 ;
  wire \PCResult_reg[14]_i_1_n_4 ;
  wire \PCResult_reg[14]_i_1_n_5 ;
  wire \PCResult_reg[14]_i_1_n_6 ;
  wire \PCResult_reg[14]_i_1_n_7 ;
  wire \PCResult_reg[18]_i_1_n_0 ;
  wire \PCResult_reg[18]_i_1_n_1 ;
  wire \PCResult_reg[18]_i_1_n_2 ;
  wire \PCResult_reg[18]_i_1_n_3 ;
  wire \PCResult_reg[18]_i_1_n_4 ;
  wire \PCResult_reg[18]_i_1_n_5 ;
  wire \PCResult_reg[18]_i_1_n_6 ;
  wire \PCResult_reg[18]_i_1_n_7 ;
  wire \PCResult_reg[22]_i_1_n_0 ;
  wire \PCResult_reg[22]_i_1_n_1 ;
  wire \PCResult_reg[22]_i_1_n_2 ;
  wire \PCResult_reg[22]_i_1_n_3 ;
  wire \PCResult_reg[22]_i_1_n_4 ;
  wire \PCResult_reg[22]_i_1_n_5 ;
  wire \PCResult_reg[22]_i_1_n_6 ;
  wire \PCResult_reg[22]_i_1_n_7 ;
  wire \PCResult_reg[26]_i_1_n_0 ;
  wire \PCResult_reg[26]_i_1_n_1 ;
  wire \PCResult_reg[26]_i_1_n_2 ;
  wire \PCResult_reg[26]_i_1_n_3 ;
  wire \PCResult_reg[26]_i_1_n_4 ;
  wire \PCResult_reg[26]_i_1_n_5 ;
  wire \PCResult_reg[26]_i_1_n_6 ;
  wire \PCResult_reg[26]_i_1_n_7 ;
  wire \PCResult_reg[2]_i_1_n_0 ;
  wire \PCResult_reg[2]_i_1_n_1 ;
  wire \PCResult_reg[2]_i_1_n_2 ;
  wire \PCResult_reg[2]_i_1_n_3 ;
  wire \PCResult_reg[2]_i_1_n_4 ;
  wire \PCResult_reg[2]_i_1_n_5 ;
  wire \PCResult_reg[2]_i_1_n_6 ;
  wire \PCResult_reg[2]_i_1_n_7 ;
  wire \PCResult_reg[30]_i_1_n_3 ;
  wire \PCResult_reg[30]_i_1_n_6 ;
  wire \PCResult_reg[30]_i_1_n_7 ;
  wire \PCResult_reg[6]_i_1_n_0 ;
  wire \PCResult_reg[6]_i_1_n_1 ;
  wire \PCResult_reg[6]_i_1_n_2 ;
  wire \PCResult_reg[6]_i_1_n_3 ;
  wire \PCResult_reg[6]_i_1_n_4 ;
  wire \PCResult_reg[6]_i_1_n_5 ;
  wire \PCResult_reg[6]_i_1_n_6 ;
  wire \PCResult_reg[6]_i_1_n_7 ;
  wire Reset_IBUF;
  wire [3:2]\NLW_Instruction_OBUF[31]_inst_i_12_CO_UNCONNECTED ;
  wire [3:3]\NLW_Instruction_OBUF[31]_inst_i_12_O_UNCONNECTED ;
  wire [0:0]\NLW_Instruction_OBUF[31]_inst_i_14_O_UNCONNECTED ;
  wire [3:1]\NLW_PCResult_reg[30]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_PCResult_reg[30]_i_1_O_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_10 
       (.I0(Address[3]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_11 
       (.I0(Address[2]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[0]));
  CARRY4 \Instruction_OBUF[31]_inst_i_12 
       (.CI(\Instruction_OBUF[31]_inst_i_13_n_0 ),
        .CO({\NLW_Instruction_OBUF[31]_inst_i_12_CO_UNCONNECTED [3:2],\Instruction_OBUF[31]_inst_i_12_n_2 ,\Instruction_OBUF[31]_inst_i_12_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_Instruction_OBUF[31]_inst_i_12_O_UNCONNECTED [3],Address[11:9]}),
        .S({1'b0,PCResult[9:7]}));
  CARRY4 \Instruction_OBUF[31]_inst_i_13 
       (.CI(\Instruction_OBUF[31]_inst_i_14_n_0 ),
        .CO({\Instruction_OBUF[31]_inst_i_13_n_0 ,\Instruction_OBUF[31]_inst_i_13_n_1 ,\Instruction_OBUF[31]_inst_i_13_n_2 ,\Instruction_OBUF[31]_inst_i_13_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(Address[8:5]),
        .S(PCResult[6:3]));
  CARRY4 \Instruction_OBUF[31]_inst_i_14 
       (.CI(1'b0),
        .CO({\Instruction_OBUF[31]_inst_i_14_n_0 ,\Instruction_OBUF[31]_inst_i_14_n_1 ,\Instruction_OBUF[31]_inst_i_14_n_2 ,\Instruction_OBUF[31]_inst_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,PCResult[0],1'b0}),
        .O({Address[4:2],\NLW_Instruction_OBUF[31]_inst_i_14_O_UNCONNECTED [0]}),
        .S({PCResult[2:1],\Instruction_OBUF[31]_inst_i_15_n_0 ,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    \Instruction_OBUF[31]_inst_i_15 
       (.I0(PCResult[0]),
        .O(\Instruction_OBUF[31]_inst_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_2 
       (.I0(Address[11]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_3 
       (.I0(Address[10]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[8]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_4 
       (.I0(Address[9]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_5 
       (.I0(Address[8]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_6 
       (.I0(Address[7]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_7 
       (.I0(Address[6]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[4]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_8 
       (.I0(Address[5]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \Instruction_OBUF[31]_inst_i_9 
       (.I0(Address[4]),
        .I1(Reset_IBUF),
        .O(ADDRARDADDR[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \PCResult[2]_i_2 
       (.I0(PCResult[0]),
        .O(\PCResult[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[10] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[10]_i_1_n_7 ),
        .Q(PCResult[8]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[10]_i_1 
       (.CI(\PCResult_reg[6]_i_1_n_0 ),
        .CO({\PCResult_reg[10]_i_1_n_0 ,\PCResult_reg[10]_i_1_n_1 ,\PCResult_reg[10]_i_1_n_2 ,\PCResult_reg[10]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\PCResult_reg[10]_i_1_n_4 ,\PCResult_reg[10]_i_1_n_5 ,\PCResult_reg[10]_i_1_n_6 ,\PCResult_reg[10]_i_1_n_7 }),
        .S(PCResult[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[11] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[10]_i_1_n_6 ),
        .Q(PCResult[9]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[12] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[10]_i_1_n_5 ),
        .Q(PCResult[10]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[13] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[10]_i_1_n_4 ),
        .Q(PCResult[11]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[14] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[14]_i_1_n_7 ),
        .Q(PCResult[12]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[14]_i_1 
       (.CI(\PCResult_reg[10]_i_1_n_0 ),
        .CO({\PCResult_reg[14]_i_1_n_0 ,\PCResult_reg[14]_i_1_n_1 ,\PCResult_reg[14]_i_1_n_2 ,\PCResult_reg[14]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\PCResult_reg[14]_i_1_n_4 ,\PCResult_reg[14]_i_1_n_5 ,\PCResult_reg[14]_i_1_n_6 ,\PCResult_reg[14]_i_1_n_7 }),
        .S(PCResult[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[15] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[14]_i_1_n_6 ),
        .Q(PCResult[13]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[16] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[14]_i_1_n_5 ),
        .Q(PCResult[14]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[17] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[14]_i_1_n_4 ),
        .Q(PCResult[15]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[18] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[18]_i_1_n_7 ),
        .Q(PCResult[16]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[18]_i_1 
       (.CI(\PCResult_reg[14]_i_1_n_0 ),
        .CO({\PCResult_reg[18]_i_1_n_0 ,\PCResult_reg[18]_i_1_n_1 ,\PCResult_reg[18]_i_1_n_2 ,\PCResult_reg[18]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\PCResult_reg[18]_i_1_n_4 ,\PCResult_reg[18]_i_1_n_5 ,\PCResult_reg[18]_i_1_n_6 ,\PCResult_reg[18]_i_1_n_7 }),
        .S(PCResult[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[19] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[18]_i_1_n_6 ),
        .Q(PCResult[17]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[20] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[18]_i_1_n_5 ),
        .Q(PCResult[18]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[21] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[18]_i_1_n_4 ),
        .Q(PCResult[19]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[22] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[22]_i_1_n_7 ),
        .Q(PCResult[20]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[22]_i_1 
       (.CI(\PCResult_reg[18]_i_1_n_0 ),
        .CO({\PCResult_reg[22]_i_1_n_0 ,\PCResult_reg[22]_i_1_n_1 ,\PCResult_reg[22]_i_1_n_2 ,\PCResult_reg[22]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\PCResult_reg[22]_i_1_n_4 ,\PCResult_reg[22]_i_1_n_5 ,\PCResult_reg[22]_i_1_n_6 ,\PCResult_reg[22]_i_1_n_7 }),
        .S(PCResult[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[23] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[22]_i_1_n_6 ),
        .Q(PCResult[21]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[24] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[22]_i_1_n_5 ),
        .Q(PCResult[22]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[25] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[22]_i_1_n_4 ),
        .Q(PCResult[23]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[26] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[26]_i_1_n_7 ),
        .Q(PCResult[24]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[26]_i_1 
       (.CI(\PCResult_reg[22]_i_1_n_0 ),
        .CO({\PCResult_reg[26]_i_1_n_0 ,\PCResult_reg[26]_i_1_n_1 ,\PCResult_reg[26]_i_1_n_2 ,\PCResult_reg[26]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\PCResult_reg[26]_i_1_n_4 ,\PCResult_reg[26]_i_1_n_5 ,\PCResult_reg[26]_i_1_n_6 ,\PCResult_reg[26]_i_1_n_7 }),
        .S(PCResult[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[27] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[26]_i_1_n_6 ),
        .Q(PCResult[25]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[28] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[26]_i_1_n_5 ),
        .Q(PCResult[26]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[29] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[26]_i_1_n_4 ),
        .Q(PCResult[27]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[2] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[2]_i_1_n_7 ),
        .Q(PCResult[0]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\PCResult_reg[2]_i_1_n_0 ,\PCResult_reg[2]_i_1_n_1 ,\PCResult_reg[2]_i_1_n_2 ,\PCResult_reg[2]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\PCResult_reg[2]_i_1_n_4 ,\PCResult_reg[2]_i_1_n_5 ,\PCResult_reg[2]_i_1_n_6 ,\PCResult_reg[2]_i_1_n_7 }),
        .S({PCResult[3:1],\PCResult[2]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[30] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[30]_i_1_n_7 ),
        .Q(PCResult[28]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[30]_i_1 
       (.CI(\PCResult_reg[26]_i_1_n_0 ),
        .CO({\NLW_PCResult_reg[30]_i_1_CO_UNCONNECTED [3:1],\PCResult_reg[30]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_PCResult_reg[30]_i_1_O_UNCONNECTED [3:2],\PCResult_reg[30]_i_1_n_6 ,\PCResult_reg[30]_i_1_n_7 }),
        .S({1'b0,1'b0,PCResult[29:28]}));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[31] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[30]_i_1_n_6 ),
        .Q(PCResult[29]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[3] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[2]_i_1_n_6 ),
        .Q(PCResult[1]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[4] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[2]_i_1_n_5 ),
        .Q(PCResult[2]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[5] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[2]_i_1_n_4 ),
        .Q(PCResult[3]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[6] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[6]_i_1_n_7 ),
        .Q(PCResult[4]),
        .R(Reset_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PCResult_reg[6]_i_1 
       (.CI(\PCResult_reg[2]_i_1_n_0 ),
        .CO({\PCResult_reg[6]_i_1_n_0 ,\PCResult_reg[6]_i_1_n_1 ,\PCResult_reg[6]_i_1_n_2 ,\PCResult_reg[6]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\PCResult_reg[6]_i_1_n_4 ,\PCResult_reg[6]_i_1_n_5 ,\PCResult_reg[6]_i_1_n_6 ,\PCResult_reg[6]_i_1_n_7 }),
        .S(PCResult[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[7] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[6]_i_1_n_6 ),
        .Q(PCResult[5]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[8] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[6]_i_1_n_5 ),
        .Q(PCResult[6]),
        .R(Reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PCResult_reg[9] 
       (.C(Clk),
        .CE(1'b1),
        .D(\PCResult_reg[6]_i_1_n_4 ),
        .Q(PCResult[7]),
        .R(Reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
