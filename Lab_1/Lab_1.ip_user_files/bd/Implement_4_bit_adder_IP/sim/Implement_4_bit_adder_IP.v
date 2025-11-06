//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Nov  6 20:55:13 2025
//Host        : DESKTOP-R4L9U27 running 64-bit major release  (build 9200)
//Command     : generate_target Implement_4_bit_adder_IP.bd
//Design      : Implement_4_bit_adder_IP
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Implement_4_bit_adder_IP,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Implement_4_bit_adder_IP,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "Implement_4_bit_adder_IP.hwdef" *) 
module Implement_4_bit_adder_IP
   (Ax_0,
    Bx_0,
    dout_0_0);
  input [3:0]Ax_0;
  input [3:0]Bx_0;
  output [4:0]dout_0_0;

  wire [3:0]Ax_0;
  wire [3:0]Bx_0;
  wire [4:0]dout_0_0;

  Implement_4_bit_adder_IP_four_bit_Adder_wrapp_0_1 four_bit_Adder_wrapp_0
       (.Ax(Ax_0),
        .Bx(Bx_0),
        .dout_0(dout_0_0));
endmodule
