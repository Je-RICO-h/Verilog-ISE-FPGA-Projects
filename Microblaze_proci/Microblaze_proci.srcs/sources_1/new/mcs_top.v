`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 14:38:59
// Design Name: 
// Module Name: mcs_top
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


module mcs_top(
    input CLK100MHZ,
    input rst,
    input rx,
    output tx,
    input[7:0] SW,
    output [7:0] LED
    );
    
    microblaze_mcs_0 U1 (.Clk(CLK100MHZ), .Reset(!rst), .UART_rxd(rx), .UART_txd(tx), .GPIO1_tri_i(SW), .GPIO1_tri_o(LED));
    
endmodule
