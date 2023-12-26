### 3-placement ###

open_mw_lib ./my_design.mw
open_mw_cel pad


set_separate_process_options -placement false


place_opt -area_recovery -power

#incremental optimization
#excute this steps if your design have some congestion problems.
psynopt -area_recovery -power

report_timing > ./report/3_place_timing.rpt
report_congestion > ./report/3_place_congestion.rpt

save_mw_cel -as placed
save_mw_cel  -design "pad"
exit

