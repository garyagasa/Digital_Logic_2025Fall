`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 00:06:47
// Design Name: 
// Module Name: ALU_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_Top(input logic CLK100MHZ,
                input logic [15:0] SW,
                output logic [15:0] LED,
                output logic [7:0] AN,
                output logic [6:0] A2G);
      
      logic [39:0] wData;
      logic [4:0] wDigit;
      
      assign LED = SW;
      ALU a1(.A    (SW[3:0]),
             .B    (SW[7:4]),
             .Cin  (SW[8]  ),
             .alusel(SW[15:13]),    //M(SW15), S1,S0(SW14, 13)
             .data  (wData)
             );
      
      // 分时复用数码管显示
      X7Seg x1(.clk (CLK100MHZ),
               .data(wData),
               .digit(wDigit),
               .an (AN)
               );
      // 单个七段数码管显示
      Hex7Seg h1(.data(wDigit), .a2g(A2G));
endmodule
