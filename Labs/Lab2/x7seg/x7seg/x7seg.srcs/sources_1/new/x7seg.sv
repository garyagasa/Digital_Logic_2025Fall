module X7Seg( input  logic [39:0] data,
              input  logic        clk,
              output logic [7:0]  an,
              output logic [4:0] digit
              ); 
    
    logic [2:0] s;     
    logic [19:0] clkdiv;
    
    assign dp = 1;           // DP off
    assign s = clkdiv[19:17];// count every 10.4ms        
    
    //8个七段数码管要显示的数据
    always_comb
        case(s)
            0:  digit = data[4:0];
            1:  digit = data[9:5];
            2:  digit = data[14:10];
            3:  digit = data[19:15];
            4:  digit = data[24:20];
            5:  digit = data[29:25];
            6:  digit = data[34:30];
            7:  digit = data[39:35];
            default: digit = data[4:0];
        endcase
    
    //8个七段数码管的分时显示
    always_comb
        case(s)
            0:  an = 8'b11111110;
            1:  an = 8'b11111101;
            2:  an = 8'b11111011;
            3:  an = 8'b11110111;
            4:  an = 8'b11101111;
            5:  an = 8'b11011111;
            6:  an = 8'b10111111;
            7:  an = 8'b01111111;
            default: an = 8'b11111110;
        endcase
        
    // 时钟分频器
    always @(posedge clk)
      clkdiv <= clkdiv + 1;    
endmodule