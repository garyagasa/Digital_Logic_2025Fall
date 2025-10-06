`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 00:06:47
// Design Name: 
// Module Name: Leap1_Top
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


module Leap1_Top(input logic CLK100MHZ,
                input logic [15:0] SW,
                output logic [15:0] LED,
                output logic [3:0] AN,
                output logic [6:0] A2G,
                output logic LED16_R,
                output logic LED16_G);
      
      logic [3:0] wDigit;
      
      assign LED = SW;
      
      Leap a1(.data(SW),
              .r(LED16_R),
              .g(LED16_G)
             );
      
      // 分时复用数码管显示
      X7Seg x1(.clk (CLK100MHZ),
               .data(SW),
               .digit(wDigit),
               .an (AN)
               );
      // 单个七段数码管显示
      Hex7Seg h1(.digit(wDigit), .a2g(A2G));
endmodule
