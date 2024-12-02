`ifndef _alucontroller
`define _alucontroller

module ALUController (
    op,
    funct,
    opCode
);
    input [5:0] op;
    input [5:0] funct;
    output reg [2:0] opCode;

    localparam ADD = 0;
    localparam SUB = 1;
    localparam SHL = 2;
    localparam SHR = 3;
    localparam SLT = 4;
    localparam XOR = 5;
    localparam AND = 6;
    localparam OR = 7;

    always @(*) begin

        // op = 0 for all r type functions
        case (op)
            6'b000000: begin
                case (funct)
                    6'b100000: opCode = ADD;    // ADD instruction, funct = 100000
                    6'b100010: opCode = SUB;    // SUB instruction, funct = 100010
                    6'b101010: opCode = SLT;    // SLT instruction, funct = 101010
                    6'b100100: opCode = AND;    // AND instruction, funct = 100100
                    6'b100101: opCode = OR;     // OR  instruction, funct = 100101
                    6'b100110: opCode = XOR;    // XOR instruction, funct = 100110
                    6'b000000: opCode = SHL;    // SLL instruction, funct = 000000
                    6'b000010: opCode = SHR;    // SRL instruction, funct = 000010 
                    default:   opCode = XOR;    // Fatal Error, just do an AND if R type not supported, also used by JR
                endcase
            end 
            
            // ORI
            6'b001101: opCode <= OR;

            // ADDI
            6'b001000: opCode <= ADD;

            // ANDI
            6'b001100: opCode <= AND;

            // XORI
            6'b001110: opCode <= XOR;

            // SLTI
            6'b001010: opCode <= SLT;

            // LW
            6'b100011: opCode <= ADD;

            // SW
            6'b101011: opCode <= ADD;

            // For unused instructions, just use the shift left, J and JAL
            default: opCode <= SHL;
            
        endcase
    end
endmodule
`endif