package require cmdline
package require ::quartus::project


# ----------------------------------------------------------------------------
# Definiere CLI Parameter
# ----------------------------------------------------------------------------
set parameters {
    {projectname.arg ""   "Project Name"}
}
array set arg [::cmdline::getoptions argv $parameters]

set requiredParameters {projectname}
foreach parameter $requiredParameters {
    if {$arg($parameter) == ""} {
        puts stderr "Missing required parameter: -$parameter"
        exit 1
    }
}


# ----------------------------------------------------------------------------
# Erstelle Projekt
# ----------------------------------------------------------------------------
project_new $arg(projectname) -overwrite


# ----------------------------------------------------------------------------
# Standarteinstellungen
# ----------------------------------------------------------------------------
set_global_assignment -name FAMILY "Cyclone 10 LP"
set_global_assignment -name DEVICE 10CL016YU256C8G
set_global_assignment -name USE_CONFIGURATION_DEVICE ON
set_global_assignment -name CYCLONEIII_CONFIGURATION_DEVICE EPCQ16A

set_global_assignment -name TOP_LEVEL_ENTITY $arg(projectname)
set_global_assignment -name VERILOG_INPUT_VERSION VERILOG_2001
set_global_assignment -name GENERATE_TTF_FILE ON

set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"
set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"

# Enthält alle Quelldateien
#	set_global_assignment -name VERILOG_FILE ../src/test.v
source verilog_source_files.tcl

# Enthält Pin Assignments
# set_location_assignment -to clk PIN_E2
source $arg(projectname)_pins.tcl 


# ----------------------------------------------------------------------------
# Eistellungen speichern und Projekt schließen
# ----------------------------------------------------------------------------
project_close
