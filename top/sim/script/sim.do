vlib work
vcom -93 -work work ../../src/calc.vhd
vcom -93 -work work ../../src/add_sub.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/seven_seg_3bit.vhd
vcom -93 -work work ../../src/synchronizer_3bit.vhd
vcom -93 -work work ../../src/synchronizer_1bit.vhd

vcom -93 -work work ../src/calc_tb.vhd
vsim -voptargs=+acc calc_tb
do wave.do
run 10000 ns
