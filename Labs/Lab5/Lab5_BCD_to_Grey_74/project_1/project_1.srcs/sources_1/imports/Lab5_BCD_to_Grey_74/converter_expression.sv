module converter_expression(input logic[3:0] bcd_code, output logic[3:0] grey_code);
    // local variables to store the output of different _74LS138_
    logic [7:0] LS_1_out;
    logic [7:0] LS_2_out;
    
    assign grey_code[3] = bcd_code[3];
    assign grey_code[2] = (bcd_code[3] ^ bcd_code[2]);
    assign grey_code[1] = (bcd_code[2] ^ bcd_code[1]);
    assign grey_code[0] = (bcd_code[1] ^ bcd_code[0]);
endmodule