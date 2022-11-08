// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon Oct  3 14:59:51 2022
// Host        : RICOLAPTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/erikp/Desktop/Egyetem/3_Felev/Ujrakonfiguralhato
//               Aramkorok/Projektek/VGA_BOUNCE/VGA_BOUNCE.srcs/sources_1/ip/loons240x160/loons240x160_stub.v}
// Design      : loons240x160
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.1" *)
module loons240x160(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[15:0],douta[11:0]" */;
  input clka;
  input [15:0]addra;
  output [11:0]douta;
endmodule
