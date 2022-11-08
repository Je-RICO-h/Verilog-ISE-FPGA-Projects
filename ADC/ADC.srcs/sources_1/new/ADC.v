module XADCdemo(input CLK100MHZ, vauxp11, vauxn11, output [15:0] LED, output [7:0] an, output dp, output [6:0] a_to_g);
   wire enable;  
   wire ready;
   wire [15:0] data;         
   wire [3:0] dig0, dig1, dig2, dig3, dig4, dig5, dig6;
   wire clk760, clk6;
   wire [3:0] digit_value;
   wire [2:0] digit;
     
   //xadc peldanyositas (eoc_out ossze van kotve den_in-nel a folyamatos konverzio erdekeben)
   xadc_0  xadc_module (.daddr_in(8'h1b), //11-es bemenethez tartozo cim, a tobbi megnezheto az Artix 7 XADC user guide-ban
                     .dclk_in(CLK100MHZ), 
                     .den_in(enable), 
                     .di_in(0), 
                     .dwe_in(0), 
                     .vauxp11(vauxp11),
                     .vauxn11(vauxn11),
                     .vn_in(0), 
                     .vp_in(0), 
                     .do_out(data),
                     .eoc_out(enable),
                     .drdy_out(ready));
                     
  led_driver led_driver_module(.mclk(CLK100MHZ), .ready(ready), .data(data), .LED(LED));   
  decimal_to_digits dec_to_dig_module(.mclk(clk6), .data(data), .dig0(dig0), .dig1(dig1), .dig2(dig2), .dig3(dig3), .dig4(dig4), .dig5(dig5), .dig6(dig6));
  hex7segb  hex7seg (.x(digit_value), .a_to_g(a_to_g));
  mux4_4bus  mux (.I0(dig0), .I1(dig1), .I2(dig2), .I3(dig3), .I4(dig4), .I5(dig5), .I6(dig6), .I7(0), .Sel(digit), .Y(digit_value));                   
  clkdiv  clkdivider (.clk(CLK100MHZ), .clr(0), .clk760(clk760), .clk6(clk6));
  anode_driver  anode (.clk(clk760), .rst(0), .Q(digit), .an(an), .dp(dp));    
endmodule

module led_driver(input mclk, ready, input [15:0] data, output reg [15:0] LED);         
      always @(posedge(mclk))
          begin            
            if(ready == 1'b1)
                begin
                  case (data[15:12])
                    1:  LED <= 16'b11;
                    2:  LED <= 16'b111;
                    3:  LED <= 16'b1111;
                    4:  LED <= 16'b11111;
                    5:  LED <= 16'b111111;
                    6:  LED <= 16'b1111111; 
                    7:  LED <= 16'b11111111;
                    8:  LED <= 16'b111111111;
                    9:  LED <= 16'b1111111111;
                    10: LED <= 16'b11111111111;
                    11: LED <= 16'b111111111111;
                    12: LED <= 16'b1111111111111;
                    13: LED <= 16'b11111111111111;
                    14: LED <= 16'b111111111111111;
                    15: LED <= 16'b1111111111111111;                        
                    default: LED <= 16'b1; 
                   endcase
                end   
          end
endmodule

module decimal_to_digits(input mclk, [15:0] data, output reg [3:0] dig0, dig1, dig2, dig3, dig4, dig5, dig6);
    reg [32:0] decimal; 
    //binaris decimalis atalakitas
    always @ (posedge(mclk))
        begin
            decimal = data[15:4];
            //jobban nez ki az 1V mint a 0.999755 (kerekites okozza)
            if(decimal >= 4093)
                begin
                    dig0 = 0;
                    dig1 = 0;
                    dig2 = 0;
                    dig3 = 0;
                    dig4 = 0;
                    dig5 = 0;
                    dig6 = 1;
                end
            else 
                begin
                    //250000-rel szorzas majd 1024-gyel osztas
                    //tulajdonkeppen 244,14 uV-tal
                    decimal = decimal * 250000;
                    decimal = decimal >> 10;
                                                
                    dig0 = decimal % 10;
                    decimal = decimal / 10;
                    dig1 = decimal % 10;
                    decimal = decimal / 10;
                    dig2 = decimal % 10;
                    decimal = decimal / 10;
                    dig3 = decimal % 10;
                    decimal = decimal / 10;
                    dig4 = decimal % 10;
                    decimal = decimal / 10;
                    dig5 = decimal % 10;
                    decimal = decimal / 10; 
                    dig6 = decimal % 10;
                    decimal = decimal / 10; 
                end
        end  
endmodule

module hex7segb(input [3:0] x, output reg [6:0] a_to_g);
    always @(*)
        case (x)
          4'h0: a_to_g = 7'b0000001;
          4'h1: a_to_g = 7'b1001111;
          4'h2: a_to_g = 7'b0010010;
          4'h3: a_to_g = 7'b0000110;
          4'h4: a_to_g = 7'b1001100;
          4'h5: a_to_g = 7'b0100100;
          4'h6: a_to_g = 7'b0100000;
          4'h7: a_to_g = 7'b0001111;
          4'h8: a_to_g = 7'b0000000;
          4'h9: a_to_g = 7'b0000100;
          4'hA: a_to_g = 7'b0001000;
          4'hB: a_to_g = 7'b1100000;
          4'hC: a_to_g = 7'b0110001;
          4'hD: a_to_g = 7'b1000010;
          4'hE: a_to_g = 7'b0110000;
          4'hF: a_to_g = 7'b0111000;
          default: a_to_g = 7'b0000001;
        endcase
endmodule

module mux4_4bus(input [3:0] I0, I1, I2, I3, I4, I5, I6, I7, [2:0] Sel, output [3:0] Y); 
    assign Y = ( Sel == 0 )? I0 : ( Sel == 1 )? I1 : ( Sel == 2 )? I2 : ( Sel == 3 )? I3 : ( Sel == 4 )? I4 :( Sel == 5 )? I5 :( Sel == 6 )? I6 : I7;
endmodule

module clkdiv (input wire clk, clr, output wire clk760, clk6);
	reg [24:0] q;
	// 25-bit counter
	always @(posedge clk or posedge clr)
	begin
		if(clr == 1)
			q <= 0;
		else
			q <= q + 1;
	end
	assign clk760 = q[16]; // 760 Hz
	assign clk6 = q[23]; // 6 Hz
endmodule


module anode_driver (input clk, rst, output reg [2:0] Q, output [7:0] an, output dp);
    always @ (posedge(clk))
        begin
            if (rst == 3'b111)
                Q <= 3'b0;
            else
                Q <= Q + 1'b1;
        end
        
    assign an[0] = ~(~Q[2] & ~Q[1] & ~Q[0]);
    assign an[1] = ~(~Q[2] & ~Q[1] & Q[0]);
    assign an[2] = ~(~Q[2] & Q[1] & ~Q[0]);
    assign an[3] = ~(~Q[2] & Q[1] & Q[0]);
    assign an[4] = ~(Q[2] & ~Q[1] & ~Q[0]);
    assign an[5] = ~(Q[2] & ~Q[1] & Q[0]);
    assign an[6] = ~(Q[2] & Q[1] & ~Q[0]);
    assign an[7] = ~(Q[2] & Q[1] & Q[0]);
    assign dp = ~(Q[2] & Q[1] & ~Q[0]);
endmodule