`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:10 04/08/2022 
// Design Name: 
// Module Name:    v_shift_registers_6_TOP 
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
module v_shift_registers_6_TOP(
		input clk, clr,
		output [7:0] SO
    );

wire clk1,clk2,clk3;

clkdiv C1(.clk(clk), .clr(clr), .clk1(clk1), .clk2(clk2), .clk3(clk3));
johnson_count R1(.clk(clk2), .clr(clr), .q(SO));

endmodule
