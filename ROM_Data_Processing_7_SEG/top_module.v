`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:54 04/23/2022 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
		input clk, clr, btn,
		output [3:0] dign,
		output [6:0] segn
    );

wire clk50,clk100, d_btn, ts;
wire [3:0] Q;
wire [7:0] data;
wire [15:0] sum;

clkdiv C1(.clk(clk), .clr(clr), .clk50(clk50), .clk100(clk100));
dist_rom16 M1(.a(Q), .spo(data));
debouncer D1(.btn(btn), .clk(clk50), .d_btn(d_btn));
counter C2(.button(d_btn), .clr(clr), .Q(Q), .ts(ts));
adder A1 (.in(data), .c(d_btn), .clr(ts), .sum(sum));
seg7 S1 (.val(sum), .clk(clk100), .rst(clr), .dig(dign), .seg(segn));

endmodule
