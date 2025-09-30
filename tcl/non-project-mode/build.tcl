source tcl/set_variables.tcl

#Step 1: Reading RTL
set_part $fpga_part
#read_verilog "$dir_origin/$dir_rtl/top_alu.v"
read_verilog [glob "$dir_origin/$dir_rtl/*.v"]

if {![file isdirectory $dir_build_non_project_mode]} {
    file mkdir $dir_build_non_project_mode
}

set path_report $dir_origin/$dir_build_non_project_mode/$dir_report
if {![file isdirectory $path_report]} {
    file mkdir $path_report
}

set path_bitstream $dir_origin/$dir_build_non_project_mode/$dir_bitstream
if {![file isdirectory $path_bitstream]} {
    file mkdir $path_bitstream
}

#Step 6: Running Synthesis
read_xdc "$dir_origin/$dir_xdc/$filename_xdc"
synth_design -top $top_level
write_checkpoint -force $dir_build_non_project_mode/post_synth.dcp
report_timing_summary -file $path_report/timing_syn.rpt


#Step 7: Running Implementation
opt_design
place_design
write_checkpoint -force $dir_build_non_project_mode/post_place.dcp
report_timing -file $path_report/timing_place.rpt
phys_opt_design
route_design
write_checkpoint -force $dir_build_non_project_mode/post_route.dcp
report_timing_summary -file $path_report/timing_summary
write_bitstream -force $path_bitstream/$filename_bitstream