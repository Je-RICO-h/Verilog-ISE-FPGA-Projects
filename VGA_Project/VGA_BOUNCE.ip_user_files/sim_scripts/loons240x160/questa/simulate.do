onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib loons240x160_opt

do {wave.do}

view wave
view structure
view signals

do {loons240x160.udo}

run -all

quit -force
