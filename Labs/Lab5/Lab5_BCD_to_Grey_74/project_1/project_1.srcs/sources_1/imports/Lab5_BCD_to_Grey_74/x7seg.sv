// Control overall 8 HexSegs
module X7Seg(input  logic [3:0] grey_code,
            input logic [3:0] bcd_code,  
            input  logic        clk,
            output logic [7:0]  an,
            output logic [3:0] digit
            ); 
    
    logic [2:0] s;     
    logic [19:0] clkdiv;
    
    assign dp = 1;           // DP off(关闭/开启小数点)
    assign s = clkdiv[19:17];// count every 10.4ms        
    
    // The digit for the Hex7Seg to show at this time
    always_comb
        case(s)
            0:  digit = {1'b0, 1'b0, 1'b0, bcd_code[0]};
            1:  digit = {1'b0, 1'b0, 1'b0, bcd_code[1]};
            2:  digit = {1'b0, 1'b0, 1'b0, bcd_code[2]};            
            3:  digit = {1'b0, 1'b0, 1'b0, bcd_code[3]};
            4:  digit = {1'b0, 1'b0, 1'b0, grey_code[0]};
            5:  digit = {1'b0, 1'b0, 1'b0, grey_code[1]};
            6:  digit = {1'b0, 1'b0, 1'b0, grey_code[2]};
            7:  digit = {1'b0, 1'b0, 1'b0, grey_code[3]};
            default: digit = 4'b0000;
        endcase
    
    // Which Hex7Seg should be lighted at this time
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
            default: an = 8'b11111111;
        endcase
        
    // 时钟分频器
    always @(posedge clk)
      clkdiv <= clkdiv + 1;    
endmodule