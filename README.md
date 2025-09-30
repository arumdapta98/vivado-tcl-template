# vivado-tcl-template by ABJ
TCL script for creating vivado project, synthesis, implementation and generate bitstream.
The environment is set for running on Windows.

# pre-requisites
Edit file setenv.bat following your local drive

# how to run
1. Setup environment for vivado
**$ setenv**

2. Create project, synthesis, implementation and generate bitsteram
**$ make build**

3. Load bitstream to FPGA board
**$ make flash**

4. Clean build directory including project files
**$ make clean**

