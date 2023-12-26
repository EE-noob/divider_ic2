### 4-clock tree synthesis ###


open_mw_lib ./my_design.mw
open_mw_cel pad


remove_ideal_network -all

set_separate_process_options -placement false

set_clock_tree_options -target_skew 0.5

set_clock_uncertainty 0.5 [all_clocks ]

set_clock_tree_references -references {CLKBUFUHDV1 CLKBUFUHDV2 CLKBUFUHDV3 CLKBUFUHDV4 CLKBUFUHDV6 CLKBUFUHDV8 CLKBUFUHDV16 CLKBUFUHDV20 CLKBUFUHDV24 \
CLKINUHDV1 CLKINUHDV2 CLKINUHDV3 CLKINUHDV4 CLKINUHDV6 CLKINUHDV8 CLKINUHDV16 CLKINUHDV20 CLKINUHDV24 }

set_min_library ../../lib/std/SCC018UG_UHD_RVT_V0.4a/liberty/1.8v/scc018ug_uhd_rvt_ss_v1p62_125c_basic.db \
 -min_version ../../lib/std/SCC018UG_UHD_RVT_V0.4a/liberty/1.8v/scc018ug_uhd_rvt_ff_v1p98_-40c_basic.db 

set_operating_conditions -analysis_type bc_wc \
        -max_library scc018ug_uhd_rvt_ss_v1p62_125c_basic -max ss_v1p62_125c \
        -min_library scc018ug_uhd_rvt_ff_v1p98_-40c_basic -min ff_v1p98_-40c

clock_opt -only_cts -no_clock_route

save_mw_cel -as clock_opt_cts

report_constraint -all > ./report/4_cts_only_constraint.rpt

remove_ideal_network -all 
set_propagated_clock [all_clocks]
set_fix_hold [all_clocks]

set physopt_area_critical_range 0.4

extract_rc

clock_opt -only_psyn -area_recovery -no_clock_route

route_zrt_group -all_clock_nets -reuse_existing_global_route true

report_constraint -all > ./report/4_cts_opt_constraint.rpt
report_clock_tree > ./report/4_cts_clock_tree.rpt
report_clock_timing -type skew > ./report/4_cts_skew.rpt


save_mw_cel -as clock_opt_route
save_mw_cel  -design "pad"
exit


