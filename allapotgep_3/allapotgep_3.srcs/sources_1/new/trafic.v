`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 21:36:50
// Design Name: 
// Module Name: trafic
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


module trafic(
        input wire clk,
        input wire clr,
        input wire enled,
        output reg [5:0] lights
    );
    
    reg [2:0] state;
    reg [3:0] count;
    
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S2_5 = 3'b011,  S3 = 3'b100, S4 = 3'b101, S5 = 3'b110, S5_5 = 3'b111;
    parameter SEC5 = 4'b1111, SEC1 = 4'b0011;
    
    always @(posedge clk or posedge clr)
    begin
        if(clr == 1)
            begin
                state <= S0;
                count <= 0;
            end
        else case(state)
            S0: if(count < SEC5) begin
                    state <= S0;
                    count <= count + 1;
                 end
                 else begin
                    state <= S1;
                    count <= 0;
                 end
                 
            S1: if(count < SEC1) begin
                    state <= S1;
                    count <= count + 1;
                 end
                 else begin
                    state <= S2;
                    count <= 0;
                 end
            S2: if(count < SEC1) begin
                    state <= S2;
                    count <= count + 1;
                 end
                 else begin
                    state <= S2_5;
                    count <= 0;
                 end
            S2_5: if(count < SEC1) begin
                    state <= S2_5;
                    count <= count + 1;
                 end
                 else begin
                    state <= S3;
                    count <= 0;
                 end
            S3: if(count < SEC5) begin
                    state <= S3;
                    count <= count + 1;
                 end
                 else begin
                    state <= S4;
                    count <= 0;
                 end
            S4: if(count < SEC1) begin
                    state <= S4;
                    count <= count + 1;
                 end
                 else begin
                    state <= S5;
                    count <= 0;
                 end
            S5: if(count < SEC1) begin
                    state <= S5;
                    count <= count + 1;
                 end
                 else begin
                    state <= S5_5;
                    count <= 0;
                 end
            S5_5: if(count < SEC1) begin
                    state <= S5_5;
                    count <= count + 1;
                 end
                 else begin
                    state <= S0;
                    count <= 0;
                 end
            default: state <= S0;
         endcase
       end
       
 always@(*)
 begin
    case(state)
        S0: lights = 6'b100_010; //RGB_RGB
        S1: lights = 6'b100_110;
        S2: lights = 6'b100_100;
        S2_5: lights = 6'b110_100;
        S3: lights = 6'b010_100;
        S4: lights = 6'b110_100;
        S5: lights = 6'b100_100;
        S5_5: lights = 6'b100_110;
        default: lights = 6'b100_010;
    endcase
 end
 
endmodule
