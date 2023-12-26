icc_shell -f ./script/1_data_setup.tcl |tee ./log/1_data_setup.log
icc_shell -f ./script/2_fp.tcl |tee ./log/2_fp.log
icc_shell -f ./script/3_placement.tcl |tee ./log/3_placement.log
icc_shell -f ./script/4_cts.tcl |tee ./log/4_cts.log
icc_shell -f ./script/5_route.tcl |tee ./log/5_route.log
icc_shell -f ./script/6_chip_finish.tcl |tee ./log/6_chip_finish.log
