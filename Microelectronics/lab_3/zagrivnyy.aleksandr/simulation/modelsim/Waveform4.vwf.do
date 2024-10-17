vcom -work work Waveform4.vwf.vht
vsim -voptargs=+acc -c -t 1ps -L maxii -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.d-trigger_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
