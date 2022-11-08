`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2019 11:01:53
// Design Name: 
// Module Name: pwmsim
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


module pwmsim();
    reg clk;
    reg [7:0] duty = 8'd97;
    wire led;
    
    pwm U1(.clk(clk),.rst(0),.duty(duty),.led(led));
    
    initial begin
        clk <= 0;
    end
    
    always #5 clk <= ~clk;
endmodule
