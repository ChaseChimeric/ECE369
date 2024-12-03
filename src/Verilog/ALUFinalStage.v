module ALUFinalStage (
    input [31:0] AdderRes,
    input [31:0] XORRes,
    input [31:0] SHLRes,
    input [31:0] SHRRes,
    input [31:0] ANDRes,
    input [31:0] ORRes,
    input [2:0] opCode,
    output reg [31:0] res,
    input clk,
    input rst,
    output reg Zero
);

    localparam ADD = 0;
    localparam SUB = 1;
    localparam SHL = 2;
    localparam SHR = 3;
    localparam SLT = 4;
    localparam XOR = 5;
    localparam AND = 6;
    localparam OR = 7;
    
    reg [31:0] resInt;
    always @(*) begin
        if(!rst) begin
            case (opCode)
                ADD:    resInt <= AdderRes;
                SUB:    resInt <= AdderRes;
                SHL:    resInt <= SHLRes;
                SHR:    resInt <= SHRRes;
                SLT:    resInt <= {31'd0, AdderRes[31]};
                XOR:    resInt <= XORRes;
                AND:    resInt <= ANDRes;
                OR:     resInt <= ORRes;
                default: resInt <= 0;
            endcase
            Zero <= res == 32'd0;
        end else begin
            resInt <= 0;
            Zero <= 0;
        end
    end

    always @(posedge clk ) begin
        res <= resInt;
    end

    
endmodule