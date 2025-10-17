// a_0 : the 0th digit of the input data
// a_1 : the 1st digit of the input data
// a_2 : the 2ed digit of the input data

// y_data : the output

module _74LS138_(input logic a_0,
                input logic a_1,
                input logic a_2,
                input logic s_1,
                output logic [7:0]  y_data
                );
    always_comb 
    begin
        if(s_1 == 0)
        begin
            y_data = 8'b00000000;
        end
        else
        begin
            y_data[0] = (~a_0) & (~a_1) & (~a_2);
            y_data[1] = (a_0) & (~a_1) & (~a_2);
            y_data[2] = (~a_0) & (a_1) & (~a_2);
            y_data[3] = (a_0) & (a_1) & (~a_2);
            y_data[4] = (~a_0) & (~a_1) & (a_2);
            y_data[5] = (a_0) & (~a_1) & (a_2);
            y_data[6] = (~a_0) & (a_1) & (a_2);
            y_data[7] = (a_0) & (a_1) & (a_2);
        end
    end

endmodule