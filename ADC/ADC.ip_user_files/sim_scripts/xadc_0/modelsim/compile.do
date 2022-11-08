vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr \
"../../../../ADC.srcs/sources_1/ip/xadc_0/xadc_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

