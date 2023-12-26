set lib [current_mw_lib]
remove_antenna_rules $lib
define_antenna_rule $lib -mode 4 -diode_mode 4 -metal_ratio 0 -cut_ratio 0
define_antenna_layer_rule $lib -mode 4 -layer "METAL1" -ratio 400 -diode_ratio {0.203 0 400.00 2200}
define_antenna_layer_rule $lib -mode 4 -layer "METAL2" -ratio 400 -diode_ratio {0.203 0 400.00 2200}
define_antenna_layer_rule $lib -mode 4 -layer "METAL3" -ratio 400 -diode_ratio {0.203 0 400.00 2200}
define_antenna_layer_rule $lib -mode 4 -layer "METAL4" -ratio 400 -diode_ratio {0.203 0 400.00 2200}
define_antenna_layer_rule $lib -mode 4 -layer "METAL5" -ratio 400 -diode_ratio {0.203 0 400.00 2200}
define_antenna_layer_rule $lib -mode 4 -layer "METAL6" -ratio 400 -diode_ratio {0.203 0 8000.00 30000}
define_antenna_layer_rule $lib -mode 4 -layer "VIA12" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule $lib -mode 4 -layer "VIA23" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule $lib -mode 4 -layer "VIA34" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule $lib -mode 4 -layer "VIA45" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule $lib -mode 4 -layer "VIA56" -ratio 20 -diode_ratio {0.203 0 83.33 75}
