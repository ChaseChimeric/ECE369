`ifndef alucontrol
`define alucontrol
module ALUController (
    op,
    funct,
    opCode
);
    input [5:0] op;
    input [5:0] funct;
    output reg [2:0] opCode;

    localparam ADD = 3'd0;
    localparam SUB = 3'd1;
    localparam MUL = 3'd2;
    localparam OR  = 3'd3;
    localparam AND = 3'd4;
    localparam XOR = 3'd5;
    localparam SHR = 3'd6;
    localparam SHL = 3'd7;
    localparam X = 0;

    always @(*) begin

        // op = 0 for all r type functions
        case (op)
            6'b000000: begin
                case (funct)
                    6'b100000: opCode = ADD;    // ADD instruction, funct = 100000
                    6'b100010: opCode = SUB;    // SUB instruction, funct = 100010
                    6'b101010: opCode = SUB;    // SLT instruction, funct = 101010
                    6'b100100: opCode = AND;    // AND instruction, funct = 100100
                    6'b100101: opCode = OR;     // OR  instruction, funct = 100101
                    6'b100111: opCode = OR;     // NOR instruction, funct = 100111
                    6'b100110: opCode = XOR;    // XOR instruction, funct = 100110
                    6'b000000: opCode = SHL;    // SLL instruction, funct = 000000
                    6'b000010: opCode = SHR;    // SRL instruction, funct = 000010 
                    default:   opCode = XOR;    // Fatal Error, just do an AND if R type not supported, also used by JR
                endcase
            end 
            // MUL
            6'b011100: opCode <= MUL;
            
            // ORI
            6'b001101: opCode <= OR;

            // ADDI
            6'b001000: opCode <= ADD;

            // ANDI
            6'b001100: opCode <= AND;

            // XORI
            6'b001110: opCode <= XOR;

            // SLTI
            6'b001010: opCode <= SUB;

            // LW
            6'b100011: opCode <= ADD;

            // LH
            6'b100001: opCode <= ADD;

            // LB
            6'b100000: opCode <= ADD;

            // SW
            6'b101011: opCode <= ADD;

            // SH
            6'b101001: opCode <= ADD;

            // SB
            6'b101000: opCode <= ADD;

            // BGEZ & BLTZ
            6'b000001: opCode <= SUB;

            // BLEZ
            6'b000110: opCode <= SUB;

            // BNE
            6'b000101: opCode <= XOR;

            // BEQ
            6'b000100: opCode <= XOR;

            // For unused instructions, just use the shift left, J and JAL
            default: opCode <= SHL;
            
        endcase
    end


endmodule
`endif