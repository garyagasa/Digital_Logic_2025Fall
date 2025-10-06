module X7Seg( input  logic [15:0] data,
              input  logic        clk,
              output logic [3:0]  an,
              output logic [3:0] digit
              ); 
    
    logic [1:0] s;     
    logic [19:0] clkdiv;
    
    assign dp = 1;           // DP off
    assign s = clkdiv[19:18];// count every 10.4ms        
    
    //8个七段数码管要显示的数据
    always_comb
        case(s)
            0:  digit = data[3:0];
            1:  digit = data[7:4];
            2:  digit = data[11:8];
            3:  digit = data[15:12];
            default: digit = data[3:0];
        endcase
    
    //8个七段数码管的分时显示
    always_comb
        case(s)
            0:  an = 4'b1110;
            1:  an = 4'b1101;
            2:  an = 4'b1011;
            3:  an = 4'b0111;
            default: an = 4'b1110;
        endcase
        
    // 时钟分频器
    always @(posedge clk)
      clkdiv <= clkdiv + 1;    
endmodule