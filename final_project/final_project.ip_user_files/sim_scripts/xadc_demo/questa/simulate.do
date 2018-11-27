onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xadc_demo_opt

do {wave.do}

view wave
view structure
view signals

do {xadc_demo.udo}

run -all

quit -force
