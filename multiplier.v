module Multiplier (Op1, Op2, Result);
    parameter EM = 4, EN = 2;
    input [EM:1] Op1;
    input [EN:1] Op2;
    output [EM+EN:1] Result;
    assign Result = Op1 * Op2;

endmodule
