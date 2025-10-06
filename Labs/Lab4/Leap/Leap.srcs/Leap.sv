module Leap(
    output logic [15:0] data,
    output logic r,
    output logic g);     
    
    logic [4:0] temp;           // reg [4:0] temp;
    logic [3:0] y;              // 4 bit arithmetic result
    logic[1:0] mod_remain;
    
    always_comb
    begin
        if(data[3:0] == 0 & data[7:4] == 0)
            begin
                mod_remain = (data[11:8]  + 10 * data[15:12]) % 4;
                if(mod_remain == 0)
                    begin
                        r = 0;
                        g = 1;
                    end
                else
                    begin
                        r = 1;
                        g = 0;
                    end
            end
        else
            begin
                mod_remain = (data[3:0]  + 8'd10 * data[7:4]) % 4;
                if(mod_remain == 0)
                    begin
                        r = 0;
                        g = 1;
                    end
                else
                    begin
                        r = 1;
                        g = 0;
                    end
            end
    end // always_comb
endmodule