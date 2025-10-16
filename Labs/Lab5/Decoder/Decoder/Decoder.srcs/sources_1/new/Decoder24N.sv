// 参数化的 N:2**N译码器 P134
module Decoder24N
    #(parameter N = 3)
    (input  logic [N-1:0]    a,
     output logic [2**N-1:0] y );
     
     always_comb
        begin
            y    = 0;
            y[a] = 1;
        end
endmodule