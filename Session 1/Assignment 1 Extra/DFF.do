vlib work
vlog dff.v dff_TB.sv dff_TB_2.sv  +cover
vsim -voptargs=+acc work.dff_TB -cover
add wave *
coverage save dff_TB.ucdb -onexit
run -all

#vsim -voptargs=+acc work.dff_TB_2 -cover
#add wave *
#coverage save dff_TB_2.ucdb -onexit
#run -all

