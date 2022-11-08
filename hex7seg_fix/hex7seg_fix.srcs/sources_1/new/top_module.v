`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2022 15:10:40
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
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
        input wire mclk,
        input wire [3:0] btn,
        input wire [15:0] sw,
        output wire [6:0] a_to_g,
        output wire dp,
        output wire [7:0] an,
        output wire ld1,
        output wire ld2,
        output wire ld3
    );
    
    wire clk25, clk190, clk3, clr;
    wire [15:0] x;
    wire [3:0] btnd;
    
    assign clr = btn[3];
    assign x = {8'b00000000, sw};
    assign ld1 = clk190;
    assign ld2 = clk25;
    assign ld3 = clk3;
    
    clkdiv U1(.clk(mclk), .clr(clr), .clk190(clk190), .clk25m(clk25), .clk3(clk3) );
    debounce4 U2(.inp(btn), .cclk(clk190), .clr(clr), .outp(btnd) );
    hex7seg U5(.x(x), .cclk(clk190), .clr(clr), .a_to_g(a_to_g), .an(an), .dp(dp));
endmodule
