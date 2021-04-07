options:
	@echo '"make" does intentionally nothing. Type:'
	@echo '  "make mproject" to create a new modelsim project only'
	@echo '  "make compile" to compile all VHDL sources in batch mode'
	@echo '  "make modelsim" to start modelsim with graphical user interface'
	@echo '  "make sim" to start modelsim gui with the top testbench of the project'
	@echo '  "make clean" to remove all generated files'

## Hilfe für Befehle ==============================================================================
help:
	quartus_sh.exe --qhelp


# Model Projekt erstellen =========================================================================
mproject : mproject_created

# The real target should be the .mpf file that is modified in each compilation/simulation
mproject_created : $(SOURCE_FILES)
	# create modelsim project
	rm -rf ./modelsim_sources.tcl
	for source_file in $(SOURCE_FILES); do \
	  echo project addfile $$source_file >> modelsim_sources.tcl; \
	done
	vsim.exe -modelsimini ../../scripts/modelsim.ini -c -do "project new [pwd] $(PROJECT); source ./modelsim_sources.tcl; quit -f"
	touch mproject_created


# Kompilieren =====================================================================================
compile: ./work/_vmake

./work/_vmake: mproject_created
	rm -rf errors.log
	vsim.exe -c -do "project open $(PROJECT); project calculateorder; quit -f"
	grep "Errors:\ [1-9]" transcript >> errors.log; if [ -s errors.log ] ; then rm -rf work/_vmake; exit 1; fi


# Starte Modelsim GUI =============================================================================
modelsim: mproject_created
	vsim.exe -i -do "project open $(PROJECT)" &


# Simulation starten ==============================================================================
sim: ./work/_vmake
	#vsim.exe -i -do "project open $(PROJECT); vsim.exe work.t_$(PROJECT)(tbench); add wave *; run -a;" &
	vsim.exe -i -do "project open $(PROJECT); vsim work.t_$(PROJECT); add wave *; run -a;" &


# Projekt bereinigen ==============================================================================
clean:
	rm -rf *~ *.mpf *.mti *.ini *.wlf wlf* transcript *.log work modelsim_sources.tcl mproject_created
