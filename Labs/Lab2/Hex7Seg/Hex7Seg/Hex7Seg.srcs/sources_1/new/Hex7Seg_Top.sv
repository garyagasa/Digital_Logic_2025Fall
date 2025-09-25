module Hex7Seg_Top(
    input  logic [3:0]SW,
    output logic [6:0]A2G,
    output logic [3:0]AN,
    output logic DP );
    
    assign AN = 4'b1101;    // �Ҳ�4����
    assign DP = 1;          // all dp off
    
    // ʵ���� 7�������
    Hex7Seg S7(.data(SW), .a2g(A2G));
endmodule