// 2-4译码器 （Case语句）P122
module Decoder24case(
    input  logic [1:0] a,
    output logic [3:0] y ); 
    
    always_comb
        case(a)
            2'b00: y = 4'b0001;
            2'b01: y = 4'b0010;
            2'b10: y = 4'b0100;
            2'b11: y = 4'b1000;
            default: y = 4'bzzzz; //此时可省
        endcase
endmodule