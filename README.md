# vivado-tcl-template by ABJ
TCL script for creating vivado project, synthesis, implementation and generate bitstream.
The environment is set for running on Windows and Basys3 FPGA board.

# pre-requisites
Edit file setenv.bat following your local drive

# how to run
1. Setup environment for vivado <br />
**$ setenv.bat**

2. Create project, synthesis, implementation and generate bitsteram <br />
**$ make build**

3. Load bitstream to FPGA board <br />
**$ make flash**

4. Clean build directory including project files <br />
**$ make clean**

5. To run simulation <br />
   
   **$ cd sim** <br />

	option 1: <br />
	**$ make clean** <br />
	**$ make compile** <br />
	**$ make elab** <br />
	**$ make sim** <br />
	
	option 2: <br />
	**$ make all** <br />

