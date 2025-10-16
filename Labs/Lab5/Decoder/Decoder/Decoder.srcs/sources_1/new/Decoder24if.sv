// 2-4ÒëÂëÆ÷ £¨forÑ­»·+if£©
module Decoder24if(
    input  logic [1:0] a,
    output logic [3:0] y ); 

    integer i;
    
    always_comb  
        for(i=0; i<=3; i=i+1)
            if(a==i)
                y[i] = 1;
            else
                y[i] = 0;
endmodule