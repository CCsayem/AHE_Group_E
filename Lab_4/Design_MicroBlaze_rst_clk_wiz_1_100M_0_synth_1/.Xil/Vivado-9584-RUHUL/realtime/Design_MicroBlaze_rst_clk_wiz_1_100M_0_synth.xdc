set_property SRC_FILE_INFO {cfile:{f:/Advance Hardware Eng/Lab_4/Design_MicroBlaze/ip/Design_MicroBlaze_rst_clk_wiz_1_100M_0/Design_MicroBlaze_rst_clk_wiz_1_100M_0_ooc.xdc} rfile:../../../../Design_MicroBlaze/ip/Design_MicroBlaze_rst_clk_wiz_1_100M_0/Design_MicroBlaze_rst_clk_wiz_1_100M_0_ooc.xdc id:1 order:EARLY scoped_inst:U0} [current_design]
set_property SRC_FILE_INFO {cfile:{F:/Advance Hardware Eng/Lab_4/Design_MicroBlaze_rst_clk_wiz_1_100M_0_synth_1/dont_touch.xdc} rfile:../../../dont_touch.xdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl rfile:D:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl id:3 order:LATE scoped_inst:U0/EXT_LPF/ACTIVE_LOW_AUX.ACT_LO_AUX unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl rfile:D:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl id:4 order:LATE scoped_inst:U0/EXT_LPF/ACTIVE_LOW_EXT.ACT_LO_EXT unmanaged:yes} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:55 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
create_clock -period 10.000 -name slowest_sync_clk [get_ports slowest_sync_clk]
set_property src_info {type:XDC file:2 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property KEEP_HIERARCHY SOFT [get_cells U0]
current_instance U0/EXT_LPF/ACTIVE_LOW_AUX.ACT_LO_AUX
set_property src_info {type:SCOPED_XDC file:3 line:5 export:INPUT save:NONE read:READ} [current_design]
set_false_path -to [get_cells {syncstages_ff_reg[0]}]
current_instance
current_instance U0/EXT_LPF/ACTIVE_LOW_EXT.ACT_LO_EXT
set_property src_info {type:SCOPED_XDC file:4 line:5 export:INPUT save:NONE read:READ} [current_design]
set_false_path -to [get_cells {syncstages_ff_reg[0]}]
current_instance
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property KEEP_HIERARCHY SOFT [get_cells U0/EXT_LPF/ACTIVE_LOW_AUX.ACT_LO_AUX]
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property KEEP_HIERARCHY SOFT [get_cells U0/EXT_LPF/ACTIVE_LOW_EXT.ACT_LO_EXT]
