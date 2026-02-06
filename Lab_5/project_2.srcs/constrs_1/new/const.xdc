# Example for a Pmod port JA (Check your board's master XDC)

set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_txd }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_rxd }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
# Pin 1 = SCL, Pin 2 = SDA

# Mapping SCL (Channel 1)
set_property PACKAGE_PIN C17 [get_ports {tmp3_scl_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tmp3_scl_tri_io[0]}]
set_property PULLUP true [get_ports {tmp3_scl_tri_io[0]}]

# Mapping SDA (Channel 2)
set_property PACKAGE_PIN D18 [get_ports {tmp3_sda_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tmp3_sda_tri_io[0]}]
set_property PULLUP true [get_ports {tmp3_sda_tri_io[0]}]