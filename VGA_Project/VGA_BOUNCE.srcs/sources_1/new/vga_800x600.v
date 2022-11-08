`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2022 15:27:04
// Design Name: 
// Module Name: vga_1080
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


`timescale 1ns / 1ps
// Example 35
// VGA - Csíkok


module vga_800x600(
    input wire clk,
    input wire clr,
    output reg hsync,
    output reg vsync,
    output reg [10:0] hc,
    output reg [10:0] vc,
    output reg vidon
    );
    
// Pixelek ÊrtÊke egy vízszintes vonalban = 800
    parameter hpixels = 11'b10000010000;
    
// Vízszintes vonalak szåma a kijelz�?ben = 521
    parameter hlines = 11'b01010011010;

// Back porch: kitÜlt�? ßres sorok a kÊperny�? el�?tt
// Front porch: kitÜlt�? ßres sorok a kÊperny�? utån    
// Horizontal back porch = 144 (128+16)
    parameter hbp = 11'b00010110000;
    
// Horizontal front porch = 784 (128+16+640)
    parameter hfp = 11'b01111010000;
    
// Vertical back porch = 31 (2+29)
    parameter vbp = 11'b00000011101;
    
// Vertical front porch = 511 (2+29+480)
    parameter vfp = 11'b01001110101;
    
// Fßgg�?leges szåmlåló engedÊlyezÊse
    reg vsenable;
    
// Vízszintes szinkronizåló jel szåmlålója
    always@(posedge clk or posedge clr)
        begin
            if (clr == 1)
                hc <= 0;
            else
                begin
                    if (hc == hpixels-1)
                        begin
                            // A szåmlåló elÊrte a pixelszåmot
                            hc <= 0;    // szåmlåló reset
                            vsenable <= 1;  // fßgg�?leges szåmlåló nÜvelÊsÊnek engedÊlyzÊse
                        end
                    else
                        begin
                            hc <= hc+1; // Vízszintes szåmlåló nÜvelÊse
                            vsenable <= 0;  // vsenable off
                        end
                end
        end
    
// hsync impulzus generålåsa
// Alacsony szintŹ 0-127 intervallumon
    always@(*)
        begin
            if (hc < 120)
                hsync = 0;
            else
                hsync = 1;
        end
        
// Fßgg�?leges szinkronizåló jel szåmlålója
    always@(posedge clk or posedge clr)
        begin
            if (clr == 1)
                vc <= 0;
            else
                if (vsenable == 1)
                    begin
                        if (vc == hlines-1)
                            // Reset, ha elÊrtßk a sorok szåmåt
                            vc <= 0;
                        else
                            // Fßgg�?leges szåmlåló nÜvelÊse
                            vc <= vc+1;
                    end
        end
        
// vsync impulzus generålåsa
// Alacsony szintŹ 0 Ês 1 ÊrtÊk esetÊn
    always@(*)
        begin
            if (vc < 6)
                vsync = 0;
            else
                vsync = 1;
        end
        
// Video out engedÊlyezÊse porch-okon belßl
    always@(*)
        begin
            if ((hc < hfp) && (hc >= hbp) && (vc < vfp) && (vc >= vbp))
                vidon = 1;
            else
                vidon = 0;
        end
        
    
endmodule
