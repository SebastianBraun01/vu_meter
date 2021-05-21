## Betriebssystem erkennen
ifeq ($(WSL_DISTRO_NAME), Ubuntu)
PREFIX_QUARTUS = quartus.exe
PREFIX_QUARTUS_SH = quartus_sh.exe
PREFIX_QUARTUS_CPF = quartus_cpf.exe
PREFIX_QUARTUS_PGM = quartus_pgm.exe
else
PREFIX_QUARTUS = quartus
PREFIX_QUARTUS_SH = quartus_sh
PREFIX_QUARTUS_CPF = quartus_cpf
PREFIX_QUARTUS_PGM = quartus_pgm
endif

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
	$(PREFIX_QUARTUS_SH) --qhelp


## Projekt erstellen ==============================================================================
qproject: $(PROJECT).qpf

$(PROJECT).qpf: $(SYN_SOURCE_FILES) ../../scripts/project_settings.tcl $(PROJECT)_pins.tcl
	rm -rf verilog_source_files.tcl

	for source_file in $(SYN_SOURCE_FILES); do \
		echo set_global_assignment -name VERILOG_FILE $$source_file >> verilog_source_files.tcl; \
	done

	$(PREFIX_QUARTUS_SH) -t ../../scripts/project_settings.tcl -projectname $(PROJECT)


## Synthese starten ===============================================================================
compile: flowsummary.log

flowsummary.log: $(PROJECT).qpf ../../scripts/project_flow.tcl
	$(PREFIX_QUARTUS_SH) -t ../../scripts/project_flow.tcl -projectname $(PROJECT) 


## FPGA programmieren =============================================================================
prog: flowsummary.log
	$(PREFIX_QUARTUS_PGM) -c USB-Blaster --mode jtag --operation="p;$(PROJECT).sof"


## FPGA Flash programmieren =======================================================================
flash: flowsummary.log
	$(PREFIX_QUARTUS_CPF) -c -d EPCQ16A -s 10CL016Y $(PROJECT).sof $(PROJECT).jic
	$(PREFIX_QUARTUS_PGM) -c USB-Blaster --mode jtag --operation="pvi;$(PROJECT).jic"


## Projekt in Quartus GUI öffnen ==================================================================
quartus: $(PROJECT).qpf
	$(PREFIX_QUARTUS) $(PROJECT).qpf &


## Projekt bereinigen =============================================================================
clean:
	rm -rf *~ *.rpt *.chg *.log verilog_source_files.tcl *.htm *.eqn *.pin *.sof *.pof db incremental_db *.qpf *.qsf *.summary $(PROJECT).* 
