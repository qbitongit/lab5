vlib work
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../../src/add_sub.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/ABset.vhd
vcom -93 -work work ../../src/blipper.vhd
vcom -93 -work work ../../src/double_dabble.vhd
vcom -93 -work work ../../src/nsl.vhd
vcom -93 -work work ../../src/output_sel.vhd
vcom -93 -work work ../../src/synchronizer_1bit.vhd
vcom -93 -work work ../../src/synchronizer_9bit.vhd


vcom -93 -work work ../src/top_tb.vhd
vsim -voptargs=+acc top_tb
do wave.do
run 5000 ms
