`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:13 04/05/2022 
// Design Name: 
// Module Name:    rategen 
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
module rategen(
		input clk,rst,
		output cy
    );

reg [29:0] Q;
always @(posedge clk)
begin

if(rst |cy)
	Q<=0;
else
	Q <= Q + 1;
end

assign cy = (Q == 9999999);

endmodule
