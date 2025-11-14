//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Fri Nov 14 15:37:37 2025
//Host        : RUHUL running 64-bit major release  (build 9200)
//Command     : generate_target counter_circuit_4_bit_wrapper.bd
//Design      : counter_circuit_4_bit_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module counter_circuit_4_bit_wrapper
   (clk,
    en,
    q_out,
    rst,
    up_down);
  input clk;
  input en;
  output [3:0]q_out;
  input rst;
  input up_down;

  wire clk;
  wire en;
  wire [3:0]q_out;
  wire rst;
  wire up_down;

  counter_circuit_4_bit counter_circuit_4_bit_i
       (.clk(clk),
        .en(en),
        .q_out(q_out),
        .rst(rst),
        .up_down(up_down));
endmodule
