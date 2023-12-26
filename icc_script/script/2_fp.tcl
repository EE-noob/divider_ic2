### 2-floorplan and PG Network Synthesis ###


open_mw_lib ./my_design.mw
open_mw_cel pad

#TODO# modify the pad description files according to your design.
source ./script/pad_cell_cons.tcl



#TODO# from ICC windows, create floorplan manually by using default setting
#TODO# then measure the core size(???um X ??? um )


#TODO# set core area either to MAX or MIN according to above measurement.
#TODO# set the space between io2core (4 sides)
#TODO# then create floorplan finally
create_floorplan -control_type width_and_height -core_width 580 -core_height 580 -left_io2core 15 -bottom_io2core 15 -right_io2core 15 -top_io2core 15

#TODO# modify below file for insertting pad filler.
source ./script/insert_pad_filler.tcl

#TODO# modify below file to define the P/G conection.
source ./script/derive_pg_file

#why need to add tap cell?
add_tap_cell_array -master_cell_name FILLTIEUHD -distance 30 -pattern normal -connect_power_name VDD -connect_ground_name VSS

create_pad_rings

save_mw_cel -as floorplan_init

create_fp_placement -timing_driven -no_hierarchy_gravity

save_mw_cel -as floorplan_placed


#TODO# which metal layers (METAL?) should be used for power ring?   (vertical and horizontal)
#TODO# which metal layers (METAL?) should be used for power strap?  (vertical and horizontal)
#TODO# define the width for power ring and strap respectively

set_fp_rail_constraints -add_layer  -layer METAL6 -direction horizontal -max_strap 100 -min_strap 10 -max_width 6 -min_width 3 -spacing 1

set_fp_rail_constraints -add_layer  -layer METAL5 -direction vertical -max_strap 100 -min_strap 10 -max_width 6 -min_width 3 -spacing 1

set_fp_rail_constraints  -set_ring -nets  {VDD VSS}  -horizontal_ring_layer { METAL4 } -vertical_ring_layer { METAL3 } -ring_max_width 4 -ring_min_width 2 -extend_strap core_ring  -ring_spacing 0.8 -ring_offset 4 

synthesize_fp_rail  -nets {VDD VSS} -voltage_supply 1.8 -synthesize_power_plan -power_budget 500 -pad_masters { VDD:PVDD1W.FRAM VSS:PVSS1W.FRAM }

commit_fp_rail

preroute_instances

preroute_standard_cells -fill_empty_rows -remove_floating_pieces

#TODO# Check the max IR-drop of your design?

analyze_fp_rail  -nets {VDD VSS} -power_budget 500 -voltage_supply 1.8 -pad_masters { VDD:PVDD1W.FRAM VSS:PVSS1W.FRAM }

save_mw_cel -as floorplan_pns

#avoid to place cell under the cross-point between M4 and M5 
#set_pnet_options -complete "METAL4 METAL5"

create_fp_placement -timing_driven -no_hierarchy_gravity

route_zrt_global

report_timing > ./report/timing_fp.rpt

#To fix any timing violations,fi there were any
#optimize_fp_timing -fix_design_rule

remove_placement -object_type standard_cell

save_mw_cel -as floorplan_complete
save_mw_cel  -design "pad"
exit


