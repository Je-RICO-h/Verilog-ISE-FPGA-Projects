`timescale 1ns / 1ps

module test_tx_ctrl(input wire clk, // clock, synchronize communication
                    input wire clr, // reset
                    input wire go, // indik�lja az adatk�ld�st, �rt�ke att�l f�gg, hogy t�rt�nt-e gombnyom�s
                                    // ~go ideig a wtgo �llapotban tart�zkodunk, go-ra l�p�nk �t
                    input wire tdre, //addig maradunk a wttdre (l�sd lejjebb a paramter deklar�l�sn�l) �llapotban, m�g tdre �llapota ~tdre
                    output reg ready //Megmondja, hogy az uart_tx befejezte-e az adatok tov�bb�t�s�t
                   );
                    
    reg[1:0] state; // az aktu�lis �llapotot t�rolja. Mivel 4 = 2^2 �llapotunk lesz, ez�rt el�g egy 2 bites v�ltoz�
                    
    //A modulban el�fordul� lehets�ges �llapotok
    parameter wtgo = 2'b00, wttdre = 2'b01, load = 2'b10, wtngo = 2'b11;
     
    always @(posedge clk or posedge clr)
        begin
            if(clr == 1)
                begin
                    state <= wtgo;
                    ready <= 0;
                end
            else
                case(state)
                    wtgo:
                        if(go == 0)
                            begin
                                state <= wtgo;
                                ready <= 0;
                            end
                        else
                            begin
                                ready <= 0;
                                state <= wttdre;
                            end
                    wttdre:
                        if(tdre == 0)
                            begin
                                state <= wttdre;
                                ready <= 0;
                            end
                        else
                            begin
                                state <= load;
                                ready <= 0;
                            end
                    load:
                        begin
                            ready <= 1;
                            state <= wtngo;
                        end
                    wtngo:
                        if(go == 1)
                            begin
                                state <= wtngo;
                                ready <= 0;
                            end
                        else
                            begin
                                ready <= 0;
                                state <= wtgo;
                            end
                endcase
        end                
endmodule
