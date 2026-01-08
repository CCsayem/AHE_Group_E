## ------------------------------------------------------------------
## 1. System Clock (100 MHz on Pin E3)
## ------------------------------------------------------------------
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk_in1_0 }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_in1_0 }];

## ------------------------------------------------------------------
## 2. PMOD ESP32 on Port JC (Matches Block Design port 'jc_esp32')
## ------------------------------------------------------------------
set_property -dict { PACKAGE_PIN K1 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin1_io }];
set_property -dict { PACKAGE_PIN F6 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin2_io }];
set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin3_io }];
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin4_io }];
set_property -dict { PACKAGE_PIN E7 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin7_io }];
set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin8_io }];
set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin9_io }];
set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS33 } [get_ports { jc_esp32_pin10_io }];

## ------------------------------------------------------------------
## 3. PMOD OLED RGB on Port JB (Matches Block Design port 'jb_oled')
## ------------------------------------------------------------------
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin1_io }];
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin2_io }];
set_property -dict { PACKAGE_PIN G16 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin3_io }];
set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin4_io }];
set_property -dict { PACKAGE_PIN E16 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin7_io }];
set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin8_io }];
set_property -dict { PACKAGE_PIN G13 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin9_io }];
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { jb_oled_pin10_io }];

## ------------------------------------------------------------------
## 4. Reset Button (CPU_RESETN on Pin C12)
## ------------------------------------------------------------------
## The '#' was removed below because your design HAS a 'reset' port!
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports { reset }];