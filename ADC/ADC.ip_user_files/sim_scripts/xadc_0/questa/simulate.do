onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib xadc_0_opt

do {wave.do}

view wave
view structure
view signals

do {xadc_0.udo}

run -all

quit -force