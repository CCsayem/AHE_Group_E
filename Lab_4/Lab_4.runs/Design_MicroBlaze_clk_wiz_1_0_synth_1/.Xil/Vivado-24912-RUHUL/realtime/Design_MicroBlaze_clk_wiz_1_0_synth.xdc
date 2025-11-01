set_property SRC_FILE_INFO {cfile:{f:/Advance Hardware Eng/Lab_4/Design_MicroBlaze/ip/Design_MicroBlaze_clk_wiz_1_0/Design_MicroBlaze_clk_wiz_1_0.xdc} rfile:../../../../../Design_MicroBlaze/ip/Design_MicroBlaze_clk_wiz_1_0/Design_MicroBlaze_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property SRC_FILE_INFO {cfile:{F:/Advance Hardware Eng/Lab_4/Lab_4.runs/Design_MicroBlaze_clk_wiz_1_0_synth_1/dont_touch.xdc} rfile:../../../dont_touch.xdc id:2} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 -name clk_in1_p [get_ports clk_in1_p]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PHASESHIFT_MODE WAVEFORM [get_cells mmcm_adv_inst]
current_instance
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clkfbout_Design_MicroBlaze_clk_wiz_1_0 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -multiply_by 1 -add -master_clock [get_clocks clk_in1_p] [get_pins inst/mmcm_adv_inst/CLKFBOUT]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out1_Design_MicroBlaze_clk_wiz_1_0 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -multiply_by 1 -add -master_clock [get_clocks clk_in1_p] [get_pins inst/mmcm_adv_inst/CLKOUT0]
set_property src_info {type:XDC file:2 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property KEEP_HIERARCHY SOFT [get_cells inst]
