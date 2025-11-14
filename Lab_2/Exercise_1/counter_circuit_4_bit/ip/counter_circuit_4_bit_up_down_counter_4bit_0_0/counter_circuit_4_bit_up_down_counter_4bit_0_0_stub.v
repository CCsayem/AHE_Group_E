// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 14 15:38:13 2025
// Host        : RUHUL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/AHE_Final_Labs/Lab_2/Exercise_1/counter_circuit_4_bit/ip/counter_circuit_4_bit_up_down_counter_4bit_0_0/counter_circuit_4_bit_up_down_counter_4bit_0_0_stub.v
// Design      : counter_circuit_4_bit_up_down_counter_4bit_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "counter_circuit_4_bit_up_down_counter_4bit_0_0,up_down_counter_4bit,{}" *) (* core_generation_info = "counter_circuit_4_bit_up_down_counter_4bit_0_0,up_down_counter_4bit,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=up_down_counter_4bit,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "package_project" *) (* x_core_info = "up_down_counter_4bit,Vivado 2025.1" *) 
module counter_circuit_4_bit_up_down_counter_4bit_0_0(clk, rst, en, up_down, q_out)
/* synthesis syn_black_box black_box_pad_pin="rst,en,up_down,q_out[3:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK, xilinx.com:signal:clock:1.0 clk_in CLK" *) (* x_interface_mode = "slave clk_in" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0, XIL_INTERFACENAME clk_in, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN counter_circuit_4_bit_clk, ASSOCIATED_RESET rst, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST, xilinx.com:signal:reset:1.0 rst_in RST" *) (* x_interface_mode = "slave rst_in" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0, XIL_INTERFACENAME rst_in, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input en;
  input up_down;
  output [3:0]q_out;
endmodule
