`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:03 04/23/2022 
// Design Name: 
// Module Name:    adder 
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
module adder (input [7:0] in, 
				  output reg [15:0] sum,
				  input c,
				  input clr
					);
					
always @(posedge c or posedge clr)
	begin
		if(clr == 1)
			sum <= in;
		else
			sum <= sum + in ;
	end
endmodule
