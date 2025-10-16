// 2-4������ �ż�����
module Decoder24Gates(
    input  logic       a,
    input  logic       b,
    output logic [3:0] y ); 
       
    logic a_not, b_not;
    
    // ����
    not G1(a_not, a);
    not G2(b_not, b);    
    
    and     // ����
       G3(y[0], a_not, b_not),
       G4(y[1], a_not, b    ),
       G5(y[2], a,     b_not),
       G6(y[3], a,     b    );
endmodule