onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib four_bit_Adder_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {four_bit_Adder.udo}

run 1000ns

quit -force
