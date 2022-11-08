// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon Oct 17 14:48:04 2022
// Host        : RICOLAPTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/erikp/Desktop/Egyetem/3_Felev/Ujrakonfiguralhato
//               Aramkorok/Projektek/Microblaze_proci/Microblaze_proci.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_stub.v}
// Design      : microblaze_mcs_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_fc5c_0,Vivado 2020.1" *)
module microblaze_mcs_0(Clk, Reset, UART_rxd, UART_txd, GPIO1_tri_i, 
  GPIO1_tri_o)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,UART_rxd,UART_txd,GPIO1_tri_i[7:0],GPIO1_tri_o[7:0]" */;
  input Clk;
  input Reset;
  input UART_rxd;
  output UART_txd;
  input [7:0]GPIO1_tri_i;
  output [7:0]GPIO1_tri_o;
endmodule
