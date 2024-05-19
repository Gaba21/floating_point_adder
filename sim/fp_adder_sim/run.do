quit -sim
vlib work
vmap work work
vdel -all -lib work
vlib work
vmap work work

############################################################################
# source
############################################################################

vlog -work work ../../src/lib/Float32Add.v
vlog -work work -sv ../../src/floating_point_adder.sv


vlog -work work -sv ./fp_adder_tb.sv

############################################################################
# run simulation
############################################################################
#vsim -gui -novopt work.fp_adder_tb
vsim -gui -voptargs="+acc" work.fp_adder_tb
do ./wave_current.do
run -all
