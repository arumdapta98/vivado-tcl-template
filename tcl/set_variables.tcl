# set board and fpga part number
set board_name "basys3"
set fpga_part "xc7a35tcpg236-1"

# set project
set project_name "demo_alu"
set top_level "top_alu"
set top_level_tb "${top_level}_tb.v"

# set template directory
set dir_rtl "rtl"
set dir_tb "tb"
set dir_xdc "xdc"
set dir_project "project"
set dir_build_project_mode "build-project-mode"
set dir_build_non_project_mode "build-non-project-mode"
set dir_log "log"
set dir_report "report"
set dir_bitstream "bitstream"

# set reference directories for source files
set dir_origin [file normalize "."]
puts "INFO: dir_origin is  $dir_origin"


# set file constrains
#set filename_xdc "Basys-3-Master.xdc"
set filename_xdc "${board_name}_${project_name}.xdc"
set filename_bitstream "${board_name}_${project_name}.bit"




