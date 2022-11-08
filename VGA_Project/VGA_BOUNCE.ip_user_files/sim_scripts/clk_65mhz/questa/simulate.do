onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib clk_65mhz_opt

do {wave.do}

view wave
view structure
view signals

do {clk_65mhz.udo}

run -all

quit -force
