onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xlconstant_v1_1_10 -L xlconcat_v2_1_7 -L xlslice_v1_0_5 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.four_bit_Adder xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {four_bit_Adder.udo}

run 1000ns

quit -force
