options:
	@echo '"make" does intentionally nothing. Type:'
	@echo '  "make qproject" to create quartus project only'
	@echo '  "make help" to view command reference'
	@echo '  "make compile" to synthesize the design'
	@echo '  "make prog" to configure programmable device'
	@echo '  "make flash" to configure flash of programmable device'
	@echo '  "make quartus" to start quartus graphical user interface'
	@echo '  "make clean" to remove all generated files'

## Hilfe für Befehle ==============================================================================
help:
	quartus_sh.exe --qhelp


## Projekt erstellen ==============================================================================
qproject: $(PROJECT).qpf

$(PROJECT).qpf: $(SYN_SOURCE_FILES) ../../scripts/project_settings.tcl $(PROJECT)_pins.tcl
	rm -rf verilog_source_files.tcl

	for source_file in $(SYN_SOURCE_FILES); do \
		echo set_global_assignment -name VERILOG_FILE $$source_file >> verilog_source_files.tcl; \
	done

	quartus_sh.exe -t ../../scripts/project_settings.tcl -projectname $(PROJECT)


## Synthese starten ===============================================================================
compile: flowsummary.log

flowsummary.log: $(PROJECT).qpf ../../scripts/project_flow.tcl
	quartus_sh.exe -t ../../scripts/project_flow.tcl -projectname $(PROJECT) 


## FPGA programmieren =============================================================================
prog: flowsummary.log
	quartus_pgm.exe -c USB-Blaster --mode jtag --operation="p;$(PROJECT).sof"


## FPGA Flash programmieren =======================================================================
flash: flowsummary.log
	quartus_cpf.exe -c -d EPCQ16A -s 10CL016Y $(PROJECT).sof $(PROJECT).jic
	quartus_pgm.exe -c USB-Blaster --mode jtag --operation="pvi;$(PROJECT).jic"


## Projekt in Quartus GUI öffnen ==================================================================
quartus: $(PROJECT).qpf
	quartus.exe $(PROJECT).qpf &


## Projekt bereinigen =============================================================================
clean:
	rm -rf *~ *.rpt *.chg *.log verilog_source_files.tcl *.htm *.eqn *.pin *.sof *.pof db incremental_db *.qpf *.qsf *.summary $(PROJECT).* 
