`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:44 04/08/2022 
// Design Name: 
// Module Name:    johnson_count 
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
module johnson_count(input clk, clr, 
							output reg [7:0]q);
							
always @(posedge clk)
	if(clr==1)
		q<=8'b00000000;
	else
		begin
			q <= {~q[0], q[7:1]};
		end
endmodule
