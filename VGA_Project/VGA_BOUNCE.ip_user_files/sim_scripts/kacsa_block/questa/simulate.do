onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib kacsa_block_opt

do {wave.do}

view wave
view structure
view signals

do {kacsa_block.udo}

run -all

quit -force
