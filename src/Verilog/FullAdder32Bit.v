module FullAdder32Bit (
    input [31:0] inA,
    input [31:0] inB,
    output [31:0] res,
    input carryIn,
    input clk
);
    wire [0:0] propogate        [15:0];
    wire [0:0] carry            [15:0];
    wire [1:0] resSlices        [15:0];

    wire [0:0] carryUnits1      [15:0];
    wire [0:0] propogateUnits1  [5:0];

    wire [0:0] carryUnits2      [15:0];
    wire [0:0] propogateUnits2  [5:0];

    wire [0:0] carryUnits3      [15:0];
    wire [0:0] propogateUnits3  [5:0];

    // The first adder receives carryIn, subsequent adders use carry-in as 0
    FullAdder2Bit adder0 (inA[1:0], inB[1:0], carryIn, resSlices[0], carry[0], propogate[0], clk);
    FullAdder2Bit adder1 (inA[3:2], inB[3:2], 1'b0, resSlices[1], carry[1], propogate[1], clk);
    FullAdder2Bit adder2 (inA[5:4], inB[5:4], 1'b0, resSlices[2], carry[2], propogate[2], clk);
    FullAdder2Bit adder3 (inA[7:6], inB[7:6], 1'b0, resSlices[3], carry[3], propogate[3], clk);
    FullAdder2Bit adder4 (inA[9:8], inB[9:8], 1'b0, resSlices[4], carry[4], propogate[4], clk);
    FullAdder2Bit adder5 (inA[11:10], inB[11:10], 1'b0, resSlices[5], carry[5], propogate[5], clk);
    FullAdder2Bit adder6 (inA[13:12], inB[13:12], 1'b0, resSlices[6], carry[6], propogate[6], clk);
    FullAdder2Bit adder7 (inA[15:14], inB[15:14], 1'b0, resSlices[7], carry[7], propogate[7], clk);
    FullAdder2Bit adder8 (inA[17:16], inB[17:16], 1'b0, resSlices[8], carry[8], propogate[8], clk);
    FullAdder2Bit adder9 (inA[19:18], inB[19:18], 1'b0, resSlices[9], carry[9], propogate[9], clk);
    FullAdder2Bit adder10 (inA[21:20], inB[21:20], 1'b0, resSlices[10], carry[10], propogate[10], clk);
    FullAdder2Bit adder11 (inA[23:22], inB[23:22], 1'b0, resSlices[11], carry[11], propogate[11], clk);
    FullAdder2Bit adder12 (inA[25:24], inB[25:24], 1'b0, resSlices[12], carry[12], propogate[12], clk);
    FullAdder2Bit adder13 (inA[27:26], inB[27:26], 1'b0, resSlices[13], carry[13], propogate[13], clk);
    FullAdder2Bit adder14 (inA[29:28], inB[29:28], 1'b0, resSlices[14], carry[14], propogate[14], clk);
    FullAdder2Bit adder15 (inA[31:30], inB[31:30], 1'b0, resSlices[15], carry[15], propogate[15], clk);
    
    
        // 1st 3-bit slice (adders 0 to 2)
    CarryLookAheadUnit3Slice CLA1_0(
        .carry0In(carryIn),             // Initial carry input
        .carry1In(carry[0]),
        .carry2In(carry[1]),
        .propogate0(propogate[0]),
        .propogate1(propogate[1]),
        .propogate2(propogate[2]),
        .carry0Out(carryUnits1[0]),
        .carry1Out(carryUnits1[1]),
        .carry2Out(carryUnits1[2]),
        .propogateOut(propogateUnits1[0]),
        .clk(clk)
    );

    // 2nd 3-bit slice (bits 3 to 5)
    CarryLookAheadUnit3Slice CLA1_1(
        .carry0In(carry[2]),
        .carry1In(carry[3]),
        .carry2In(carry[4]),
        .propogate0(propogate[3]),
        .propogate1(propogate[4]),
        .propogate2(propogate[5]),
        .carry0Out(carryUnits1[3]),
        .carry1Out(carryUnits1[4]),
        .carry2Out(carryUnits1[5]),
        .propogateOut(propogateUnits1[1]),
        .clk(clk)
    );

    // 3rd 3-bit slice (adders 6 to 8)
    CarryLookAheadUnit3Slice CLA1_2(
        .carry0In(carry[5]),
        .carry1In(carry[6]),
        .carry2In(carry[7]),
        .propogate0(propogate[6]),
        .propogate1(propogate[7]),
        .propogate2(propogate[8]),
        .carry0Out(carryUnits1[6]),
        .carry1Out(carryUnits1[7]),
        .carry2Out(carryUnits1[8]),
        .propogateOut(propogateUnits1[2]),
        .clk(clk)
    );

    // 4th 3-bit slice (adders 9 to 11)
    CarryLookAheadUnit3Slice CLA1_3(
        .carry0In(carry[8]),
        .carry1In(carry[9]),
        .carry2In(carry[10]),
        .propogate0(propogate[9]),
        .propogate1(propogate[10]),
        .propogate2(propogate[11]),
        .carry0Out(carryUnits1[9]),
        .carry1Out(carryUnits1[10]),
        .carry2Out(carryUnits1[11]),
        .propogateOut(propogateUnits1[3]),
        .clk(clk)
    );

    // 5th 3-bit slice (adders 12 to 14)
    CarryLookAheadUnit3Slice CLA1_4(
        .carry0In(carry[11]),
        .carry1In(carry[12]),
        .carry2In(carry[13]),
        .propogate0(propogate[12]),
        .propogate1(propogate[13]),
        .propogate2(propogate[14]),
        .carry0Out(carryUnits1[12]),
        .carry1Out(carryUnits1[13]),
        .carry2Out(carryUnits1[14]),
        .propogateOut(propogateUnits1[4]),
        .clk(clk)
    );

    // 6th 1-bit slice (adder 15) to complete the 16-adder logic
    CarryLookAheadUnit3Slice CLA1_5(
        .carry0In(carry[14]),           // Only one bit left, so we handle it separately
        .carry1In(carry[15]),           // Using last carry bits for this slice
        .carry2In(1'b0),                // No further carry input, set to 0
        .propogate0(propogate[15]),     // Final propagate input
        .propogate1(1'b1),              // Unused but necessary for module; set to 1
        .propogate2(1'b1),              // Unused but necessary for module; set to 1
        .carry0Out(carryUnits1[15]),    // Final carry output for the 16-bit addition
        .carry1Out(),                   // Not needed, left unconnected
        .carry2Out(),                   // Not needed, left unconnected
        .propogateOut(propogateUnits1[5]),
        .clk(clk)
    );
    
    // Calculates Carries to go back up with (will go back through the CLA's)
    CarryLookAheadUnit3Slice CLA2_0(
        .carry0In(carry[2] | carryUnits1[2]),           // Only one bit left, so we handle it separately
        .carry1In(carry[5] | carryUnits1[5]),           // Using last carry bits for this slice
        .carry2In(carryUnits1[8]),                // No further carry input, set to 0
        .propogate0(propogateUnits1[0]),     // Final propagate input
        .propogate1(propogateUnits1[1]),              // Unused but necessary for module; set to 1
        .propogate2(propogateUnits1[2]),              // Unused but necessary for module; set to 1
        .carry0Out(carryUnits2[0]),    // Final carry output for the 16-bit addition
        .carry1Out(carryUnits2[1]),                   // Not needed, left unconnected
        .carry2Out(carryUnits2[2]),                   // Not needed, left unconnected
        .propogateOut(propogateUnits2[0]),
        .clk(clk)
    );
    reg CLASlice2Carry;
    always @(posedge clk) begin
        CLASlice2Carry <= carryUnits2[2];  
    end
    CarryLookAheadUnit3Slice CLA2_1(
        .carry0In(CLASlice2Carry | carry[5]),           // Only one bit left, so we handle it separately
        .carry1In(carryUnits1[14]),           // Using last carry bits for this slice
        .carry2In(1'b0),                // No further carry input, set to 0
        .propogate0(propogateUnits1[3]),     // Final propagate input
        .propogate1(propogateUnits1[4]),              // Unused but necessary for module; set to 1
        .propogate2(1'b0),              // Unused but necessary for module; set to 1
        .carry0Out(carryUnits2[3]),    // Final carry output for the 16-bit addition
        .carry1Out(carryUnits2[4]),                   // Not needed, left unconnected
        .carry2Out(),                   // Not needed, left unconnected
        .propogateOut(),
        .clk(clk)
    );
    // Upwards Propogation
    CarryLookAheadUnit3Slice CLA3_0(
        .carry0In(carryIn),             // Initial carry input
        .carry1In(carry[0]),
        .carry2In(carry[1]),
        .propogate0(propogate[0]),
        .propogate1(propogate[1]),
        .propogate2(propogate[2]),
        .carry0Out(carryUnits3[0]),
        .carry1Out(carryUnits3[1]),
        .carry2Out(carryUnits3[2]),
        .propogateOut(),
        .clk(clk)
    );
    CarryLookAheadUnit3Slice CLA3_1(
        .carry0In(carryUnits2[0]),             // Initial carry input
        .carry1In(carry[3]),
        .carry2In(carry[4]),
        .propogate0(propogate[3]),
        .propogate1(propogate[4]),
        .propogate2(propogate[5]),
        .carry0Out(carryUnits3[3]),
        .carry1Out(carryUnits3[4]),
        .carry2Out(carryUnits3[5]),
        .propogateOut(),
        .clk(clk)
    );
    CarryLookAheadUnit3Slice CLA3_2(
        .carry0In(carryUnits2[1]),             // Initial carry input
        .carry1In(carry[6]),
        .carry2In(carry[7]),
        .propogate0(propogate[6]),
        .propogate1(propogate[7]),
        .propogate2(propogate[8]),
        .carry0Out(carryUnits3[6]),
        .carry1Out(carryUnits3[7]),
        .carry2Out(carryUnits3[8]),
        .propogateOut(),
        .clk(clk)
    );
    CarryLookAheadUnit3Slice CLA3_3(
        .carry0In(carryUnits2[2]),             // Initial carry input
        .carry1In(carry[9]),
        .carry2In(carry[10]),
        .propogate0(propogate[9]),
        .propogate1(propogate[10]),
        .propogate2(propogate[11]),
        .carry0Out(carryUnits3[9]),
        .carry1Out(carryUnits3[10]),
        .carry2Out(carryUnits3[11]),
        .propogateOut(),
        .clk(clk)
    );
    CarryLookAheadUnit3Slice CLA3_4(
        .carry0In(carryUnits2[3]),             // Initial carry input
        .carry1In(carry[12]),
        .carry2In(carry[13]),
        .propogate0(propogate[12]),
        .propogate1(propogate[13]),
        .propogate2(propogate[14]),
        .carry0Out(carryUnits3[12]),
        .carry1Out(carryUnits3[13]),
        .carry2Out(carryUnits3[14]),
        .propogateOut(),
        .clk(clk)
    );
    CarryLookAheadUnit3Slice CLA3_5(
        .carry0In(carryUnits2[4]),             // Initial carry input
        .carry1In(carry[14]),
        .carry2In(1'b0),
        .propogate0(propogate[15]),
        .propogate1(1'b0),
        .propogate2(1'b0),
        .carry0Out(carryUnits3[15]),
        .carry1Out(),
        .carry2Out(),
        .propogateOut(),
        .clk(clk)
    );
    


    
     
    FullAdder2Bit adder1_0 (inA[1:0], inB[1:0], carryIn, res[1:0], , , clk);
    FullAdder2Bit adder1_1 (inA[3:2], inB[3:2], carryUnits3[1], res[3:2], , , clk);
    FullAdder2Bit adder1_2 (inA[5:4], inB[5:4], carryUnits3[2], res[5:4], , , clk);
    FullAdder2Bit adder1_3 (inA[7:6], inB[7:6], carryUnits3[3], res[7:6], , , clk);
    FullAdder2Bit adder1_4 (inA[9:8], inB[9:8], carryUnits3[4], res[9:8], , , clk);
    FullAdder2Bit adder1_5 (inA[11:10], inB[11:10], carryUnits3[5], res[11:10], , , clk);
    FullAdder2Bit adder1_6 (inA[13:12], inB[13:12], carryUnits3[6], res[13:12], , , clk);
    FullAdder2Bit adder1_7 (inA[15:14], inB[15:14], carryUnits3[7], res[15:14], , , clk);
    FullAdder2Bit adder1_8 (inA[17:16], inB[17:16], carryUnits3[8], res[17:16], , , clk);
    FullAdder2Bit adder1_9 (inA[19:18], inB[19:18], carryUnits3[9], res[19:18], , , clk);
    FullAdder2Bit adder1_10 (inA[21:20], inB[21:20], carryUnits3[10], res[21:20], , , clk);
    FullAdder2Bit adder1_11 (inA[23:22], inB[23:22], carryUnits3[11], res[23:22], , , clk);
    FullAdder2Bit adder1_12 (inA[25:24], inB[25:24], carryUnits3[12], res[25:24], , , clk);
    FullAdder2Bit adder1_13 (inA[27:26], inB[27:26], carryUnits3[13], res[27:26], , , clk);
    FullAdder2Bit adder1_14 (inA[29:28], inB[29:28], carryUnits3[14], res[29:28], , , clk);
    FullAdder2Bit adder1_15 (inA[31:30], inB[31:30], carryUnits3[15], res[31:30], , , clk);

    
endmodule