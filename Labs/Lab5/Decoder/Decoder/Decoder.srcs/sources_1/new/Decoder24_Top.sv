module Decoder24_Top(
    input  logic [1:0] SW,
    output logic [3:0] LED );
    
    //สตภýปฏ
    Decoder24Gates D1(.a(SW[1]), 
                      .b(SW[0]), 
                      .y(LED) );
endmodule