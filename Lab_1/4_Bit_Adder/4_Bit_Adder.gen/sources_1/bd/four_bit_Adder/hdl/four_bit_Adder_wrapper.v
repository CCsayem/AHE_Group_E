//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Nov  6 20:40:52 2025
//Host        : DESKTOP-R4L9U27 running 64-bit major release  (build 9200)
//Command     : generate_target four_bit_Adder_wrapper.bd
//Design      : four_bit_Adder_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module four_bit_Adder_wrapper
   (Ax,
    Bx,
    dout_0);
  input [3:0]Ax;
  input [3:0]Bx;
  output [4:0]dout_0;

  wire [3:0]Ax;
  wire [3:0]Bx;
  wire [4:0]dout_0;

  four_bit_Adder four_bit_Adder_i
       (.Ax(Ax),
        .Bx(Bx),
        .dout_0(dout_0));
endmodule
