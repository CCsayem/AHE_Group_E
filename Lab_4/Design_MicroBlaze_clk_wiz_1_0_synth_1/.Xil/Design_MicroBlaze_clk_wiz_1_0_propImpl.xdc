set_property SRC_FILE_INFO {cfile:{f:/Advance Hardware Eng/Lab_4/Design_MicroBlaze/ip/Design_MicroBlaze_clk_wiz_1_0/Design_MicroBlaze_clk_wiz_1_0.xdc} rfile:../../Design_MicroBlaze/ip/Design_MicroBlaze_clk_wiz_1_0/Design_MicroBlaze_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.100
