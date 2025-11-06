vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xlconstant_v1_1_10
vlib questa_lib/msim/xlconcat_v2_1_7
vlib questa_lib/msim/xlslice_v1_0_5

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_10 questa_lib/msim/xlconstant_v1_1_10
vmap xlconcat_v2_1_7 questa_lib/msim/xlconcat_v2_1_7
vmap xlslice_v1_0_5 questa_lib/msim/xlslice_v1_0_5

vcom -work xil_defaultlib  -93  \
"../../../bd/four_bit_Adder/ipshared/23f7/1_bit_Full_Adder.srcs/sources_1/new/Full_adder.vhd" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_0/sim/four_bit_Adder_Full_adder_0_0.vhd" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_1/sim/four_bit_Adder_Full_adder_0_1.vhd" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_2/sim/four_bit_Adder_Full_adder_0_2.vhd" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_3/sim/four_bit_Adder_Full_adder_0_3.vhd" \

vlog -work xlconstant_v1_1_10  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../../4_Bit_Adder.gen/sources_1/bd/four_bit_Adder/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlconstant_0_0/sim/four_bit_Adder_xlconstant_0_0.v" \

vlog -work xlconcat_v2_1_7  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../../4_Bit_Adder.gen/sources_1/bd/four_bit_Adder/ipshared/9c1a/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlconcat_0_0/sim/four_bit_Adder_xlconcat_0_0.v" \
"../../../bd/four_bit_Adder/sim/four_bit_Adder.v" \

vlog -work xlslice_v1_0_5  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../../4_Bit_Adder.gen/sources_1/bd/four_bit_Adder/ipshared/6792/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_2/sim/four_bit_Adder_xlslice_0_2.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_3/sim/four_bit_Adder_xlslice_0_3.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_4/sim/four_bit_Adder_xlslice_0_4.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_5/sim/four_bit_Adder_xlslice_0_5.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_6/sim/four_bit_Adder_xlslice_0_6.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_7/sim/four_bit_Adder_xlslice_0_7.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_8/sim/four_bit_Adder_xlslice_0_8.v" \
"../../../bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_9/sim/four_bit_Adder_xlslice_0_9.v" \

vlog -work xil_defaultlib \
"glbl.v"

