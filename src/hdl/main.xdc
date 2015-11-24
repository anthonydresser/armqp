
# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports clk]

# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports reset]



# ----------------------------------------------------------------------------
# JA Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports reset_out]
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports href]
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports siod]  
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports pwdn] 
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports xclk]
set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS33} [get_ports vsync]
set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS33}  [get_ports sioc]
set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS33}  [get_ports pclk]  
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pclk];

# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports {vdin[0]}]
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports {vdin[2]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {vdin[4]}]
set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS33} [get_ports {vdin[6]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {vdin[1]}]
set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33} [get_ports {vdin[3]}]
set_property -dict {PACKAGE_PIN V9 IOSTANDARD LVCMOS33} [get_ports {vdin[5]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {vdin[7]}]

# ----------------------------------------------------------------------------
# JC Pmod - Bank 13
# ---------------------------------------------------------------------------- 
set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[1]}];  # "JC1_N"
set_property -dict {PACKAGE_PIN AB7 IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[0]}];  # "JC1_P"
set_property -dict {PACKAGE_PIN AA4 IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[3]}];  # "JC2_N"
set_property -dict {PACKAGE_PIN Y4  IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[2]}];  # "JC2_P"
set_property -dict {PACKAGE_PIN T6  IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[5]}];  # "JC3_N"
set_property -dict {PACKAGE_PIN R6  IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[4]}];  # "JC3_P"
set_property -dict {PACKAGE_PIN U4  IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[7]}];  # "JC4_N"
set_property -dict {PACKAGE_PIN T4  IOSTANDARD LVCMOS33} [get_ports {PMOD_Debug[6]}];  # "JC4_P"

# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ----------------------------------------------------------------------------
set_property -dict { PACKAGE_PIN T22   IOSTANDARD LVCMOS25 } [get_ports { LED[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN T21   IOSTANDARD LVCMOS25 } [get_ports { LED[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS25 } [get_ports { LED[2] }]; #IO_L17N_T2_A25_15 Sch=led[2]
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS25 } [get_ports { LED[3] }]; #IO_L8P_T1_D11_14 Sch=led[3]
set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS25 } [get_ports { LED[4] }]; #IO_L7P_T1_D09_14 Sch=led[4]
set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS25 } [get_ports { LED[5] }]; #IO_L18N_T2_A11_D27_14 Sch=led[5]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS25 } [get_ports { LED[6] }]; #IO_L17P_T2_A14_D30_14 Sch=led[6]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS25 } [get_ports { LED[7] }]; #IO_L18P_T2_A12_D28_14 Sch=led[7]


#
# ZedBoard HDMI I2C Controller
#

set_property PACKAGE_PIN AA18 [get_ports zed_hdmi_iic_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports zed_hdmi_iic_scl_io]
set_property SLEW SLOW [get_ports zed_hdmi_iic_scl_io]
set_property DRIVE 8 [get_ports zed_hdmi_iic_scl_io]

set_property PACKAGE_PIN Y16 [get_ports zed_hdmi_iic_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports zed_hdmi_iic_sda_io]
set_property SLEW SLOW [get_ports zed_hdmi_iic_sda_io]
set_property DRIVE 8 [get_ports zed_hdmi_iic_sda_io]

#
# ZedBoard HDMI Output
#

set_property PACKAGE_PIN W18 [get_ports hdmio_io_clk]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_clk]

set_property PACKAGE_PIN W17 [get_ports hdmio_io_vsync]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_vsync]

set_property PACKAGE_PIN V17 [get_ports hdmio_io_hsync]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_hsync]

set_property PACKAGE_PIN U16 [get_ports hdmio_io_de]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_de]

set_property PACKAGE_PIN Y13 [get_ports {hdmio_io_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[0]}]

set_property PACKAGE_PIN AA13 [get_ports {hdmio_io_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[1]}]

set_property PACKAGE_PIN AA14 [get_ports {hdmio_io_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[2]}]

set_property PACKAGE_PIN Y14 [get_ports {hdmio_io_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[3]}]

set_property PACKAGE_PIN AB15 [get_ports {hdmio_io_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[4]}]

set_property PACKAGE_PIN AB16 [get_ports {hdmio_io_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[5]}]

set_property PACKAGE_PIN AA16 [get_ports {hdmio_io_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[6]}]

set_property PACKAGE_PIN AB17 [get_ports {hdmio_io_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[7]}]

set_property PACKAGE_PIN AA17 [get_ports {hdmio_io_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[8]}]

set_property PACKAGE_PIN Y15 [get_ports {hdmio_io_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[9]}]

set_property PACKAGE_PIN W13 [get_ports {hdmio_io_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[10]}]

set_property PACKAGE_PIN W15 [get_ports {hdmio_io_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[11]}]

set_property PACKAGE_PIN V15 [get_ports {hdmio_io_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[12]}]

set_property PACKAGE_PIN U17 [get_ports {hdmio_io_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[13]}]

set_property PACKAGE_PIN V14 [get_ports {hdmio_io_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[14]}]

set_property PACKAGE_PIN V13 [get_ports {hdmio_io_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[15]}]

set_property PACKAGE_PIN U15 [get_ports hdmio_io_spdif]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_spdif]


##################
# Primary Clocks #
##################

# The following constraints are already created by the "ZYNQ7 Processing System" core
#create_clock -period 12.999 -name clk_fpga_0 [get_nets -hierarchical FCLK_CLK0]
#create_clock -period  7.000 -name clk_fpga_1 [get_nets -hierarchical FCLK_CLK1]
#create_clock -period 10.000 -name clk_fpga_2 [get_nets -hierarchical FCLK_CLK2]

####################
# Generated Clocks #
####################

# Rename auto-generated clocks from MMCM
create_generated_clock -name hdmio_clk [get_pins wrapper/design_1_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]
create_clock -name cam_clk -period 41.6667 [get_ports pclk];

################
# Clock Groups #
################

set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks clk_fpga_1] -group [get_clocks hdmio_clk] -group [get_clocks clk_50M_clk_wiz_0]
#set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks clk_fpga_1] -group {hdmio_clk} -group [get_clocks clk_50M_clk_wiz_0]


