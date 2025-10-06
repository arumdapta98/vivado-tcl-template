# log_wave -recursive *
add_wave {{/top_alu_tb/iCLK}} 
add_wave {{/top_alu_tb/iOPCODE}}
add_wave {{/top_alu_tb/iDATAIN1}}  -radix unsigned
add_wave {{/top_alu_tb/iDATAIN2}}  -radix unsigned
add_wave {{/top_alu_tb/oDATAOUT}}  -radix unsigned
# radix = {bin, dec, oct, hex, unsigned, ascii}
run 200 ns
# run all
# save_wave_config {top_alu_tb_snapshot.wcfg}
# exit