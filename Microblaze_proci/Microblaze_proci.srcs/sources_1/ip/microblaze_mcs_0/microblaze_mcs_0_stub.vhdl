-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Mon Oct 17 14:48:04 2022
-- Host        : RICOLAPTOP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/erikp/Desktop/Egyetem/3_Felev/Ujrakonfiguralhato
--               Aramkorok/Projektek/Microblaze_proci/Microblaze_proci.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_stub.vhdl}
-- Design      : microblaze_mcs_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity microblaze_mcs_0 is
  Port ( 
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UART_rxd : in STD_LOGIC;
    UART_txd : out STD_LOGIC;
    GPIO1_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    GPIO1_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end microblaze_mcs_0;

architecture stub of microblaze_mcs_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Clk,Reset,UART_rxd,UART_txd,GPIO1_tri_i[7:0],GPIO1_tri_o[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bd_fc5c_0,Vivado 2020.1";
begin
end;
