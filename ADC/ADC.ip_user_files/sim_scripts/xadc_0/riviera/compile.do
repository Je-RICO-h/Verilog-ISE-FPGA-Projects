vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../ADC.srcs/sources_1/ip/xadc_0/xadc_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

