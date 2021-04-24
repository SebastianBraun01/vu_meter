onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_npxl_treiber/clk
add wave -noupdate /t_npxl_treiber/en
add wave -noupdate /t_npxl_treiber/rdy
add wave -noupdate /t_npxl_treiber/UUT/state
add wave -noupdate -divider Farbdaten
add wave -noupdate -radix hexadecimal /t_npxl_treiber/color_reg
add wave -noupdate /t_npxl_treiber/color_data
add wave -noupdate -divider Steuerung
add wave -noupdate -radix unsigned /t_npxl_treiber/UUT/bit_counter
add wave -noupdate -radix unsigned /t_npxl_treiber/UUT/led_counter
add wave -noupdate /t_npxl_treiber/npxl_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {221906 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {267225 ns}
