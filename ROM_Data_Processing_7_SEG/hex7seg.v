`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:07 04/01/2022 
// Design Name: 
// Module Name:    hex7seg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seg7 ( input [15:0] val, 
					input clk, 
					input rst,
					  output reg [6:0] seg,
					  output reg [3:0] dig);
reg [1:0] s;
reg [3:0] digit;
wire [3:0] aen;

//Mikor kapcsoljon a kijelzo

assign aen[3] = val[15] | val[14] | val[13] | val[12];
assign aen[2] = val[15] | val[14] | val[13] | val[12] | val[11] | val[10] | val[9] | val[8];
assign aen[1] = val[15] | val[14] | val[13] | val[12] | val[11] | val[10] | val[9] | val[8] | val[7] | val[6] | val[5] | val[4];
assign aen[0] = 1; // 0 adig szam mindig egjen					  

//4-1 MUX Digit kivalaszto

always @(*)
case(s)
	0: digit = val[3:0];
	1: digit = val[7:4];
	2: digit = val[11:8];
	3: digit = val[15:12];
	default: digit = val[3:0];
endcase

//hex7seg
					  
always @(*)
case(digit)
	0: seg = 7'b0000001;
	1: seg = 7'b1001111;
	2: seg = 7'b0010010;
	3: seg = 7'b0000110;
	4: seg = 7'b1001100;
	5: seg = 7'b0100100;
	6: seg = 7'b0100000;
	7: seg = 7'b0001111;
	8: seg = 7'b0000000;
	9: seg = 7'b0000100;
	'hA: seg = 7'b0001000;
	'hb: seg = 7'b1100000;
	'hC: seg = 7'b0110001;
	'hd: seg = 7'b1000010;
	'hE: seg = 7'b0110000;
	'hF: seg = 7'b0111000;
default: seg = 7'b0000001; // 0

endcase

//Digit Select

always @(clk)
	begin
	  dig = 4'b1111;
	  if(aen[s] == 1)
	    dig[s] = 0;
	end

always @(posedge clk or posedge rst)
	begin
		if(rst == 1)
			s <= 0;
		else
			s <= s + 1;
	end

endmodule
