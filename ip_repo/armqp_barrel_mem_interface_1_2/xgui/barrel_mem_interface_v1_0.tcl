# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "buf_capacity" -parent ${Page_0}
  ipgui::add_param $IPINST -name "height" -parent ${Page_0}
  ipgui::add_param $IPINST -name "max_rows_in_buffer" -parent ${Page_0}
  ipgui::add_param $IPINST -name "min_items_in_buffer" -parent ${Page_0}
  ipgui::add_param $IPINST -name "min_rows_in_buffer" -parent ${Page_0}
  ipgui::add_param $IPINST -name "width" -parent ${Page_0}


}

proc update_PARAM_VALUE.buf_capacity { PARAM_VALUE.buf_capacity } {
	# Procedure called to update buf_capacity when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.buf_capacity { PARAM_VALUE.buf_capacity } {
	# Procedure called to validate buf_capacity
	return true
}

proc update_PARAM_VALUE.height { PARAM_VALUE.height } {
	# Procedure called to update height when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.height { PARAM_VALUE.height } {
	# Procedure called to validate height
	return true
}

proc update_PARAM_VALUE.max_rows_in_buffer { PARAM_VALUE.max_rows_in_buffer } {
	# Procedure called to update max_rows_in_buffer when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.max_rows_in_buffer { PARAM_VALUE.max_rows_in_buffer } {
	# Procedure called to validate max_rows_in_buffer
	return true
}

proc update_PARAM_VALUE.min_items_in_buffer { PARAM_VALUE.min_items_in_buffer } {
	# Procedure called to update min_items_in_buffer when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.min_items_in_buffer { PARAM_VALUE.min_items_in_buffer } {
	# Procedure called to validate min_items_in_buffer
	return true
}

proc update_PARAM_VALUE.min_rows_in_buffer { PARAM_VALUE.min_rows_in_buffer } {
	# Procedure called to update min_rows_in_buffer when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.min_rows_in_buffer { PARAM_VALUE.min_rows_in_buffer } {
	# Procedure called to validate min_rows_in_buffer
	return true
}

proc update_PARAM_VALUE.width { PARAM_VALUE.width } {
	# Procedure called to update width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.width { PARAM_VALUE.width } {
	# Procedure called to validate width
	return true
}


proc update_MODELPARAM_VALUE.buf_capacity { MODELPARAM_VALUE.buf_capacity PARAM_VALUE.buf_capacity } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.buf_capacity}] ${MODELPARAM_VALUE.buf_capacity}
}

proc update_MODELPARAM_VALUE.width { MODELPARAM_VALUE.width PARAM_VALUE.width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.width}] ${MODELPARAM_VALUE.width}
}

proc update_MODELPARAM_VALUE.height { MODELPARAM_VALUE.height PARAM_VALUE.height } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.height}] ${MODELPARAM_VALUE.height}
}

proc update_MODELPARAM_VALUE.min_rows_in_buffer { MODELPARAM_VALUE.min_rows_in_buffer PARAM_VALUE.min_rows_in_buffer } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.min_rows_in_buffer}] ${MODELPARAM_VALUE.min_rows_in_buffer}
}

proc update_MODELPARAM_VALUE.min_items_in_buffer { MODELPARAM_VALUE.min_items_in_buffer PARAM_VALUE.min_items_in_buffer } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.min_items_in_buffer}] ${MODELPARAM_VALUE.min_items_in_buffer}
}

proc update_MODELPARAM_VALUE.max_rows_in_buffer { MODELPARAM_VALUE.max_rows_in_buffer PARAM_VALUE.max_rows_in_buffer } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.max_rows_in_buffer}] ${MODELPARAM_VALUE.max_rows_in_buffer}
}

