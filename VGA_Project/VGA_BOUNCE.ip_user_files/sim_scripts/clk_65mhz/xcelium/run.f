-makelib xcelium_lib/xpm -sv \
  "D:/Software/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Software/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Software/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../VGA_BOUNCE.srcs/sources_1/ip/clk_65mhz/clk_65mhz_clk_wiz.v" \
  "../../../../VGA_BOUNCE.srcs/sources_1/ip/clk_65mhz/clk_65mhz.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

