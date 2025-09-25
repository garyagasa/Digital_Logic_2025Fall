`timescale 1ns / 1ps
// ʱ�ӵ�λΪ1ns,ʱ�Ӿ���Ϊ1ps

module led_Sim(  );  // �޽ӿ�
    logic [15:0] sw; // ����˿ڱ���
    logic [15:0] Led;// ����˿ڱ���
    
    // ʵ����
    led A(.SW(sw),   // ����
          .LED(Led));// ���
    
    // �����ź�
    initial   // ִֻ��һ��
    begin
        integer i;
        
        // ��sw[i]����ֵ0
        for (i = 15; i >= 0; i=i-1)     
            sw[i] = 0; 
            
        // ÿ10ns��sw[i]��ֵ1һ��
        for (i = 15; i >= 0; i=i-1)       
            #10  sw[i] = 1;  
    end
endmodule