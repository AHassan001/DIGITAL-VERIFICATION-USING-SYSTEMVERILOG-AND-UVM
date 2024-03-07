vlib work
vlog ALU_4_bit.v ALU_4_bit_TB.sv   +cover
vsim -voptargs=+acc work.ALU_4_bit_TB -cover
add wave *
coverage save ALU_4_bit_TB.ucdb -onexit
run -all


