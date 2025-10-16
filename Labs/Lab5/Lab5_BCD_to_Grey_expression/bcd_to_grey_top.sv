`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University 
// Engineer: Gary Agasa(Shiqiang Wu)
// 
// Create Date: 2025/10/17 02:05:47
// Design Name: 
// Module Name: bcd_to_grey_top
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


module bcd_to_grey_top(input logic CLK100MHZ,
                input logic [15:0] SW,
                output logic [15:0] LED,
                output logic [7:0] AN,
                output logic [6:0] A2G
                );
      
      logic [3:0] wDigit;
      logic [3:0] grey;
      
      assign LED = SW;
      
      converter_expression conv(.bcd_code(SW[3:0]),
                        .grey_code(grey));
      
      // 分时复用数码管显示
      X7Seg x1(.clk (CLK100MHZ),
               .bcd_code(SW[3:0]),
               .grey_code(grey),
               .digit(wDigit),
               .an (AN)
               );

      // 单个七段数码管显示
      Hex7Seg h1(.digit(wDigit), .a2g(A2G));
endmodule
