transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+four_bit_Adder  -L xil_defaultlib -L xlconstant_v1_1_10 -L xlconcat_v2_1_7 -L xlslice_v1_0_5 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.four_bit_Adder xil_defaultlib.glbl

do {four_bit_Adder.udo}

run 1000ns

endsim

quit -force
