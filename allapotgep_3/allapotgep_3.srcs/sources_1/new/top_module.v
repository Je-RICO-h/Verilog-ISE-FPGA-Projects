`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 21:53:45
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
    input wire CLK100MHZ,
    input wire BTNC,
    input wire [7:0] SW,
    output wire [5:0] LED
    );
    
    wire clk3;
    wire enled;
    wire [5:0] light;
    
    clkdiv U1 (.clk(CLK100MHZ), .clr(BTNC), .clk3(clk3));
    pvm U3 (.clk(CLK100MHZ), .rst(BTNC), .duty(SW), .led(enled));
    trafic U2 (.clk(clk3), .enled(enled), .clr(BTNC), .lights(light));
    
    assign LED = light & {enled, enled, enled, enled, enled, enled};
endmodule
