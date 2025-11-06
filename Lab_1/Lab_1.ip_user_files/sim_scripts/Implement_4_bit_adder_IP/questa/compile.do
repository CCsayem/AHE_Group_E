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

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/Implement_4_bit_adder_IP/sim/Implement_4_bit_adder_IP.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_0/1_bit_Full_Adder.srcs/sources_1/new/Full_adder.vhd" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_0/sim/four_bit_Adder_Full_adder_0_0.vhd" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_1/sim/four_bit_Adder_Full_adder_0_1.vhd" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_2/sim/four_bit_Adder_Full_adder_0_2.vhd" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_Full_adder_0_3/sim/four_bit_Adder_Full_adder_0_3.vhd" \

vlog -work xlconstant_v1_1_10  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../../Lab_1.gen/sources_1/bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlconstant_0_0/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlconstant_0_0/sim/four_bit_Adder_xlconstant_0_0.v" \

vlog -work xlconcat_v2_1_7  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../../Lab_1.gen/sources_1/bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlconcat_0_0/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlconcat_0_0/sim/four_bit_Adder_xlconcat_0_0.v" \

vlog -work xlslice_v1_0_5  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../../Lab_1.gen/sources_1/bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_2/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+D:/Vivado/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_2/sim/four_bit_Adder_xlslice_0_2.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_3/sim/four_bit_Adder_xlslice_0_3.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_4/sim/four_bit_Adder_xlslice_0_4.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_5/sim/four_bit_Adder_xlslice_0_5.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_6/sim/four_bit_Adder_xlslice_0_6.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_7/sim/four_bit_Adder_xlslice_0_7.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_8/sim/four_bit_Adder_xlslice_0_8.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/4_Bit_Adder.srcs/sources_1/bd/four_bit_Adder/ip/four_bit_Adder_xlslice_0_9/sim/four_bit_Adder_xlslice_0_9.v" \
"../../../bd/Implement_4_bit_adder_IP/ipshared/b041/4_Bit_Adder.gen/sources_1/bd/four_bit_Adder/sim/four_bit_Adder.v" \
"../../../bd/Implement_4_bit_adder_IP/ipshared/b041/4_Bit_Adder.gen/sources_1/bd/four_bit_Adder/hdl/four_bit_Adder_wrapper.v" \
"../../../bd/Implement_4_bit_adder_IP/ip/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1/sim/Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

