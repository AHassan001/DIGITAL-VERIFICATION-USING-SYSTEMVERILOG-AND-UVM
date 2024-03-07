vlib work
vlog priority_enc.v priority_enc_TB.sv   +cover
vsim -voptargs=+acc work.priority_enc_TB -cover
add wave *
coverage save priority_enc_TB.ucdb -onexit
run -all


