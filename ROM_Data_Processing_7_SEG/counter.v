`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:13 04/05/2022 
// Design Name: 
// Module Name:    counter 
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
module counter (input wire clr, 
 input wire button,
 output reg [3:0] Q,
 output reg ts);
 
// N-bit counter
always @(posedge button or posedge clr)
	begin
		if(clr == 1)
			begin
			Q <= 0;
			ts <= 1;
			end
		
		else
			begin
				Q <= Q + 1;
				ts <= 0;
			end
	end
endmodule