-makelib xcelium_lib/xpm -sv \
  "D:/Software/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Software/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../VGA_BOUNCE.srcs/sources_1/ip/loons240x160/sim/loons240x160.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

