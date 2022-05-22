`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:20 04/23/2022 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	input btn,
	input clk,
	output  d_btn
    );
reg delay1, delay2, delay3;

always @(posedge clk)
begin
	delay1 <= btn;
	delay2 <= delay1;
	delay3 <= delay2;
end

assign d_btn = delay1 & delay2 & ~delay3;

endmodule
