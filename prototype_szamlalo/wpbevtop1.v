`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:43 04/05/2022 
// Design Name: 
// Module Name:    wpbevtop1 
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
module wpbevtop1(
		input clk,btn0,sw0,
		output [3:0] q, output [6:0] segn, output [3:0] dign
    );

reg rst, dir;

always @(posedge clk)
begin
	rst <= btn0;
	dir <= sw0;
end

wire ce;

rategen rategenerator(
		.clk(clk),
		.rst(rst),
		.cy(ce)
		);

count_sec counter(
		.clk(clk),
		.rst(rst),
		.ce(ce),
		.dir(dir),
		.q(q)
		);

hex2seg segdecoder(
		.hex(q),
		.seg(segn)
		);
	assign dign = 4'b0000;

endmodule
