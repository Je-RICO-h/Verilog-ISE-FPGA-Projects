`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:49 03/23/2022 
// Design Name: 
// Module Name:    alu_top 
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
module alu_top(input [3:0] a, b, input [2:0] f, output [7:0] r );
wire[3:0] addmux_out, submux_out;
wire [7:0] add_out, sub_out, mul_out;
		mux2_4 adder_mux(b, 4'd1, f[0], addmux_out);
		mux2_4 sub_mux(b, 4'd1, f[0], submux_out);
		add4 our_adder(a, addmux_out, add_out);
		sub4 our_subtracer(a, submux_out, sub_out);
		mul4 our_multiplier(a,b,mul_out);
		mux3_8 output_mux(add_out, sub_out, mul_out, f[2:1], r);
endmodule
