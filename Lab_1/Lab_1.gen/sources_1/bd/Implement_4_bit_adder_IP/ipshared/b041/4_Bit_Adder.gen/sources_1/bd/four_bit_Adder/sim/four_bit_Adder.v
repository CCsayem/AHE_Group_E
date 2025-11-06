//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Nov  6 20:40:52 2025
//Host        : DESKTOP-R4L9U27 running 64-bit major release  (build 9200)
//Command     : generate_target four_bit_Adder.bd
//Design      : four_bit_Adder
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "four_bit_Adder,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=four_bit_Adder,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=14,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "four_bit_Adder.hwdef" *) 
module four_bit_Adder
   (Ax,
    Bx,
    dout_0);
  input [3:0]Ax;
  input [3:0]Bx;
  output [4:0]dout_0;

  wire [3:0]Ax;
  wire [3:0]Bx;
  wire Full_adder_0_Cout;
  wire Full_adder_0_Sx;
  wire Full_adder_1_Cout;
  wire Full_adder_1_Sx;
  wire Full_adder_2_Cout;
  wire Full_adder_2_Sx;
  wire Full_adder_3_Cout;
  wire Full_adder_3_Sx;
  wire [4:0]dout_0;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [0:0]xlslice_3_Dout;
  wire [0:0]xlslice_4_Dout;
  wire [0:0]xlslice_5_Dout;
  wire [0:0]xlslice_6_Dout;
  wire [0:0]xlslice_7_Dout;

  four_bit_Adder_Full_adder_0_0 Full_adder_0
       (.Ax(xlslice_0_Dout),
        .Bx(xlslice_1_Dout),
        .Cin(xlconstant_0_dout),
        .Cout(Full_adder_0_Cout),
        .Sx(Full_adder_0_Sx));
  four_bit_Adder_Full_adder_0_1 Full_adder_1
       (.Ax(xlslice_2_Dout),
        .Bx(xlslice_3_Dout),
        .Cin(Full_adder_0_Cout),
        .Cout(Full_adder_1_Cout),
        .Sx(Full_adder_1_Sx));
  four_bit_Adder_Full_adder_0_2 Full_adder_2
       (.Ax(xlslice_4_Dout),
        .Bx(xlslice_5_Dout),
        .Cin(Full_adder_1_Cout),
        .Cout(Full_adder_2_Cout),
        .Sx(Full_adder_2_Sx));
  four_bit_Adder_Full_adder_0_3 Full_adder_3
       (.Ax(xlslice_6_Dout),
        .Bx(xlslice_7_Dout),
        .Cin(Full_adder_2_Cout),
        .Cout(Full_adder_3_Cout),
        .Sx(Full_adder_3_Sx));
  four_bit_Adder_xlconcat_0_0 xlconcat_0
       (.In0(Full_adder_0_Sx),
        .In1(Full_adder_1_Sx),
        .In2(Full_adder_2_Sx),
        .In3(Full_adder_3_Sx),
        .In4(Full_adder_3_Cout),
        .dout(dout_0));
  four_bit_Adder_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  four_bit_Adder_xlslice_0_2 xlslice_0
       (.Din(Ax),
        .Dout(xlslice_0_Dout));
  four_bit_Adder_xlslice_0_3 xlslice_1
       (.Din(Bx),
        .Dout(xlslice_1_Dout));
  four_bit_Adder_xlslice_0_4 xlslice_2
       (.Din(Ax),
        .Dout(xlslice_2_Dout));
  four_bit_Adder_xlslice_0_5 xlslice_3
       (.Din(Bx),
        .Dout(xlslice_3_Dout));
  four_bit_Adder_xlslice_0_6 xlslice_4
       (.Din(Ax),
        .Dout(xlslice_4_Dout));
  four_bit_Adder_xlslice_0_7 xlslice_5
       (.Din(Bx),
        .Dout(xlslice_5_Dout));
  four_bit_Adder_xlslice_0_8 xlslice_6
       (.Din(Ax),
        .Dout(xlslice_6_Dout));
  four_bit_Adder_xlslice_0_9 xlslice_7
       (.Din(Bx),
        .Dout(xlslice_7_Dout));
endmodule
