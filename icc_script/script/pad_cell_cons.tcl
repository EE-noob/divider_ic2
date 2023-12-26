### pad count--totol 32 pins
###           signal-------------------24
###           VDD for core (PVDD1R)----2 (double bonding)
###           GND for core (PVSS1R)----2 (double bonding)
###           VDD for IO   (PVDD2R)----2
###           GND for IO   (PVSS1R)----2


#create corners and P/G pads
create_cell {cornerll cornerlr cornerul cornerur} PCORNERW

create_cell {vdd_core_1 vdd_core_2} PVDD1W


create_cell {vss_core_1} PVSS1W


create_cell {vdd_io_1} PVDD2W


create_cell {vss_io_1} PVSS2W


#create NC pads
#create_cell {NC1} PVDD1W


#define corner pad locations
set_pad_physical_constraints -pad_name "cornerul" -side 1
set_pad_physical_constraints -pad_name "cornerur" -side 2
set_pad_physical_constraints -pad_name "cornerlr" -side 3
set_pad_physical_constraints -pad_name "cornerll" -side 4

#define signal and PG pad locations

#left side

set_pad_physical_constraints -pad_name "po16w4" -side 1 -order 1  		
set_pad_physical_constraints -pad_name "po16w3" -side 1 -order 2  		
set_pad_physical_constraints -pad_name "po16w2" -side 1 -order 3  		
set_pad_physical_constraints -pad_name "po16w1" -side 1 -order 4  		
set_pad_physical_constraints -pad_name "piw1"       -side 1 -order 5
set_pad_physical_constraints -pad_name "piw13"      -side 1 -order 6
set_pad_physical_constraints -pad_name "piw2"      -side 1 -order 7

#top side
set_pad_physical_constraints -pad_name "vdd_io_1"      -side 2 -order 1  		
set_pad_physical_constraints -pad_name "vss_io_1" -side 2 -order 2
set_pad_physical_constraints -pad_name "piw5" -side 2 -order 3
set_pad_physical_constraints -pad_name "piw6"        -side 2 -order 4
set_pad_physical_constraints -pad_name "piw7"        -side 2 -order 5
set_pad_physical_constraints -pad_name "piw8" -side 2 -order 6
set_pad_physical_constraints -pad_name "piw9" -side 2 -order 7  		


#right side
set_pad_physical_constraints -pad_name "piw3"   -side 3 -order 1
set_pad_physical_constraints -pad_name "piw4"   -side 3 -order 2	
set_pad_physical_constraints -pad_name "po16w10"   -side 3 -order 3		
set_pad_physical_constraints -pad_name "po16w9"   -side 3 -order 4		
set_pad_physical_constraints -pad_name "piw12"        -side 3 -order 5		
set_pad_physical_constraints -pad_name "piw11"        -side 3 -order 6		
set_pad_physical_constraints -pad_name "piw10"   -side 3 -order 7		

#bottom side
set_pad_physical_constraints -pad_name "po16w5" -side 4 -order 1  			
set_pad_physical_constraints -pad_name "po16w6" -side 4 -order 2 
set_pad_physical_constraints -pad_name "po16w7" -side 4 -order 3  
set_pad_physical_constraints -pad_name "po16w8"          -side 4 -order 4
set_pad_physical_constraints -pad_name "vss_core_1"          -side 4 -order 5
set_pad_physical_constraints -pad_name "vdd_core_2" -side 4 -order 6
set_pad_physical_constraints -pad_name "vdd_core_1" -side 4 -order 7 			 



