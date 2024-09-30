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

    always @(*) begin

        // op = 0 for all r type functions
        if (op == 0) begin
            case (funct)
                6'b100000: opCode = ADD;    // ADD instruction, funct = 100000
                6'b100010: opCode = SUB;    // SUB instruction, funct = 100010
                6'b100100: opCode = AND;    // AND instruction, funct = 100100
                6'b100101: opCode = OR;     // OR  instruction, funct = 100101
                6'b100111: opCode = OR;     // NOR instruction, funct = 100111
                6'b100110: opCode = XOR;    // XOR instruction, funct = 100110
                6'b000000: opCode = SHL;    // SLL instruction, funct = 000000
                6'b000010: opCode = SHR;    // SRL instruction, funct = 000010 
                default: 
            endcase
        end
    end


endmodule