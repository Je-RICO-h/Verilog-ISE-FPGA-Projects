`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:59 04/05/2022 
// Design Name: 
// Module Name:    count_sec 
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
module count_sec(
		input clk,
		input rst,
		input ce,
		input dir,
		output [3:0] q,
		output eq9
    );

reg [3:0] cntr_d0;
wire cntr_d0_eq0, cntr_d0_eq9;

always @(posedge clk)
	if (rst)
		cntr_d0 <= 0;
	else if (ce)
		if (dir)
			if(cntr_d0_eq9)
				cntr_d0 <= 0;
			else
				cntr_d0 <= cntr_d0 + 1;
		else
			if(cntr_d0_eq0)
				cntr_d0 <= 9;
			else
				cntr_d0 <= cntr_d0 - 1;

assign cntr_d0_eq0 = (cntr_d0 == 0);
assign cntr_d0_eq9 = (cntr_d0 == 9);

assign q = cntr_d0;
assign eq9 = cntr_d0_eq9;

endmodule
