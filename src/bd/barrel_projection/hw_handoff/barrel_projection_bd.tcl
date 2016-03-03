
################################################################
# This is a generated script based on design: barrel_projection
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
# source barrel_projection_script.tcl

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
set design_name barrel_projection

# This script was generated for a remote BD.
set str_bd_folder D:/vivadoprojects/armqp/src/bd
set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

# Check if remote design exists on disk
if { [file exists $str_bd_filepath ] == 1 } {
   puts "ERROR: The remote BD file path <$str_bd_filepath> already exists!"
   return 1
}

# Check if design exists in memory
set list_existing_designs [get_bd_designs -quiet $design_name]
if { $list_existing_designs ne "" } {
   puts "ERROR: The design <$design_name> already exists in this project!"
   puts "ERROR: Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."

   return 1
}

# Check if design exists on disk within project
set list_existing_designs [get_files */${design_name}.bd]
if { $list_existing_designs ne "" } {
   puts "ERROR: The design <$design_name> already exists in this project at location:"
   puts "   $list_existing_designs"
   puts "ERROR: Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."

   return 1
}

# Now can create the remote BD
create_bd_design -dir $str_bd_folder $design_name
current_bd_design $design_name

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
  set AXIS_In [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_In ]
  set_property -dict [ list CONFIG.FREQ_HZ {148500000} CONFIG.HAS_TKEEP {0} CONFIG.HAS_TLAST {0} CONFIG.HAS_TREADY {1} CONFIG.HAS_TSTRB {0} CONFIG.LAYERED_METADATA {undef} CONFIG.PHASE {0.000} CONFIG.TDATA_NUM_BYTES {2} CONFIG.TDEST_WIDTH {0} CONFIG.TID_WIDTH {0} CONFIG.TUSER_WIDTH {1}  ] $AXIS_In
  set AXIS_Out [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_Out ]
  set_property -dict [ list CONFIG.FREQ_HZ {148500000}  ] $AXIS_Out

  # Create ports
  set addr_vld [ create_bd_port -dir O addr_vld ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list CONFIG.ASSOCIATED_RESET {reset} CONFIG.FREQ_HZ {148500000}  ] $clk
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list CONFIG.POLARITY {ACTIVE_HIGH}  ] $reset
  set xOut [ create_bd_port -dir O -from 11 -to 0 xOut ]
  set yOut [ create_bd_port -dir O -from 11 -to 0 yOut ]

  # Create instance: barrelMath_0, and set properties
  set barrelMath_0 [ create_bd_cell -type ip -vlnv armqp:user:barrelMath:1.0 barrelMath_0 ]

  # Create instance: barrel_mem_interface_0, and set properties
  set barrel_mem_interface_0 [ create_bd_cell -type ip -vlnv wpi.edu:user:barrel_mem_interface:1.5 barrel_mem_interface_0 ]

  # Create instance: cordic_0, and set properties
  set cordic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cordic:6.0 cordic_0 ]
  set_property -dict [ list CONFIG.Compensation_Scaling {No_Scale_Compensation} CONFIG.Data_Format {SignedFraction} CONFIG.Functional_Selection {Translate} CONFIG.cartesian_has_tuser {true} CONFIG.cartesian_tuser_width {22} CONFIG.flow_control {Blocking} CONFIG.out_tready {true}  ] $cordic_0

  # Create instance: cordic_1, and set properties
  set cordic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cordic:6.0 cordic_1 ]
  set_property -dict [ list CONFIG.flow_control {Blocking} CONFIG.out_tready {true} CONFIG.phase_has_tuser {true} CONFIG.phase_tuser_width {22}  ] $cordic_1

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_In_1 [get_bd_intf_ports AXIS_In] [get_bd_intf_pins barrel_mem_interface_0/AXIS_In]
  connect_bd_intf_net -intf_net barrelMath_0_rCin [get_bd_intf_pins barrelMath_0/rCin] [get_bd_intf_pins cordic_1/S_AXIS_CARTESIAN]
  connect_bd_intf_net -intf_net barrelMath_0_rPin [get_bd_intf_pins barrelMath_0/rPin] [get_bd_intf_pins cordic_1/S_AXIS_PHASE]
  connect_bd_intf_net -intf_net barrelMath_0_tIn [get_bd_intf_pins barrelMath_0/tIn] [get_bd_intf_pins cordic_0/S_AXIS_CARTESIAN]
  connect_bd_intf_net -intf_net barrel_mem_interface_0_AXIS_Out [get_bd_intf_ports AXIS_Out] [get_bd_intf_pins barrel_mem_interface_0/AXIS_Out]
  connect_bd_intf_net -intf_net cordic_0_M_AXIS_DOUT [get_bd_intf_pins barrelMath_0/tOut] [get_bd_intf_pins cordic_0/M_AXIS_DOUT]
  connect_bd_intf_net -intf_net cordic_1_M_AXIS_DOUT [get_bd_intf_pins barrelMath_0/rOut] [get_bd_intf_pins cordic_1/M_AXIS_DOUT]

  # Create port connections
  connect_bd_net -net barrelMath_0_addr_vld [get_bd_ports addr_vld] [get_bd_pins barrelMath_0/addr_vld] [get_bd_pins barrel_mem_interface_0/Math_Vaild]
  connect_bd_net -net barrelMath_0_xOut [get_bd_ports xOut] [get_bd_pins barrelMath_0/xOut] [get_bd_pins barrel_mem_interface_0/Math_Y]
  connect_bd_net -net barrelMath_0_yOut [get_bd_ports yOut] [get_bd_pins barrelMath_0/yOut] [get_bd_pins barrel_mem_interface_0/Math_X]
  connect_bd_net -net barrel_mem_interface_0_Math_Ready [get_bd_pins barrelMath_0/mem_ready] [get_bd_pins barrel_mem_interface_0/Math_Ready]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins barrelMath_0/clk] [get_bd_pins barrel_mem_interface_0/clk] [get_bd_pins cordic_0/aclk] [get_bd_pins cordic_1/aclk]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins barrelMath_0/reset] [get_bd_pins barrel_mem_interface_0/reset]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


