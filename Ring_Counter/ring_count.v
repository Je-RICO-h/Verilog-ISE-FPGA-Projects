`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:09 04/08/2022 
// Design Name: 
// Module Name:    ring_count 
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
module ring_count(input clk, load, 
						output reg [7:0]q);
						
always @(posedge clk)
	if(load==1)
		q<=8'b10000000;
	else
		begin
			q <= {q[0], q[7:1]};
		end
		
endmodule