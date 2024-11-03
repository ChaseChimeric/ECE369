module FullAdder2Bit 
(
    input [1:0] inA,
    input [1:0] inB,
    input carryIn,
    output reg [1:0] res,
    output reg carryOut,
    output reg propogate,
    input clk
);

reg [1:0] tempRes;
always @(posedge clk) begin
    // Define a 2-bit result register for the current adder slice
    case ({carryIn, inA[1:0], inB[1:0]})
        5'b00000: begin
            tempRes <= 2'b00;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b00001: begin
            tempRes <= 2'b01;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b00010: begin
            tempRes <= 2'b10;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b00011: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b00100: begin
            tempRes <= 2'b01;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b00101: begin
            tempRes <= 2'b10;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b00110: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b00111: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b01000: begin
            tempRes <= 2'b10;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b01001: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b01010: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 1;
        end
        5'b01011: begin
            tempRes <= 2'b01;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b01100: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b01101: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b01110: begin
            tempRes <= 2'b01;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b01111: begin
            tempRes <= 2'b10;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b10000: begin
            tempRes <= 2'b01;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b10001: begin
            tempRes <= 2'b10;
            carryOut <= 1'b0;
        end
        5'b10010: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b10011: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b10100: begin
            tempRes <= 2'b10;
            carryOut <= 1'b0;
            propogate <= 0;
        end
        5'b10101: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b10110: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b10111: begin
            tempRes <= 2'b01;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11000: begin
            tempRes <= 2'b11;
            carryOut <= 1'b0;
            propogate <= 1;
        end
        5'b11001: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11010: begin
            tempRes <= 2'b01;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11011: begin
            tempRes <= 2'b10;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11100: begin
            tempRes <= 2'b00;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11101: begin
            tempRes <= 2'b01;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11110: begin
            tempRes <= 2'b10;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        5'b11111: begin
            tempRes <= 2'b11;
            carryOut <= 1'b1;
            propogate <= 0;
        end
        default: begin
            tempRes <= 2'b00;
            carryOut <= 1'b0;
            propogate <= 0;
        end
    endcase

    // Update only the 2-bit slice of `res` corresponding to this adder instance
    res <= tempRes;

end

endmodule
