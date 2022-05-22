`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:34 04/27/2022 
// Design Name: 
// Module Name:    EX30_top 
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
module EX30_top(
		input wire mclk,
		input wire [3:0] btn,
		input wire clrbtn,
		output wire [6:0] seg,
		output wire dp,
		output wire [7:0] an
    );
	 
wire [15:0] x;
wire [2:0] addr;
wire clk190;

clkdiv U1 (.clk(mclk),
		.clr(clrbtn),
		.clk190(clk190)
		);
		
hex7seg X2 (.x(x),
		.cclk(clk190),
		.clr(clrbtn),
		.a_to_g(seg),
		.an(an),
		.dp(dp)
);

brom8X16 U5(
	.addra(btn),
	.clka(mclk),
	.douta(x)
);

endmodule
