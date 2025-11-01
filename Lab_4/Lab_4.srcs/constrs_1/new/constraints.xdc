##################################################################################
## Master XDC Constraints File - CORRECTED for [DRC NSTD-1]
##################################################################################

##################################################################################
## 1. System Clock (Differential)
##################################################################################

# Define the clock period (e.g., 10.000 ns for a 100 MHz clock)
create_clock -period 10.000 [get_ports diff_clock_rtl_0_clk_p]

# Assign the pin locations for the P and N sides
set_property PACKAGE_PIN E3 [get_ports diff_clock_rtl_0_clk_p]
set_property PACKAGE_PIN D3 [get_ports diff_clock_rtl_0_clk_n]

# FIX for [DRC NSTD-1]: Specify the I/O standard on the P-side port.
# The standard for the N-side will be inferred automatically.
# Use TMDS_33 for 3.3V banks, or LVDS_25 for 2.5V banks.
set_property IOSTANDARD TMDS_33 [get_ports diff_clock_rtl_0_clk_p]


##################################################################################
## 2. CPU Reset Button and UART
##################################################################################
set_property PACKAGE_PIN C12 [get_ports reset_rtl_0]
set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl_0]

set_property PACKAGE_PIN C4 [get_ports uart_rtl_0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_rxd]

set_property PACKAGE_PIN D4 [get_ports uart_rtl_0_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_txd]