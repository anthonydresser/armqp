# Used with
# Vivado (TM) v2015.2 (64-bit)
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# It creates the project in a new directory using referencing 
# files under source control in the fixed NOA directory tree.
# The generated project is not under source control.
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#

# If block diagram is modified, export the bd script to 
# "origin_dir/src/bd/design1.tcl" using the vivado tool. 


puts "The name of this script is $argv0"

# Set User Environment Variables. Each is set once for a new 
# project.
# Top Level file name without path and without extension.
# This file must be in origin_dir/src/hdl/ 

set TopLevelFileName "top_level"
set ActiveConstraints "main" 

# End User Environment Variables

# Set the reference directory to where the script is
set origin_dir [file dirname [info script]]

# Create project 
create_project armqp $origin_dir/armqp

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

#######################################################
# Copied from Xilinx Write Project Tcl result 
# for this specific project when first created.
#######################################################
# Set project properties
set obj [get_projects armqp]
set_property "board_part" "em.avnet.com:zed:part0:1.3" $obj
set_property "default_lib" "xil_defaultlib" $obj
# End Set project properties
#######################################################

set FPGAPartNumber [get_property "part" $obj]
 
set basedir "$origin_dir/ip_repo/"

set_property  ip_repo_paths  $basedir [current_project]
update_ip_catalog

# Create Block Design
source $origin_dir/src/bd/design_1.tcl
save_bd_design
regenerate_bd_layout
save_bd_design

source $origin_dir/src/bd/barrel_projection.tcl
save_bd_design
regenerate_bd_layout
save_bd_design

# Generate the Wrapper

set design_name [get_bd_designs]
make_wrapper -files [get_files $design_name.bd] -top -import


# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}


# Load the Non IP hdl files.
# These files are straight verilog instaintiated in a hierarchy # anchored to the top level.

set dir "$origin_dir/src/hdl/"
import_files $dir

#create any IP needed for top level (i.e. clocking wizards, fifo, ect.)

create_ip -name clk_wiz -vendor xilinx.com -library ip -version 5.1 -module_name clk_wiz_1
set_property -dict [list CONFIG.PRIM_IN_FREQ {50} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25} CONFIG.CLKIN1_JITTER_PS {200.0} CONFIG.MMCM_DIVCLK_DIVIDE {2} CONFIG.MMCM_CLKFBOUT_MULT_F {36.375} CONFIG.MMCM_CLKIN1_PERIOD {20.0} CONFIG.MMCM_CLKOUT0_DIVIDE_F {36.375} CONFIG.CLKOUT1_JITTER {349.768} CONFIG.CLKOUT1_PHASE_ERROR {246.739}] [get_ips clk_wiz_1]
generate_target all [get_files $origin_dir/armqp/armqp.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.xci]


# Set 'sources_1' fileset file properties for local files

set basedir "$origin_dir/src/"

proc incr_filename {name} { 
set digits [regexp -inline {\d+$} $name]
set prefix [string range $name 0 end-[string length $digits]]
set num [scan $digits %d] 
# prevents problems with invalid octal numbers 
format "%s%0*d" $prefix [string length $digits] [incr num] 
} 

set ConstrSetName "Constrs_1"
add_files -fileset constrs_1 -norecurse $origin_dir/src/hdl/main.xdc

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "top" "design_1_wrapper" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part $FPGAPartNumber -flow {Vivado Synthesis 2015} -strategy "Vivado Synthesis Defaults" -constrset $ActiveConstraints
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2015" [get_runs synth_1]
}
set obj [get_runs synth_1]

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part $FPGAPartNumber -flow {Vivado Implementation 2015} -strategy "Vivado Implementation Defaults" -constrset $ActiveConstraints -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2015" [get_runs impl_1]
}
set obj [get_runs impl_1]

# set the current impl run
current_run -implementation [get_runs impl_1]

#set up out of context for block design
create_fileset -blockset -define_from design_1_wrapper design_1_wrapper
file mkdir $origin_dir/armqp/armqp.srcs/design_1_wrapper/new
close [ open $origin_dir/armqp/armqp.srcs/design_1_wrapper/new/design_1_wrapper_ooc.xdc w ]
add_files -fileset design_1_wrapper $origin_dir/armqp/armqp.srcs/design_1_wrapper/new/design_1_wrapper_ooc.xdc
set filename "$origin_dir/armqp/armqp.srcs/design_1_wrapper/new/design_1_wrapper_ooc.xdc"
set fileId [open $filename "w"]
close $fileId
set_property USED_IN {out_of_context synthesis implementation}  [get_files  $origin_dir/armqp/armqp.srcs/design_1_wrapper/new/design_1_wrapper_ooc.xdc]


puts "INFO: Project created:project_1"
