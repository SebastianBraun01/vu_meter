## Betriebssystem erkennen
ifeq ($(WSL_DISTRO_NAME), Ubuntu)
PREFIX_QUARTUS_SH = quartus_sh.exe
PREFIX_VSIM = vsim.exe
else
PREFIX_QUARTUS_SH = quartus_sh
PREFIX_VSIM = vsim
endif


options:
	@echo '"make" does intentionally nothing. Type:'
	@echo '  "make mproject" to create a new modelsim project only'
	@echo '  "make compile" to compile all VHDL sources in batch mode'
	@echo '  "make modelsim" to start modelsim with graphical user interface'
	@echo '  "make sim" to start modelsim gui with the top testbench of the project'
	@echo '  "make clean" to remove all generated files'

## Hilfe für Befehle ==============================================================================
help:
	$(PREFIX_QUARTUS_SH) --qhelp


# Model Projekt erstellen =========================================================================
mproject : mproject_created

# The real target should be the .mpf file that is modified in each compilation/simulation
mproject_created : makefile.sources
	# create modelsim project
	rm -rf ./modelsim_sources.tcl
	for source_file in $(SOURCE_FILES); do \
	  echo project addfile $$source_file >> modelsim_sources.tcl; \
	done
	$(PREFIX_VSIM) -modelsimini ../../scripts/modelsim.ini -c -do "project new [pwd] $(PROJECT); source ./modelsim_sources.tcl; quit -f"
	touch mproject_created


# Kompilieren =====================================================================================
compile: ./work/compiled

./work/compiled: mproject_created $(SOURCE_FILES)
	rm -rf errors.log
	$(PREFIX_VSIM) -c -do "project open $(PROJECT); project calculateorder; quit -f"
	if [ grep "^#\sErrors:\s0," transcript ]; then \
		rm -rf work/_vmake; exit 1; \
	fi
	touch ./work/compiled


# Starte Modelsim GUI =============================================================================
modelsim: mproject_created
	$(PREFIX_VSIM) -i -do "project open $(PROJECT)" &


# Simulation starten ==============================================================================
sim: ./work/compiled
	if [ -e wave.do ]; then \
		$(PREFIX_VSIM) -i -do "project open $(PROJECT); vsim work.t_$(PROJECT); do wave.do; run -a;"; \
	else \
		$(PREFIX_VSIM) -i -do "project open $(PROJECT); vsim work.t_$(PROJECT); add wave *; run -a;"; \
	fi
		


# Projekt bereinigen ==============================================================================
clean:
	rm -rf *~ *.mpf *.mti *.ini *.wlf wlf* transcript *.log work modelsim_sources.tcl mproject_created
