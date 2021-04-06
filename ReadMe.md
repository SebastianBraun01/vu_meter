VLSI Design Project Directory Structure
=======================================

  -----------------------------------------------------------------------------
  Author(s)  : 
  johann.faerber@hs-augsburg.de, friedrich.beckmann@hs-augsburg.de
  -----------------------------------------------------------------------------
  Company    : 
  University of Applied Sciences Augsburg
  -----------------------------------------------------------------------------
  Description: 
  This VLSI Design Project Directory Structure using makefiles
  allows automating design flow for frontend tools
  like ModelSim and backend tools like Altera Quartus
  -----------------------------------------------------------------------------


Design Flow
-----------
A simplified design flow consists of

  * Design Creation
  * Functional Verification
  * Synthesis, Physical Design, Manufacture
  * Prototype Test

Makefile Targets for Verification
---------------------------------
The corresponding targets to the design flow for the functional verification
of a design with ModelSim are:

```
  "make mproject" to create a new modelsim project
  "make compile" to compile all VHDL sources in batch mode
  "make sim" to start modelsim gui with the top testbench of the project
  "make modelsim" to start modelsim with graphical user interface
  "make clean" to remove all generated files
```

e.g.
To start the graphical user interface of the ModelSim simulator with
the corresponding project, use the following command sequence:

```
cd sim/mux2to1
make sim
```

Makefile Targets for Synthesis
------------------------------
The corresponding targets to the design flow for synthesis, physical design,
manufacture of a design with Altera Quartus are:

```
  "make qproject" to create a new quartus project
  "make compile" synthesize the design
  "make prog" to configure programmable device
  "make quartus" to start quartus graphical user interface
  "make clean" to remove all generated files
```

e.g.  
To configure an FPGA on a connected prototype board with
the corresponding project, use the following command sequence:

```
cd pnr/mux2to1
make prog
```

Naming Conventions
------------------
The overall makefile for simulation is located in

sim/makefile

The top level entity of a subdesign is assigned as the project name for verification
in the makefile, e.g.

sim/mux2to1/makefile

```
# Project name for simulation
PROJECT = mux2to1
```

The corresponding testbench is assumed t_top_level_entity.vhd,
e.g. t_mux2to1.vhd and assigned in the makefile as well:

```
# Add here the testbench file
SOURCE_FILES = $(SYN_SOURCE_FILES) \
../../src/t_$(PROJECT).vhd
```


The overall makefile for synthesis is located in

pnr/makefile

A similar convention for a subdesign is used for synthesis, physical design,
manufacture in the makefile, e.g. using a DE1 prototype board

pnr/de1_mux2to1/makefile

```
# Project name for simulation
SIM_PROJECT_NAME = mux2to1
# Project name for synthesis, physical design, manufacture
PROJECT = de1_$(SIM_PROJECT_NAME)
```

The corresponding top level is assumed de1_top_level_entity_structure.vhd,
e.g. de1_mux2to1_structure.vhd and assigned in the makefile as well:

```
# Add the toplevel fpga vhdl file
SOURCE_FILES = $(SYN_SOURCE_FILES) \
../../src/$(PROJECT)_structure.vhd
```

Project Directory Structure
---------------------------
Automated design flow with makefile relies on the following directory structure:

```  
   VLSIDesignOverallProjectName
   |   
   +---src
   |       and2gate_equation.vhd
   |       invgate_equation.vhd
   |       mux2to1_structure.vhd
   |       or2gate_equation.vhd
   |       t_mux2to1.vhd
   |       de1_mux2to1_structure.vhd
   |
   +---sim
   |   |   makefile
   |   |
   |   \---mux2to1
   |           makefile
   |           makefile.sources
   |
   +---pnr
   |   |   makefile
   |   |
   |   \---de1_mux2to1
   |           de1_mux2to1_pins.tcl
   |           makefile
   |
   +---scripts
   |       de1_pin_assignments_minimumio.csv
   |       de1_pin_assignments_minimumio.tcl
   |       modelsim.ini
   |       quartus_project_settings.tcl
   |
   \---doc
           ReadMe.md
```
