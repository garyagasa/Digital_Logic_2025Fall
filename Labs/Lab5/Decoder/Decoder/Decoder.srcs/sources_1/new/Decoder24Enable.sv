// ����ʹ�ܶ˵�24������������ţ�
module Decoder24Enable(
    input  logic [1:0] A,
    input  logic       enable,
    output logic [3:0] D );
    
    assign D[0] = ~(~enable & ~A[1] & ~A[0]);
    assign D[1] = ~(~enable & ~A[1] &  A[0]);
    assign D[2] = ~(~enable &  A[1] & ~A[0]);
    assign D[3] = ~(~enable &  A[1] &  A[0]);
endmodule