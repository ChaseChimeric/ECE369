`ifndef _branchcont
`define _branchcont

module BranchController (
    input [31:0] DataIn20_15,
    input [31:0] DataIn25_21,
    input [31:0] Full32BitInstruction
    output [1:0] nextInstrControl,
    output [31:0] jumpAddress
);

    always @(*) begin
        case (Full32BitInstruction[31:26])
            // BEQ
            6'b000100: begin
                nextInstrControl <= {1'b0, (0 == DataIn25_21)};
                jumpAddress <= Full32BitInstruction[15:0];
            end

            // BNE
            6'b000101: begin
                nextInstrControl <= {1'b0, (0 != DataIn25_21)};
                jumpAddress <= Full32BitInstruction[15:0];
            end

            // BLTZ / BGEZ
            6'b000001: begin
                case (Full32BitInstruction[16])
                    1'b1: nextInstrControl <= {1'b0, ((DataIn25_21 > 0) || (DataIn25_21 == 0))};
                    1'b0: nextInstrControl <= {1'b0, ((DataIn25_21 < 0) || (DataIn25_21 == 0))};
                    default: nextInstrControl <= 0;
                endcase
                jumpAddress <= Full32BitInstruction[15:0];
            end
            
            // BGTZ
            6'b000111: begin
                nextInstrControl <= {1'b0, (DataIn25_21 > 0)};
                jumpAddress <= Full32BitInstruction[15:0];
            end

            // BLEZ
            6'b000110: begin
                nextInstrControl <= {1'b0, (DataIn25_21 < 0)};
                jumpAddress <= Full32BitInstruction[15:0];
            end

            // JAL
            6'b000011: begin
                nextInstrControl <= 2'b10;
                jumpAddress <= Full32BitInstruction[25:0];
            end

            // J
            6'b000010: begin
                nextInstrControl <= 2'b10;
                jumpAddress <= Full32BitInstruction[25:0];
            end

            // JR
            6'b000000: begin
                nextInstrControl <= (Full32BitInstruction[5:0] == 6'001000) ? 2'b11 : 2'b00;
                jumpAddress <= DataIn25_21;
            end
            
            // Set to normal operation which doesn't use JumpAddress
            // Use a random wire to prevent JA being set randomly
            default: begin
                nextInstrControl <= 2'b00;
                jumpAddress <= DataIn25_21;
            end
        endcase
    end


    
endmodule
`endif