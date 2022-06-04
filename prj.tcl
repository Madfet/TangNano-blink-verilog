set_device -name GW1N-1 GW1N-LV1QN48C6/I5
set_option -output_base_name tangnano-blink-verilog
set_option -top_module blink

add_file [file normalize src/blink.v]
add_file [file normalize src/blink.cst]
add_file [file normalize synthesize.cfg]

run syn
run pnr
