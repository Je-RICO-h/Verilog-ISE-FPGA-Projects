onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib microblaze_mcs_0_opt

do {wave.do}

view wave
view structure
view signals

do {microblaze_mcs_0.udo}

run -all

quit -force
