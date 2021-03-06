`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:31 04/27/2022 
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
module hex7seg(
	input wire [15:0] x,
	input wire cclk,
	input wire clr,
	output reg [6:0] a_to_g,
	output reg [7:0] an,
	output wire dp
    );

reg [1:0] s;
reg [3:0] digit;
wire [3:0] aen;
assign dp = 1;

assign aen[3] = x[15] | x[14] | x[13] | x[12];
assign aen[2] = x[15] | x[14] | x[13] | x[12] | x[11] | x[10] | x[9] | x[8];
assign aen[1] = x[15] | x[14] | x[13] | x[12] | x[11] | x[10] | x[9] | x[8] | x[7] | x[6] | x[5] | x[4];
assign aen[0] = 1;

always @(*)
case(s)
	0: digit = x [3:0];
	1: digit = x [7:4];
	2: digit = x [11:8];
	3: digit = x [15:12];
	default: digit = x[3:0];
endcase

always @(*)
case(digit)
	0: a_to_g = 7'b1000000;
	1: a_to_g = 7'b1111001;
	2: a_to_g = 7'b0100100;
	3: a_to_g = 7'b0110000;
	4: a_to_g = 7'b0011001;
	5: a_to_g = 7'b0010010;
	6: a_to_g = 7'b0000010;
	7: a_to_g = 7'b1111000;
	8: a_to_g = 7'b0000000;
	9: a_to_g = 7'b0010000;
	'hA: a_to_g = 7'b0001000;
	'hb: a_to_g = 7'b1100000;
	'hC: a_to_g = 7'b0110001;
	'hd: a_to_g = 7'b1000010;
	'hE: a_to_g = 7'b0110000;
	'hF: a_to_g = 7'b0111000;
	default: a_to_g = 7'b0000001;
endcase

always @(cclk)
	begin
		an = 4'b1111;
		if(aen[s] == 1)
			an[s] = 0;
	end

always @(posedge cclk or posedge clr)
	begin
		if(clr == 1)
		s <= 0;
		else
		s <= s + 1;
	end
	
endmodule
