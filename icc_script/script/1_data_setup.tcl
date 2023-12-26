############ THE REFERENCE SCRIPTS FOR IC2 EXP #############
### 1-data setup ###

### why need to set reference library? what kind of its format? try to find and set them by yourself ###
### why need technology files? try to find and set it by yourself ###

create_mw_lib  -technology $tech_file -mw_reference_library {../../lib/std/SCC018UG_UHD_RVT_V0.4a/astro/scc018ug_uhd_rvt ../../lib/io/SP018WP_V1p1/apollo/SP018WP_V1p1_6MT} -bus_naming_style {[%d]} -open  $my_mw_lib


import_designs -format verilog -top $top_design -cel $top_design {../syn/output/my_design.v}


### understand the purpose of using tluplus? ###
set_tlu_plus_files -max_tluplus $tlup_max -min_tluplus $tlup_min -tech2itf_map $tlup_map

link

### define the connection of power and ground, try to modified derive_pg_file ###
source ./script/derive_pg_file

read_sdc $mydesign_sdc

check_lib > ./report/check_lib.rpt

save_mw_cel -as data_setup
save_mw_cel  -design "pad"
exit

