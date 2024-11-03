module CarryLookAheadUnit3Slice (
    input carry0In,
    input carry1In,
    input carry2In,
    input propogate0,
    input propogate1,
    input propogate2,
    output reg carry0Out,
    output reg carry1Out,
    output reg carry2Out,
    output reg propogateOut,
    input clk
);
    //replace with a LUT
    always @(posedge clk) begin
        carry0Out <= carry0In;
        carry1Out <= carry1In | (carry0In & propogate1);
        carry2Out <= carry2In | (propogate2 & carry1In) | (carry0In & propogate1 & propogate2);
        propogateOut <= propogate2 & propogate1 & propogate0;
    end
    
endmodule