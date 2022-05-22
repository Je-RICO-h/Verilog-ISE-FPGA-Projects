`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:38 04/08/2022 
// Design Name: 
// Module Name:    clkdiv 
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
module clkdiv ( input clk, clr, 
					 output clk50, clk100 );
					 
reg [22:0] q;

// 27-bit counter
always @(posedge clk or posedge clr)
	begin
		if(clr == 1)
			q <= 0;
		else
			q <= q + 1;
	end
	
//assign clk1 = q[22]; // ~0.75 Hz
//assign clk2 = q[21]; // ~1.5
//assign clk3 = q[20]; // ~3 Hz
assign clk50 = q[16]; //48 Hz
assign clk100 = q[15];

endmodule