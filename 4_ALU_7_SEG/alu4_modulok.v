`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:02 03/23/2022 
// Design Name: 
// Module Name:    alu4_modulok 
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
module mux2_4(input [3:0] i0, i1, input sel, output [7:0] out);
	assign out = sel ? i1 : i0;
endmodule

module mux3_8(input [7:0] i0, i1, i2, input [1:0] sel, output reg [7:0]out);
	always @(i0 or i1 or i2 or sel)
		begin
			case (sel)
				2'b00: out = i0;
				2'b01: out = i1;
				2'b10: out = i2;
				default: out = 8'bx;
			endcase
	end
endmodule

module add4(input [3:0] i0, i1, output [7:0] sum);
	assign sum=i0+i1;
endmodule

module sub4(input [3:0] i0, i1, output [7:0] diff);
	assign diff=i0-i1;
endmodule

module mul4(input [3:0] i0, i1, output [7:0] prod);
	assign prod=i0*i1;
endmodule
