DIR_XIL = .Xil
DIR_LOG = log
DIR_RTL = rtl
DIR_TCL = tcl
DIR_XDC = xdc

CLOG?=-log $(DIR_LOG)/vivado.log
CJOU?=-journal $(DIR_LOG)/vivado.jou

#MODE?=project-mode
MODE?=non-project-mode

DIR_BUILD = build-$(MODE)

build:
	if not exist $(DIR_LOG) mkdir $(DIR_LOG)
	vivado -mode batch -source $(DIR_TCL)/$(MODE)/build.tcl $(CLOG) $(CJOU)

flash:
	vivado -mode batch -source $(DIR_TCL)/$(MODE)/program_board.tcl $(CLOG) $(CJOU)
	
proj:
	if not exist $(DIR_LOG) mkdir $(DIR_LOG)
	vivado -mode batch -source $(DIR_TCL)/$(MODE)/create_project.tcl $(CLOG) $(CJOU)

syn:
	vivado -mode batch -source $(DIR_TCL)/$(MODE)/synthesis.tcl $(CLOG) $(CJOU)

imp:
	vivado -mode batch -source $(DIR_TCL)/$(MODE)/implementation.tcl $(CLOG) $(CJOU)

bit:
	vivado -mode batch -source $(DIR_TCL)/$(MODE)/generate_bitstream.tcl $(CLOG) $(CJOU)

clean:
	if exist $(DIR_XIL) rmdir $(DIR_XIL) /S /Q
	if exist $(DIR_LOG) rmdir $(DIR_LOG) /S /Q
	if exist $(DIR_BUILD) rmdir $(DIR_BUILD) /S /Q
	if exist clockinfo.txt del clockinfo.txt
	
check:
	if not exist $(DIR_LOG) mkdir $(DIR_LOG)
	vivado -mode batch -source $(DIR_TCL)/check.tcl $(CLOG) $(CJOU)


FILE_BITSTREAM = basys3_demo_alu.bit
fpga:
	openFPGALoader -b basys3 $(DIR_BUILD)/bitstream/$(FILE_BITSTREAM)
