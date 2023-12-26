
open_mw_lib ./my_design.mw
open_mw_cel pad

set_separate_process_options -placement false
set_separate_process_options -routing false
set_separate_process_options -extraction false

remove_ideal_network -all 
set_propagated_clock [all_clocks]
set_fix_hold [all_clocks]

report_constraint -all > ./report/5_timing_before_route.rpt


clock_opt -only_hold_time

verify_pg_nets

preroute_standard_cells -remove_floating_pieces

verify_pg_nets

set_route_zrt_common_options -post_detail_route_redundant_via_insertion medium

set_route_zrt_detail_options -optimize_wire_via_effort_level medium

route_opt -initial_route_only

route_opt -skip_initial_route -power

### DRC 
verify_zrt_route > ./report/5_route_DRC.rpt


### LVS
verify_lvs > ./report/5_route_LVS.rpt

### route incrementlly if have DRC and LVS issues.
route_opt -incremental

save_mw_cel -as route
save_mw_cel  -design "pad"
exit



