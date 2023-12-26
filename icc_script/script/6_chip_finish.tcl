###6-Chip Finishing##########

open_mw_lib ./my_design.mw
open_mw_cel pad

set_separate_process_options -placement false
set_separate_process_options -routing false
set_separate_process_options -extraction false
########################################
#      LOAD AND ANALYZE DESIGN         #
########################################

# Check for DRC violations
verify_zrt_route > ./report/6_finish_1st_DRC.rpt

# Check for LVS violations
verify_lvs > ./report/6_finish_1st_LVS.rpt

# Check for constraint violations
report_constraints -all > ./report/6_finish_1st_constraint.rpt

########################################
#      CRITICAL AREA REDUCTION         #
########################################
#spread & widen wires
#spread_zrt_wires
#widen_zrt_wires

#report_critical_area -fault_type short
#sh mv output_heatmap ./report/des.short.before.rpt

spread_zrt_wires
#report_critical_area -fault_type short
#sh mv output_heatmap ./report/des.short.after.rpt

report_critical_area -fault_type open
#sh mv output_heatmap ./report/des.open.before.rpt
widen_zrt_wires
#report_critical_area -fault_type open
#sh mv output_heatmap ./report/des.open.after.rpt

verify_zrt_route > ./report/6_finish_2nd_DRC.rpt
verify_lvs > ./report/6_finish_2nd_LVS.rpt
report_constraints -all > ./report/6_finish_2nd_constraint.rpt
rc

save_mw_cel -as chip_finish_des

##############################################
# FIXING ANTENNA RULE VIOLATIONS WITH DIODES  #
##############################################

source -echo ./script/antenna_6m_1tm.tcl
report_antenna_rules > ./report/6_antenna.rule	
verify_zrt_route 

set_route_zrt_detail_options -insert_diodes_during_routing true
route_zrt_detail -incremental true

verify_lvs 
derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS 
derive_pg_connection -power_net VDD -ground_net VSS -tie

verify_zrt_route > ./report/6_finish_antenna_DRC.rpt
verify_lvs > ./report/6_finish_antenna_LVS.rpt
rc

save_mw_cel -as chip_finish_antenna

########################################
# INSERT STANDARD CELL FILLERS         #
########################################

remove_stdcell_filler -stdcell

set fillers "F_FILLUHD32 F_FILLUHD16 F_FILLUHD8 F_FILLUHD4 F_FILLUHD2 F_FILLUHD1"
insert_stdcell_filler -respect_keepout -connect_to_power VDD -connect_to_ground VSS -cell_with_metal $fillers 

derive_pg_connection -power_net VDD -power_pin VDD -cells [get_flat_cells *] -reconnect
derive_pg_connection -ground_net VSS -ground_pin VSS -cells [get_flat_cells *] -reconnect

verify_zrt_route
verify_lvs
rc

########################################
# INSERT REDUNDANT VIAS                #
########################################
 
#report_design_physical -route
#insert_zrt_redundant_vias -list_only
#insert_zrt_redundant_vias -effort medium

#report_design_physical -route
#verify_zrt_route
#verify_lvs
#rc

########################################
#     INSERT METAL FILL                #
########################################

#insert_metal_filler -routing_space 2 -timing_driven

########################################
#           CONNECT P/G                #
########################################

derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS 
derive_pg_connection -power_net VDD -ground_net VSS -tie

########################################
#            FINAL DESIGN CHECKS       #
########################################
verify_zrt_route > ./report/6_final_DRC.rpt
verify_lvs > ./report/6_final_LVS.rpt
rc

########################################
#       SAVE DESIGN AND STREAM OUT     #
########################################
save_mw_cel -as chip_finish_final
save_mw_cel  -design "pad"

write_sdf -significant_digits 6 ./output/pad.sdf
write_verilog -no_core_filler_cells -no_pad_filler_cells -no_corner_pad_cells ./output/pad.output1.v
write_verilog -no_physical_only_cells -supply_statement none ./output/pad.output2.v


close_mw_cel

set_write_stream_options \
	-child_depth 255 \
	-map_layer ./script/gds2OutLayer_twinwell.map \
      	-output_filling fill \
       	-output_outdated_fill \
       	-keep_data_type \
	-max_name_length 255 \
	-output_net_name_as_property 1 \
	-output_instance_name_as_property 1 \
	-output_pin {geometry text} \
	-output_polygon_pin \
	-output_design_intent 

write_stream -cells $top_design -format gds ./output/pad.gds

#for LVS use only
open_mw_lib ./my_design.mw
open_mw_cel pad
save_mw_cel -as for_lvs
close_mw_cel
open_mw_cel for_lvs 

remove_cell *FILLUHD* 
remove_cell *pfiller*
remove_cell *corner*

write_verilog -diode_ports -pg ./output/pad.output.pg.lvs.filler.v 

exit
