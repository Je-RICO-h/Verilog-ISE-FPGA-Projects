`timescale 1ns / 1ps

module uart_tx( input wire clk, // clock, synchronize communication
                input wire clr, // reset
                input wire[7:0] tx_data, // Az adat, melyet a modulnak tov�bb�tania kell a soros porton 
                input wire ready, // mikor a v�ltoz� �rt�ke HIGH, az adat (tx_data) tov�bb�t�dik a TxD-n kereszt�l, az LSB-vel kezd�d�en
                output reg tdre, //A regiszter jelzi (HIGH), mikor fejez�d�tt be az adat�tvitel
                output reg TxD // Az �tvitel akkor kezd�dik, mikor a TxD 1 bitid� hosszan HIGH �llapotb�l LOW �llapotba megy �t. F�gg a baud rate-t�l
              );
    
    // A tervez�si mint�t legeffekt�vebben �llapotg�pekkel tudjuk elk�sz�teni
    reg[2:0] state; // jel�li, hogy �pp melyik �llapotban j�runk 
                    // 5 �llapotunk van, mely 2^3-1 f�le lehet�s�g kombin�ci�ja, ez�rt 3 bitesre v�lasztottuk a v�ltoz�t.
                    
    // A lehets�ges �llapotok
    parameter mark = 3'b000, start = 3'b001, delay = 3'b010, shift = 3'b011, stop = 3'b100;
    
    reg[7:0] txbuff; // a tov�bb�tand� adat, amely 8 bit hossz�
    reg[11:0] baud_count; // �rajel ciklus sz�ml�l�sra haszn�ljuk, am�g el nem �ri a bitid�t.
                          //minden bit elk�ld�se ut�n null�z�dik az �rt�ke, �s �jrakezdi a sz�ml�l�st
    reg[3:0] bit_count; // sz�ml�lja, h�ny bitet k�ldt�nk �t
    parameter bit_time = 12'h514; //9600 baud
    
    always @(posedge clk or posedge clr)
        begin // begin 1
            if(clr == 1) // if clr 
                begin // begin 2
                    state <= mark;
                    txbuff <= 0;
                    baud_count <= 0;
                    bit_count <= 0;
                    TxD <= 1;
                end // begin 2 end
            else // if clr else
                case(state)
                    mark:
                        begin // begin mark
                            bit_count <= 0;
                            tdre <= 1;
                            if(ready == 0) // if ready
                                begin // begin ready
                                    state <= mark;
                                    txbuff <= tx_data;
                                end // begin end ready
                            else // if ready else
                                begin
                                    baud_count <= 0;
                                    state <= start;
                                end
                        end
                    start:
                        begin
                            baud_count <= 0;
                            TxD <= 0;
                            tdre <= 0;
                            state <= delay;
                        end
                    delay:
                        begin
                            tdre <= 0;
                            if(baud_count >= bit_time)
                                begin
                                    baud_count <= 0;
                                    if(bit_count < 8)
                                        state <= shift;
                                    else
                                        state <= stop;
                                end
                            else
                                begin
                                    baud_count <= baud_count+1;
                                    state <= delay;
                                end
                            end
                     shift:
                        begin
                            tdre <= 0;
                            TxD <= txbuff[0];
                            txbuff[6:0] <= txbuff[7:1];
                            bit_count <= bit_count+1;
                            state <= delay;
                        end
                     stop:
                        begin
                            tdre <= 0;
                            TxD <= 1;
                            if(baud_count >= bit_time)
                                begin
                                    baud_count <= 0;
                                    state <= mark;
                                end
                            else
                                begin
                                    baud_count <= baud_count+1;
                                    state <= stop;
                                end
                         end
                 endcase
         end 
    
endmodule