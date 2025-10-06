DIR_XIL = .Xil
DIR_SIM = xsim.dir
SOURCES_V = \
    ../rtl/top_alu.v \
    ../tb/top_alu_tb.v \

TOP_LEVEL = top_alu_tb
SIM_SNAPSHOT = $(TOP_LEVEL)_snapshot


compile:
	xvlog $(SOURCES_V)

elab:
	xelab -top $(TOP_LEVEL) -s $(SIM_SNAPSHOT) --debug typical

sim:
#	xsim $(SIM_SNAPSHOT) -R
# "-R" means “run the simulation until it finishes”, equivalent to run all when done from the graphic interface’s TCL shell.
	xsim $(SIM_SNAPSHOT) --tclbatch xsim_config.tcl --gui
# 	xsim --gui $(SIM_SNAPSHOT).wdb --tclbatch xsim_cfg.tcl



all: clean compile elab sim


clean:
	if exist $(DIR_XIL) rmdir $(DIR_XIL) /S /Q
	if exist $(DIR_SIM) rmdir $(DIR_SIM) /S /Q
	if exist *.log del *.log
	if exist *.jou del *.jou
	if exist *.pb del *.pb
	if exist *.wdb del *.wdb
	if exist *.wcfg del *.wcfg
