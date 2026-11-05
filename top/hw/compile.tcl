# Dr. Kaputa
# Quartus II compile script for DE1-SoC  board

# 1] name your project here
set project_name "top"

file delete -force project
file delete -force output_files
file mkdir project
cd project
load_package flow
project_new $project_name
set_global_assignment -name FAMILY Cyclone
set_global_assignment -name DEVICE 5CSEMA5F31C6 
set_global_assignment -name TOP_LEVEL_ENTITY top
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY ../output_files

# 2] include your relative path files here
set_global_assignment -name VHDL_FILE ../../src/top.vhd
set_global_assignment -name VHDL_FILE ../../src/add_sub.vhd
set_global_assignment -name VHDL_FILE ../../src/seven_seg.vhd
set_global_assignment -name VHDL_FILE ../../src/ABset.vhd
set_global_assignment -name VHDL_FILE ../../src/blipper.vhd
set_global_assignment -name VHDL_FILE ../../src/double_dabble.vhd
set_global_assignment -name VHDL_FILE ../../src/nsl.vhd
set_global_assignment -name VHDL_FILE ../../src/output_sel.vhd
set_global_assignment -name VHDL_FILE ../../src/synchronizer_1bit.vhd
set_global_assignment -name VHDL_FILE ../../src/synchronizer_9bit.vhd


# 3] set your pin constraints here
set_location_assignment PIN_AA14 -to reset_button
set_location_assignment PIN_AA15 -to butt_async
set_location_assignment PIN_AF14 -to clock

set_location_assignment PIN_V16 -to state_leds[0]
set_location_assignment PIN_W16 -to state_leds[1]
set_location_assignment PIN_V17 -to state_leds[2]
set_location_assignment PIN_V18 -to state_leds[3]

set_location_assignment PIN_AB12 -to num_async[0]
set_location_assignment PIN_AC12 -to num_async[1]
set_location_assignment PIN_AF9 -to num_async[2]
set_location_assignment PIN_AF10 -to num_async[3]
set_location_assignment PIN_AD11 -to num_async[4]
set_location_assignment PIN_AD12 -to num_async[5]
set_location_assignment PIN_AE11 -to num_async[6]
set_location_assignment PIN_AC9 -to num_async[7]
set_location_assignment PIN_AD10 -to num_async[8]

set_location_assignment PIN_AE26 -to hex1s[0]
set_location_assignment PIN_AE27 -to hex1s[1]
set_location_assignment PIN_AE28 -to hex1s[2]
set_location_assignment PIN_AG27 -to hex1s[3]
set_location_assignment PIN_AF28 -to hex1s[4]
set_location_assignment PIN_AG28 -to hex1s[5]
set_location_assignment PIN_AH28 -to hex1s[6]

set_location_assignment PIN_AJ29 -to hex10s[0]
set_location_assignment PIN_AH29 -to hex10s[1]
set_location_assignment PIN_AH30 -to hex10s[2]
set_location_assignment PIN_AG30 -to hex10s[3]
set_location_assignment PIN_AF29 -to hex10s[4]
set_location_assignment PIN_AF30 -to hex10s[5]
set_location_assignment PIN_AD27 -to hex10s[6]

set_location_assignment PIN_AB23 -to hex100s[0]
set_location_assignment PIN_AE29 -to hex100s[1]
set_location_assignment PIN_AD29 -to hex100s[2]
set_location_assignment PIN_AC28 -to hex100s[3]
set_location_assignment PIN_AD30 -to hex100s[4]
set_location_assignment PIN_AC29 -to hex100s[5]
set_location_assignment PIN_AC30 -to hex100s[6]


execute_flow -compile
project_close