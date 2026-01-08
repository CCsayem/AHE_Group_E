## Pmod Header JC
## Sch name = JC1
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin1_io }]; 
## Sch name = JC2
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin2_io }]; 
## Sch name = JC3
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin3_io }]; 
## Sch name = JC4
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin4_io }]; 
## Sch name = JC7
set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin7_io }]; 
## Sch name = JC8
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin8_io }]; 
## Sch name = JC9
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin9_io }]; 
## Sch name = JC10
set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { Pmod_out_0_pin10_io }];
## Clock Signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_in1_0 }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_in1_0 }];