`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:25:16 03/23/2022 
// Design Name: 
// Module Name:    alu4_top 
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
module alu4_top( input [3:0] a, input [3:0] b, input [2:0] f,
						output [6:0] a_to_g, output [7:0] an, output dp);
wire [7:0] r1;

assign an = 8'b11111110; // 1 digit on, 7 digits off
assign dp = 1; // dp off

hex7seg D4 (.x(r1[3:0]),.a_to_g(a_to_g));
alu_top D1 (.a(a), .b(b), .f(f), .r(r1));

endmodule
