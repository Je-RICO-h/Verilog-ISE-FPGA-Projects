`timescale 1ns / 1ps


module bounce (
    input wire clk,
    input wire clr,
    input wire go,
    input wire SW,
    input [10:0] C1max, R1max,
    output wire [9:0] c1, r1
    );

    reg [9:0] clv, rlv, dcv, drv;
    reg calc;
    
    always @(posedge clk or posedge clr)
        begin
            if (clr == 1)
                begin
                    clv = 80;
                    rlv = 140;
                    if(SW == 0)
                        begin
                        dcv = 1;
                        drv = -1;
                        end
                     else
                        begin
                        dcv = 3;
                        drv = -3;
                        end
                    calc = 0;
                end
            else
                if (go == 1)
                    calc = 1;
                else
                    begin
                        if (calc == 1)
                            begin
                                clv = clv + dcv;
                                rlv = rlv + drv;
                                if((clv < 0) || (clv >= C1max))
                                    dcv = 0 - dcv;
                                if ((rlv < 0) || (rlv >= R1max))
                                    drv = 0 - drv;
                            end
                    end
         end
         
     assign c1 = clv;
     assign r1 = rlv;

endmodule
