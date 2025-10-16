module converter_74(input logic[3:0] bcd_code, output logic[3:0] grey_code);
    // local variables to store the output of different _74LS138_
    logic [7:0] LS_1_out;
    logic [7:0] LS_2_out;

    _74LS138_ LS1( .a_0(bcd_code[0]),
                    .a_1(bcd_code[1]),
                    .a_2(bcd_code[2]),
                    .s_1(~bcd_code[3]),
                    .y_data(LS_1_out));

    _74LS138_ LS2( .a_0(bcd_code[0]),
                    .a_1(bcd_code[1]),
                    .a_2(bcd_code[2]),
                    .s_1(bcd_code[3]),
                    .y_data(LS_2_out));
    
    assign grey_code[3] = bcd_code[3];
    assign grey_code[0] = ~( LS_1_out[1] & LS_1_out[2] & LS_1_out[5] & LS_1_out[6] &
                            LS_2_out[1] & LS_2_out[2] & LS_2_out[5] & LS_2_out[6]);
    assign grey_code[1] = ~( LS_1_out[2] & LS_1_out[3] & LS_1_out[4] & LS_1_out[5] &
                            LS_2_out[2] & LS_2_out[3] & LS_2_out[4] & LS_2_out[5]);
    assign grey_code[2] = ~( LS_1_out[4] & LS_1_out[5] & LS_1_out[6] & LS_1_out[7] &
                            LS_2_out[0] & LS_2_out[1] & LS_2_out[2] & LS_2_out[3]);

endmodule