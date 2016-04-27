# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}


proc update_MODELPARAM_VALUE.wait_on_both { MODELPARAM_VALUE.wait_on_both } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "wait_on_both". Setting updated value from the model parameter.
set_property value "00" ${MODELPARAM_VALUE.wait_on_both}
}

proc update_MODELPARAM_VALUE.wait_on_cur { MODELPARAM_VALUE.wait_on_cur } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "wait_on_cur". Setting updated value from the model parameter.
set_property value "01" ${MODELPARAM_VALUE.wait_on_cur}
}

proc update_MODELPARAM_VALUE.wait_on_delay { MODELPARAM_VALUE.wait_on_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "wait_on_delay". Setting updated value from the model parameter.
set_property value "10" ${MODELPARAM_VALUE.wait_on_delay}
}

proc update_MODELPARAM_VALUE.go_delta { MODELPARAM_VALUE.go_delta } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "go_delta". Setting updated value from the model parameter.
set_property value "11" ${MODELPARAM_VALUE.go_delta}
}

