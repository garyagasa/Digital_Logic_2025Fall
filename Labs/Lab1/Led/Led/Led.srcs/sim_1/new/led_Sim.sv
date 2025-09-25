`timescale 1ns / 1ps
// 时延单位为1ns,时延精度为1ps

module led_Sim(  );  // 无接口
    logic [15:0] sw; // 输入端口变量
    logic [15:0] Led;// 输出端口变量
    
    // 实例化
    led A(.SW(sw),   // 输入
          .LED(Led));// 输出
    
    // 激励信号
    initial   // 只执行一次
    begin
        integer i;
        
        // 给sw[i]赋初值0
        for (i = 15; i >= 0; i=i-1)     
            sw[i] = 0; 
            
        // 每10ns给sw[i]赋值1一次
        for (i = 15; i >= 0; i=i-1)       
            #10  sw[i] = 1;  
    end
endmodule