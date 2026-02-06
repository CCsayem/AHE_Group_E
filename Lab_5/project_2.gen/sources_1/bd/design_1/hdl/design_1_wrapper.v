//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Wed Jan  7 14:26:35 2026
//Host        : DESKTOP-4J46HSN running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (UART_rxd,
    UART_txd,
    reset,
    sys_clock,
    tmp3_scl_tri_io,
    tmp3_sda_tri_io);
  input UART_rxd;
  output UART_txd;
  input reset;
  input sys_clock;
  inout [0:0]tmp3_scl_tri_io;
  inout [0:0]tmp3_sda_tri_io;

  wire UART_rxd;
  wire UART_txd;
  wire reset;
  wire sys_clock;
  wire [0:0]tmp3_scl_tri_i_0;
  wire [0:0]tmp3_scl_tri_io_0;
  wire [0:0]tmp3_scl_tri_o_0;
  wire [0:0]tmp3_scl_tri_t_0;
  wire [0:0]tmp3_sda_tri_i_0;
  wire [0:0]tmp3_sda_tri_io_0;
  wire [0:0]tmp3_sda_tri_o_0;
  wire [0:0]tmp3_sda_tri_t_0;

  design_1 design_1_i
       (.UART_rxd(UART_rxd),
        .UART_txd(UART_txd),
        .reset(reset),
        .sys_clock(sys_clock),
        .tmp3_scl_tri_i(tmp3_scl_tri_i_0),
        .tmp3_scl_tri_o(tmp3_scl_tri_o_0),
        .tmp3_scl_tri_t(tmp3_scl_tri_t_0),
        .tmp3_sda_tri_i(tmp3_sda_tri_i_0),
        .tmp3_sda_tri_o(tmp3_sda_tri_o_0),
        .tmp3_sda_tri_t(tmp3_sda_tri_t_0));
  IOBUF tmp3_scl_tri_iobuf_0
       (.I(tmp3_scl_tri_o_0),
        .IO(tmp3_scl_tri_io[0]),
        .O(tmp3_scl_tri_i_0),
        .T(tmp3_scl_tri_t_0));
  IOBUF tmp3_sda_tri_iobuf_0
       (.I(tmp3_sda_tri_o_0),
        .IO(tmp3_sda_tri_io[0]),
        .O(tmp3_sda_tri_i_0),
        .T(tmp3_sda_tri_t_0));
endmodule
