########################
# Physical Constraints #
########################

#
# Debug
#

#LEDS
set_property PACKAGE_PIN T22 [get_ports {LEDS[0]}];  # "LD0"
set_property PACKAGE_PIN T21 [get_ports {LEDS[1]}];  # "LD1"
set_property PACKAGE_PIN U22 [get_ports {LEDS[2]}];  # "LD2"
set_property PACKAGE_PIN U21 [get_ports {LEDS[3]}];  # "LD3"
set_property PACKAGE_PIN V22 [get_ports {LEDS[4]}];  # "LD4"
set_property PACKAGE_PIN W22 [get_ports {LEDS[5]}];  # "LD5"
set_property PACKAGE_PIN U19 [get_ports {LEDS[6]}];  # "LD6"
set_property PACKAGE_PIN U14 [get_ports {LEDS[7]}];  # "LD7"

#Buttons
set_property PACKAGE_PIN P16 [get_ports {Buts[0]}];  # "BTNC"
set_property PACKAGE_PIN R16 [get_ports {Buts[1]}];  # "BTND"
set_property PACKAGE_PIN N15 [get_ports {Buts[2]}];  # "BTNL"
set_property PACKAGE_PIN R18 [get_ports {Buts[3]}];  # "BTNR"
set_property PACKAGE_PIN T18 [get_ports {Buts[4]}];  # "BTNU"

#pmod
set_property PACKAGE_PIN W12 [get_ports {PMOD1[0]}];  # "JB1"
set_property PACKAGE_PIN W11 [get_ports {PMOD1[1]}];  # "JB2"
set_property PACKAGE_PIN V10 [get_ports {PMOD1[2]}];  # "JB3"
set_property PACKAGE_PIN W8  [get_ports {PMOD1[3]}];  # "JB4"
set_property PACKAGE_PIN V12  [get_ports {PMOD1[4]}];  # "JB7"
set_property PACKAGE_PIN W10  [get_ports {PMOD1[5]}];  # "JB8"
set_property PACKAGE_PIN V9  [get_ports {PMOD1[6]}];  # "JB9"
set_property PACKAGE_PIN V8  [get_ports {PMOD1[7]}];  # "JB10"

set_property PACKAGE_PIN Y11 [get_ports {PMOD2[0]}];  # "JA1"
set_property PACKAGE_PIN AA11 [get_ports {PMOD2[1]}];  # "JA2"
set_property PACKAGE_PIN Y10 [get_ports {PMOD2[2]}];  # "JA3"
set_property PACKAGE_PIN AA9  [get_ports {PMOD2[3]}];  # "JA4"
set_property PACKAGE_PIN AB11  [get_ports {PMOD2[4]}];  # "JA7"
set_property PACKAGE_PIN AB10  [get_ports {PMOD2[5]}];  # "JA8"
set_property PACKAGE_PIN AB9  [get_ports {PMOD2[6]}];  # "JA9"
set_property PACKAGE_PIN AA8  [get_ports {PMOD2[7]}];  # "JA10"

#
# ZedBoard HDMI I2C Controller
#

set_property PACKAGE_PIN AA18 [get_ports {zed_hdmi_iic_scl_io}]
set_property IOSTANDARD LVCMOS25 [get_ports {zed_hdmi_iic_scl_io}]
set_property SLEW SLOW [get_ports {zed_hdmi_iic_scl_io}]
set_property DRIVE 8 [get_ports {zed_hdmi_iic_scl_io}]

set_property PACKAGE_PIN Y16 [get_ports {zed_hdmi_iic_sda_io}]
#set_property IOSTANDARD LVCMOS25 [get_ports {zed_hdmi_iic_sda_io}]
set_property SLEW SLOW [get_ports {zed_hdmi_iic_sda_io}]
set_property DRIVE 8 [get_ports {zed_hdmi_iic_sda_io}]

#
# ZedBoard HDMI Output
#

set_property PACKAGE_PIN W18 [get_ports hdmio_io_clk]
#set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_clk]

set_property PACKAGE_PIN W17 [get_ports hdmio_io_vsync]
#set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_vsync]

set_property PACKAGE_PIN V17 [get_ports hdmio_io_hsync]
#set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_hsync]

set_property PACKAGE_PIN U16 [get_ports hdmio_io_de]
#set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_de]

set_property PACKAGE_PIN Y13 [get_ports {hdmio_io_data[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[0]}]

set_property PACKAGE_PIN AA13 [get_ports {hdmio_io_data[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[1]}]

set_property PACKAGE_PIN AA14 [get_ports {hdmio_io_data[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[2]}]

set_property PACKAGE_PIN Y14 [get_ports {hdmio_io_data[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[3]}]

set_property PACKAGE_PIN AB15 [get_ports {hdmio_io_data[4]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[4]}]

set_property PACKAGE_PIN AB16 [get_ports {hdmio_io_data[5]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[5]}]

set_property PACKAGE_PIN AA16 [get_ports {hdmio_io_data[6]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[6]}]

set_property PACKAGE_PIN AB17 [get_ports {hdmio_io_data[7]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[7]}]

set_property PACKAGE_PIN AA17 [get_ports {hdmio_io_data[8]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[8]}]

set_property PACKAGE_PIN Y15 [get_ports {hdmio_io_data[9]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[9]}]

set_property PACKAGE_PIN W13 [get_ports {hdmio_io_data[10]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[10]}]

set_property PACKAGE_PIN W15 [get_ports {hdmio_io_data[11]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[11]}]

set_property PACKAGE_PIN V15 [get_ports {hdmio_io_data[12]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[12]}]

set_property PACKAGE_PIN U17 [get_ports {hdmio_io_data[13]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[13]}]

set_property PACKAGE_PIN V14 [get_ports {hdmio_io_data[14]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[14]}]

set_property PACKAGE_PIN V13 [get_ports {hdmio_io_data[15]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[15]}]

set_property PACKAGE_PIN U15 [get_ports hdmio_io_spdif]
#set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_spdif]


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
create_generated_clock -name hdmio_clk [get_pins design_1_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]

################
# Clock Groups #
################

set_clock_groups -asynchronous -group [get_clocks "clk_fpga_0" ] -group [get_clocks "clk_fpga_1" ] -group [get_clocks "hdmio_clk" ]



# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
#set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
#set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
#set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];