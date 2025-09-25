module ALU(
    input  logic [2:0] alusel,  // input wire [2:0] alusel,
    input  logic [3:0] A,       // input wire [3:0] A,
    input  logic [3:0] B,       // input wire [3:0] B,
    input logic Cin,
    output logic [39:0] data );     // output reg [39:0] data 
    
    logic [4:0] temp;           // reg [4:0] temp;
    logic [3:0] y;              // 4 bit arithmetic result
    
    always_comb
    begin
        // Initialization
        data = {40{1'b1}};  //全灭
        // Put A into the data
        data[39:35] = {1'b0,A}; 
        // Put = into the data
        data[14:10] = 5'b10000;
        temp = 5'b00000;
        
        case(alusel)    //M(SW15), S1(SW14), S2(SW13)
            // Not A
            3'b000:
                begin
                    y = ~A;
                    data[4:0] = {1'b0, y};
                end
            // A and B
            3'b001:   
                begin
                    y = A & B;
                    // Put the result into the data
                    data[4:0] = {1'b0, y};
                    // Put B into the data
                    data[29:25] = {1'b0, B};
                end 
            // A or B          
            3'b010:
                begin
                    y = A | B;
                    // Put the result into the data
                    data[4:0] = {1'b0, y};
                    // Put B into the data
                    data[29:25] = {1'b0, B};
                end
            // A Xor B
            3'b011:
                begin
                    y = (A & ~B) | (~A & B);
                    // Put the result into the data
                    data[4:0] = {1'b0, y};
                    // Put B into the data
                    data[29:25] = {1'b0, B};
                end
            // A + B
            3'b100:
                begin
                    temp = {1'b0, A} + {1'b0, B} + {4'b0000, Cin};
                    y = temp[3:0];
                    // Put the result into the data
                    data[4:0] = {1'b0, y};
                    // Put B into the data
                    data[29:25] = {1'b0, B};
                    
                    // Put Cin into the data
                    data[19:15] = {4'b0000, Cin}; 
                    // Put Cout into the data
                    data[9:5] = {4'b0000, temp[4]}; 
                    // Put + into the data
                    data[34:30] = 5'b10001;
                    data[24:20] = 5'b10001;
                end
            // A - B
            3'b101:
                begin
                    temp = {1'b0, A} - {1'b0, B} - {4'b0000, Cin};
                    y = temp[3:0];
                    // Put the result into the data
                    data[4:0] = {1'b0, y};
                    // Put B into the data
                    data[29:25] = {1'b0, B};
                    
                    // Put Cin into the data
                    data[19:15] = {4'b0000, Cin}; 
                    // Put Cout into the data
                    data[9:5] = {4'b0000, temp[4]}; 
                    // Put + into the data
                    data[34:30] = 5'b10010;
                    data[24:20] = 5'b10010;
                end
            default:
                begin
                    //全灭
                    data = {40{1'b1}};
                end
        endcase
    
    end // always_comb
endmodule