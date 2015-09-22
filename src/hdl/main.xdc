
# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ---------------------------------------------------------------------------- 
set_property -dict { PACKAGE_PIN Y9 IOSTANDARD LVCMOS33 } [get_ports {clk}];  

# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ---------------------------------------------------------------------------- 
set_property -dict { PACKAGE_PIN P16 IOSTANDARD LVCMOS33 } [get_ports {reset}];  #BTNC

# ----------------------------------------------------------------------------
# JA Pmod - Bank 13
# ---------------------------------------------------------------------------- 
set_property -dict { PACKAGE_PIN Y11 IOSTANDARD LVCMOS33 } [get_ports {clk_24M}];  # "JA1"
#set_property PACKAGE_PIN AA8  [get_ports {JA10}];  # "JA10"
set_property -dict { PACKAGE_PIN AA11 IOSTANDARD LVCMOS33 } [get_ports {vsync}];  # "JA2"
#set_property { PACKAGE_PIN Y10 IOSTANDARD LVCMOS33 } [get_ports {JA3}];  # "JA3"
set_property -dict { PACKAGE_PIN AA9 IOSTANDARD LVCMOS33 } [get_ports {pclk}];  # "JA4"
#set_property PACKAGE_PIN AB11 [get_ports {JA7}];  # "JA7"
set_property -dict { PACKAGE_PIN AB10 IOSTANDARD LVCMOS33 } [get_ports {href}];  # "JA8"
#set_property PACKAGE_PIN AB9  [get_ports {JA9}];  # "JA9"


# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ---------------------------------------------------------------------------- 
set_property -dict { PACKAGE_PIN W12 IOSTANDARD LVCMOS33 } [get_ports {vdin[1]}];  # "JB1"
set_property -dict { PACKAGE_PIN V8 IOSTANDARD LVCMOS33 } [get_ports {vdin[6]}];  # "JB10"
set_property -dict { PACKAGE_PIN W11 IOSTANDARD LVCMOS33 } [get_ports {vdin[3]}];  # "JB2"
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports {vdin[5]}];  # "JB3"
set_property -dict { PACKAGE_PIN W8 IOSTANDARD LVCMOS33 } [get_ports {vdin[7]}];  # "JB4"
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports {vdin[0]}];  # "JB7"
set_property -dict { PACKAGE_PIN W10 IOSTANDARD LVCMOS33 } [get_ports {vdin[2]}];  # "JB8"
set_property -dict { PACKAGE_PIN V9 IOSTANDARD LVCMOS33 } [get_ports {vdin[4]}];  # "JB9"


# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ---------------------------------------------------------------------------- 
set_property -dict { PACKAGE_PIN T22   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN T21   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; #IO_L17N_T2_A25_15 Sch=led[2]
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; #IO_L8P_T1_D11_14 Sch=led[3]
set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; #IO_L7P_T1_D09_14 Sch=led[4]
set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]; #IO_L18N_T2_A11_D27_14 Sch=led[5]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]; #IO_L17P_T2_A14_D30_14 Sch=led[6]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]; #IO_L18P_T2_A12_D28_14 Sch=led[7]