// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 14 15:38:13 2025
// Host        : RUHUL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ counter_circuit_4_bit_up_down_counter_4bit_0_0_sim_netlist.v
// Design      : counter_circuit_4_bit_up_down_counter_4bit_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "counter_circuit_4_bit_up_down_counter_4bit_0_0,up_down_counter_4bit,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "up_down_counter_4bit,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    rst,
    en,
    up_down,
    q_out);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK, xilinx.com:signal:clock:1.0 clk_in CLK" *) (* x_interface_mode = "slave clk_in" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0, XIL_INTERFACENAME clk_in, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN counter_circuit_4_bit_clk, ASSOCIATED_RESET rst, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST, xilinx.com:signal:reset:1.0 rst_in RST" *) (* x_interface_mode = "slave rst_in" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0, XIL_INTERFACENAME rst_in, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input en;
  input up_down;
  output [3:0]q_out;

  wire clk;
  wire en;
  wire [3:0]q_out;
  wire rst;
  wire up_down;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_up_down_counter_4bit U0
       (.clk(clk),
        .en(en),
        .out(q_out),
        .rst(rst),
        .up_down(up_down));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_up_down_counter_4bit
   (out,
    up_down,
    rst,
    en,
    clk);
  output [3:0]out;
  input up_down;
  input rst;
  input en;
  input clk;

  wire clk;
  wire \count_reg[0]_i_1_n_0 ;
  wire \count_reg[1]_i_1_n_0 ;
  wire \count_reg[2]_i_1_n_0 ;
  wire \count_reg[3]_i_1_n_0 ;
  wire en;
  wire [3:0]out;
  wire rst;
  wire up_down;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count_reg[0]_i_1 
       (.I0(out[0]),
        .O(\count_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \count_reg[1]_i_1 
       (.I0(out[0]),
        .I1(up_down),
        .I2(out[1]),
        .O(\count_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \count_reg[2]_i_1 
       (.I0(out[0]),
        .I1(up_down),
        .I2(out[2]),
        .I3(out[1]),
        .O(\count_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \count_reg[3]_i_1 
       (.I0(up_down),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[2]),
        .O(\count_reg[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg_reg[0] 
       (.C(clk),
        .CE(en),
        .D(\count_reg[0]_i_1_n_0 ),
        .Q(out[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg_reg[1] 
       (.C(clk),
        .CE(en),
        .D(\count_reg[1]_i_1_n_0 ),
        .Q(out[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg_reg[2] 
       (.C(clk),
        .CE(en),
        .D(\count_reg[2]_i_1_n_0 ),
        .Q(out[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg_reg[3] 
       (.C(clk),
        .CE(en),
        .D(\count_reg[3]_i_1_n_0 ),
        .Q(out[3]),
        .R(rst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
