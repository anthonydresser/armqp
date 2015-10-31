
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART em.avnet.com:zed:part0:1.3 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set hdmio_io [ create_bd_intf_port -mode Master -vlnv avnet.com:interface:avnet_hdmi_rtl:1.0 hdmio_io ]
  set zed_hdmi_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 zed_hdmi_iic ]

  # Create ports
  set Buts [ create_bd_port -dir I -from 4 -to 0 Buts ]
  set LEDS [ create_bd_port -dir O -from 7 -to 0 LEDS ]
  set PMOD1 [ create_bd_port -dir O -from 7 -to 0 PMOD1 ]
  set PMOD2 [ create_bd_port -dir O -from 7 -to 0 PMOD2 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list CONFIG.NUM_MI {1}  ] $axi_mem_intercon

  # Create instance: axi_mem_intercon_1, and set properties
  set axi_mem_intercon_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon_1 ]
  set_property -dict [ list CONFIG.NUM_MI {1}  ] $axi_mem_intercon_1

  # Create instance: axi_vdma_0, and set properties
  set axi_vdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.2 axi_vdma_0 ]
  set_property -dict [ list CONFIG.c_include_mm2s {1} CONFIG.c_include_s2mm {1} CONFIG.c_m_axi_mm2s_data_width {64} CONFIG.c_m_axis_mm2s_tdata_width {16} CONFIG.c_mm2s_genlock_mode {3} CONFIG.c_mm2s_linebuffer_depth {4096} CONFIG.c_mm2s_max_burst_length {16} CONFIG.c_num_fstores {3} CONFIG.c_s2mm_genlock_mode {2} CONFIG.c_s2mm_linebuffer_depth {4096} CONFIG.c_s2mm_max_burst_length {16} CONFIG.c_use_mm2s_fsync {0} CONFIG.c_use_s2mm_fsync {0}  ] $axi_vdma_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_JITTER {217.614} CONFIG.CLKOUT1_PHASE_ERROR {245.344} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {148.5} CONFIG.CLKOUT2_JITTER {183.543} CONFIG.CLKOUT2_PHASE_ERROR {148.986} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100.000} CONFIG.CLKOUT2_USED {false} CONFIG.MMCM_CLKFBOUT_MULT_F {37.125} CONFIG.MMCM_CLKOUT0_DIVIDE_F {6.250} CONFIG.MMCM_CLKOUT1_DIVIDE {1} CONFIG.MMCM_DIVCLK_DIVIDE {4} CONFIG.NUM_OUT_CLKS {1} CONFIG.USE_LOCKED {true} CONFIG.USE_RESET {false}  ] $clk_wiz_0

  # Create instance: gnd, and set properties
  set gnd [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gnd ]
  set_property -dict [ list CONFIG.CONST_VAL {0}  ] $gnd

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_EN_CLK1_PORT {1} CONFIG.PCW_EN_CLK2_PORT {1} CONFIG.PCW_EN_RST1_PORT {1} CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {155} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {90} CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_USE_S_AXI_HP0 {1} CONFIG.PCW_USE_S_AXI_HP2 {1} CONFIG.preset {ZedBoard}  ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {3}  ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_76M, and set properties
  set rst_processing_system7_0_76M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_76M ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $util_vector_logic_0

  # Create instance: v_axi4s_vid_out_0, and set properties
  set v_axi4s_vid_out_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:3.0 v_axi4s_vid_out_0 ]
  set_property -dict [ list CONFIG.C_S_AXIS_VIDEO_DATA_WIDTH {8} CONFIG.C_S_AXIS_VIDEO_FORMAT {0} CONFIG.C_S_AXIS_VIDEO_MAX_TDATASMPLS_PER_CLK {1} CONFIG.HYSTERESIS_LEVEL {16} CONFIG.RAM_ADDR_BITS {10} CONFIG.VTG_MASTER_SLAVE {1}  ] $v_axi4s_vid_out_0

  # Create instance: v_tc_0, and set properties
  set v_tc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc_0 ]
  set_property -dict [ list CONFIG.GEN_F0_VBLANK_HEND {1920} \
CONFIG.GEN_F0_VBLANK_HSTART {1920} CONFIG.GEN_F0_VFRAME_SIZE {1125} \
CONFIG.GEN_F0_VSYNC_HEND {1920} CONFIG.GEN_F0_VSYNC_HSTART {1920} \
CONFIG.GEN_F0_VSYNC_VEND {1088} CONFIG.GEN_F0_VSYNC_VSTART {1083} \
CONFIG.GEN_F1_VBLANK_HEND {1920} CONFIG.GEN_F1_VBLANK_HSTART {1920} \
CONFIG.GEN_F1_VFRAME_SIZE {1125} CONFIG.GEN_F1_VSYNC_HEND {1920} \
CONFIG.GEN_F1_VSYNC_HSTART {1920} CONFIG.GEN_F1_VSYNC_VEND {1088} \
CONFIG.GEN_F1_VSYNC_VSTART {1083} CONFIG.GEN_HACTIVE_SIZE {1920} \
CONFIG.GEN_HFRAME_SIZE {2200} CONFIG.GEN_HSYNC_END {2052} \
CONFIG.GEN_HSYNC_START {2008} CONFIG.GEN_VACTIVE_SIZE {1080} \
CONFIG.HAS_AXI4_LITE {true} CONFIG.VIDEO_MODE {1080p} \
CONFIG.enable_detection {false}  ] $v_tc_0

  # Create instance: v_tpg_0, and set properties
  set v_tpg_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tpg:6.0 v_tpg_0 ]
  set_property -dict [ list CONFIG.enable_motion {false} CONFIG.has_axi4_lite {false} CONFIG.has_axi4s_slave {false} CONFIG.m_video_format {0} CONFIG.pattern_control {9}  ] $v_tpg_0

  # Create instance: vcc, and set properties
  set vcc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vcc ]

  # Create instance: vcc1, and set properties
  set vcc1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vcc1 ]
  set_property -dict [ list CONFIG.CONST_VAL {3} CONFIG.CONST_WIDTH {2}  ] $vcc1

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list CONFIG.IN0_WIDTH {1} CONFIG.IN1_WIDTH {1} CONFIG.IN2_WIDTH {1} CONFIG.NUM_PORTS {8}  ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list CONFIG.NUM_PORTS {8}  ] $xlconcat_1

  # Create instance: xlconcat_2, and set properties
  set xlconcat_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_2 ]
  set_property -dict [ list CONFIG.NUM_PORTS {8}  ] $xlconcat_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list CONFIG.DIN_FROM {0} CONFIG.DIN_TO {0} CONFIG.DIN_WIDTH {5}  ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list CONFIG.DIN_FROM {1} CONFIG.DIN_TO {1} CONFIG.DIN_WIDTH {5} CONFIG.DOUT_WIDTH {1}  ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list CONFIG.DIN_FROM {0} CONFIG.DIN_TO {0} CONFIG.DIN_WIDTH {16}  ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list CONFIG.DIN_FROM {7} CONFIG.DIN_TO {7} CONFIG.DIN_WIDTH {16} CONFIG.DOUT_WIDTH {1}  ] $xlslice_3

  # Create instance: zed_hdmi_iic_0, and set properties
  set zed_hdmi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 zed_hdmi_iic_0 ]

  # Create instance: zed_hdmi_out_0, and set properties
  set zed_hdmi_out_0 [ create_bd_cell -type ip -vlnv avnet:zedboard:zed_hdmi_out:2.0 zed_hdmi_out_0 ]
  set_property -dict [ list CONFIG.C_DATA_WIDTH {16}  ] $zed_hdmi_out_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_mem_intercon_1_M00_AXI [get_bd_intf_pins axi_mem_intercon_1/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP2]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXI_MM2S [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins axi_vdma_0/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXI_S2MM [get_bd_intf_pins axi_mem_intercon_1/S00_AXI] [get_bd_intf_pins axi_vdma_0/M_AXI_S2MM]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI] [get_bd_intf_pins zed_hdmi_iic_0/S_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI] [get_bd_intf_pins v_tc_0/ctrl]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins axi_vdma_0/S_AXI_LITE] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net v_tpg_0_video_out [get_bd_intf_pins axi_vdma_0/S_AXIS_S2MM] [get_bd_intf_pins v_tpg_0/video_out]
  connect_bd_intf_net -intf_net zed_hdmi_iic_0_IIC [get_bd_intf_ports zed_hdmi_iic] [get_bd_intf_pins zed_hdmi_iic_0/IIC]
  connect_bd_intf_net -intf_net zed_hdmi_out_0_IO_HDMIO [get_bd_intf_ports hdmio_io] [get_bd_intf_pins zed_hdmi_out_0/IO_HDMIO]

  # Create port connections
  connect_bd_net -net Buts_1 [get_bd_ports Buts] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tdata [get_bd_pins axi_vdma_0/m_axis_mm2s_tdata] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tdata] [get_bd_pins xlslice_2/Din]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tlast [get_bd_pins axi_vdma_0/m_axis_mm2s_tlast] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tlast] [get_bd_pins xlconcat_1/In5]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tuser [get_bd_pins axi_vdma_0/m_axis_mm2s_tuser] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tuser]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tvalid [get_bd_pins axi_vdma_0/m_axis_mm2s_tvalid] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tvalid] [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconcat_2/In3]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_vdma_0/m_axis_mm2s_aclk] [get_bd_pins axi_vdma_0/s_axis_s2mm_aclk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins v_axi4s_vid_out_0/aclk] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_clk] [get_bd_pins v_tc_0/clk] [get_bd_pins v_tpg_0/aclk] [get_bd_pins xlconcat_1/In0] [get_bd_pins zed_hdmi_out_0/clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net gnd_dout [get_bd_pins gnd/dout] [get_bd_pins v_axi4s_vid_out_0/fid] [get_bd_pins v_axi4s_vid_out_0/vtg_field_id] [get_bd_pins zed_hdmi_out_0/audio_spdif] [get_bd_pins zed_hdmi_out_0/reset]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon_1/ACLK] [get_bd_pins axi_mem_intercon_1/M00_ACLK] [get_bd_pins axi_mem_intercon_1/S00_ACLK] [get_bd_pins axi_vdma_0/m_axi_mm2s_aclk] [get_bd_pins axi_vdma_0/m_axi_s2mm_aclk] [get_bd_pins axi_vdma_0/s_axi_lite_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP2_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_76M/slowest_sync_clk] [get_bd_pins v_tc_0/s_axi_aclk] [get_bd_pins zed_hdmi_iic_0/s_axi_aclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK2 [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK2]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_76M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_76M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon_1/ARESETN] [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_76M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_76M_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon_1/M00_ARESETN] [get_bd_pins axi_mem_intercon_1/S00_ARESETN] [get_bd_pins axi_vdma_0/axi_resetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_76M/peripheral_aresetn] [get_bd_pins v_tc_0/s_axi_aresetn] [get_bd_pins zed_hdmi_iic_0/s_axi_aresetn]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins v_tc_0/resetn]
  connect_bd_net -net v_axi4s_vid_out_0_empty [get_bd_pins v_axi4s_vid_out_0/empty] [get_bd_pins xlconcat_0/In3] [get_bd_pins xlconcat_2/In4]
  connect_bd_net -net v_axi4s_vid_out_0_locked [get_bd_pins v_axi4s_vid_out_0/locked] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconcat_2/In6]
  connect_bd_net -net v_axi4s_vid_out_0_s_axis_video_tready [get_bd_pins axi_vdma_0/m_axis_mm2s_tready] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tready] [get_bd_pins xlconcat_0/In4] [get_bd_pins xlconcat_1/In4]
  connect_bd_net -net v_axi4s_vid_out_0_vid_active_video [get_bd_pins v_axi4s_vid_out_0/vid_active_video] [get_bd_pins zed_hdmi_out_0/video_de]
  connect_bd_net -net v_axi4s_vid_out_0_vid_data [get_bd_pins v_axi4s_vid_out_0/vid_data] [get_bd_pins zed_hdmi_out_0/video_data]
  connect_bd_net -net v_axi4s_vid_out_0_vid_hsync [get_bd_pins v_axi4s_vid_out_0/vid_hsync] [get_bd_pins zed_hdmi_out_0/video_hsync]
  connect_bd_net -net v_axi4s_vid_out_0_vid_vsync [get_bd_pins v_axi4s_vid_out_0/vid_vsync] [get_bd_pins zed_hdmi_out_0/video_vsync]
  connect_bd_net -net v_axi4s_vid_out_0_vtg_ce [get_bd_pins v_axi4s_vid_out_0/vtg_ce] [get_bd_pins v_tc_0/gen_clken] [get_bd_pins xlconcat_0/In5] [get_bd_pins xlconcat_2/In7]
  connect_bd_net -net v_axi4s_vid_out_0_wr_error [get_bd_pins v_axi4s_vid_out_0/wr_error] [get_bd_pins xlconcat_0/In6] [get_bd_pins xlconcat_2/In5]
  connect_bd_net -net v_tc_0_active_video_out [get_bd_pins v_axi4s_vid_out_0/vtg_active_video] [get_bd_pins v_tc_0/active_video_out] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net v_tc_0_fsync_out [get_bd_pins v_tc_0/fsync_out] [get_bd_pins xlconcat_1/In6]
  connect_bd_net -net v_tc_0_hblank_out [get_bd_pins v_axi4s_vid_out_0/vtg_hblank] [get_bd_pins v_tc_0/hblank_out] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net v_tc_0_hsync_out [get_bd_pins v_axi4s_vid_out_0/vtg_hsync] [get_bd_pins v_tc_0/hsync_out]
  connect_bd_net -net v_tc_0_vblank_out [get_bd_pins v_axi4s_vid_out_0/vtg_vblank] [get_bd_pins v_tc_0/vblank_out] [get_bd_pins xlconcat_1/In3]
  connect_bd_net -net v_tc_0_vsync_out [get_bd_pins v_axi4s_vid_out_0/vtg_vsync] [get_bd_pins v_tc_0/vsync_out]
  connect_bd_net -net vcc1_dout [get_bd_pins axi_vdma_0/s_axis_s2mm_tkeep] [get_bd_pins vcc1/dout]
  connect_bd_net -net vcc_dout [get_bd_pins v_axi4s_vid_out_0/aclken] [get_bd_pins v_axi4s_vid_out_0/aresetn] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_ce] [get_bd_pins v_tc_0/clken] [get_bd_pins v_tpg_0/aclken] [get_bd_pins v_tpg_0/aresetn] [get_bd_pins vcc/dout]
  connect_bd_net -net xlconcat_0_dout [get_bd_ports LEDS] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_ports PMOD1] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconcat_2_dout [get_bd_ports PMOD2] [get_bd_pins xlconcat_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins v_axi4s_vid_out_0/rst] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins xlconcat_1/In7] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins xlconcat_2/In2] [get_bd_pins xlslice_3/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces axi_vdma_0/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces axi_vdma_0/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_processing_system7_0_HP2_DDR_LOWOCM
  create_bd_addr_seg -range 0x10000 -offset 0x43000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_vdma_0/S_AXI_LITE/Reg] SEG_axi_vdma_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs v_tc_0/ctrl/Reg] SEG_v_tc_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41600000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs zed_hdmi_iic_0/S_AXI/Reg] SEG_zed_hdmi_iic_0_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


