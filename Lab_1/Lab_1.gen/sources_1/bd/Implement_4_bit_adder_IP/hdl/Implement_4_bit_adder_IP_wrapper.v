//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Nov  6 20:55:13 2025
//Host        : DESKTOP-R4L9U27 running 64-bit major release  (build 9200)
//Command     : generate_target Implement_4_bit_adder_IP_wrapper.bd
//Design      : Implement_4_bit_adder_IP_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Implement_4_bit_adder_IP_wrapper
   (Ax_0,
    Bx_0,
    dout_0_0);
  input [3:0]Ax_0;
  input [3:0]Bx_0;
  output [4:0]dout_0_0;

  wire [3:0]Ax_0;
  wire [3:0]Bx_0;
  wire [4:0]dout_0_0;

  Implement_4_bit_adder_IP Implement_4_bit_adder_IP_i
       (.Ax_0(Ax_0),
        .Bx_0(Bx_0),
        .dout_0_0(dout_0_0));
endmodule
