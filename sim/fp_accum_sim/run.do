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
vlog -work work -sv ../../src/floating_point_accum.sv


vlog -work work -sv ./fp_accum_tb.sv
############################################################################
# run simulation
############################################################################
#vsim -gui -novopt work.fp_accum_tb
vsim -gui -voptargs="+acc" work.fp_accum_tb
do ./wave_current.do
run -all
