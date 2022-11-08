`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2022 14:58:57
// Design Name: 
// Module Name: kacsa_bounce_top
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
module mux3tol(
    input [2:0] SW,
    input wire clk1,clk2,clk3,
    output reg y);
    always@(*)
        case(SW)
            3'b001 : y <= clk1;
            3'b010 : y <= clk2;
            3'b100 : y <= clk3; 
            default: y <= clk1;
        endcase
 endmodule
 
 module mux3tol_res(
    input [2:0] SW,
    output reg [10:0] C1max,R1max);
    always@(*)
        case(SW)
            3'b001 : begin 
                     C1max <= 11'd400;
                     R1max <= 11'd320; 
                     end
            3'b010 : begin 
                     C1max <= 11'd550;
                     R1max <= 11'd320; 
                     end
            3'b100 : begin 
                     C1max <= 11'd780;
                     R1max <= 11'd640; 
                     end
                     
            default: begin 
                     C1max <= 11'd400;
                     R1max <= 11'd320; 
                     end
        endcase
 endmodule
 
module mux3tol_hc_vc(
    input [2:0] SW,
    input [10:0] hc1,hc2,hc3,
    input [10:0] vc1,vc2,vc3,
    input vidon1,vidon2,vidon3,
    output reg vidon,
    output reg [10:0] hc,vc);
    always@(*)
        case(SW)
            3'b001 : begin 
                    hc <= hc1;
                    vc <= vc1;
                    vidon <= vidon1;
                     end
            3'b010 : begin 
                     hc <= hc2;
                     vc <= vc2;
                     vidon <= vidon2;
                     end
            3'b100 : begin 
                     hc <= hc3;
                     vc <= vc3; 
                     vidon <= vidon3;
                     end
                     
            default: begin 
                     hc <= hc1;
                     vc <= vc1; 
                     vidon <= vidon1;
                     end
        endcase
 endmodule
 
  module mux3tol_HS_VS(
    input [2:0] SW,
    input v1,v2,v3,h1,h2,h3,
    output reg VGA_HS, VGA_VS);
    always@(*)
        case(SW)
            3'b001 : begin 
                     VGA_HS <= h1;
                     VGA_VS <= v1; 
                     end
            3'b010 : begin 
                     VGA_HS <= h2;
                     VGA_VS <= v2; 
                     end
            3'b100 : begin 
                     VGA_HS <= h3;
                     VGA_VS <= v3; 
                     end
                     
            default: begin 
                     VGA_HS <= h1;
                     VGA_VS <= v1;  
                     end
        endcase
 endmodule

module kacsa_bounce_top(
        input wire CLK100MHZ,
        input wire BTNL, BTNC, SW,
        input wire SW1,SW2,SW3,
        output wire VGA_HS, VGA_VS,
        output wire [3:0] VGA_R, VGA_B, VGA_G
    );
    
    wire clk190, clk25,clk50, clk65, clr, clk_final;
    wire vidon, vidon1, vidon2, vidon3, gol;
    wire [9:0] C1, R1;
    wire [10:0] hc, vc;
    wire [10:0] hc1,vc1;
    wire [10:0] hc2,vc2;
    wire [10:0] hc3,vc3;
    wire [11:0] M;
    wire [15:0] rom_addr16;
    wire VGAV1,VGAV2,VGAV3;
    wire VGAH1,VGAH2,VGAH3;
    wire [10:0] C1maxf,R1maxf;
            
    assign clr = BTNC;
    
    clkdiv U1(.clk(CLK100MHZ), .clk50(clk50), .clr(clr), .clk25(clk25), .clk190(clk190));
    clk_65mhz U7(.clk_in1(CLK100MHZ), .reset(clr), .clk_out1(clk65));
    mux3tol U10(.SW({SW3,SW2,SW1}), .clk1(clk25), .clk2(clk50), .clk3(clk65), .y(clk_final));
    mux3tol_res U11(.SW({SW3,SW2,SW1}), .C1max(C1maxf), .R1max(R1maxf));
    mux3tol_hc_vc U12(.SW({SW3,SW2,SW1}), .hc(hc), .vc(vc), .hc1(hc1), .hc2(hc2), .hc3(hc3), .vc1(vc1), .vc2(vc2), .vc3(vc3),.vidon(vidon), .vidon1(vidon1), .vidon2(vidon2), .vidon3(vidon3));
    mux3tol_HS_VS U13(.SW({SW3,SW2,SW1}), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .v1(VGAV1), .v2(VGAV2), .v3(VGAV3), .h1(VGAH1), .h2(VGAH2), .h3(VGAH3));
    vga_1080x768 U8 (.clk(clk65), .clr(clr), .hsync(VGAH3), .vsync(VGAV3), .hc(hc3), .vc(vc3), .vidon(vidon3));
    vga_640x480 U2(.clk(clk25), .clr(clr), .hsync(VGAH1), .vsync(VGAV1), .hc(hc1), .vc(vc1), .vidon(vidon1));
    vga_800x600 U9(.clk(clk50), .clr(clr), .hsync(VGAH2), .vsync(VGAV2), .hc(hc2), .vc(vc2), .vidon(vidon2));
    vga_ScreenSaver U3(.vidon(vidon), .hc(hc), .vc(vc), .red(VGA_R), .green(VGA_G), .blue(VGA_B), .M(M), .C1(C1), .R1(R1), .rom_addr16(rom_addr16));
    kacsa_block U4 (.addra(rom_addr16), .clka(clk_final), .douta(M));
    clock_pulse U5 (.inp(BTNL), .clk(clk190), .clr(clr), .outp(gol));
    bounce U6 (.clk(clk190), .clr(clr), .SW(SW), .go(gol), .c1(C1), .r1(R1), .C1max(C1maxf), .R1max(R1maxf));
    
endmodule
