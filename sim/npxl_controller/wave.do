onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_npxl_controller/clk
add wave -noupdate /t_npxl_controller/send
add wave -noupdate /t_npxl_controller/rdy
add wave -noupdate /t_npxl_controller/UUT/treiber/state
add wave -noupdate -divider Data
add wave -noupdate -radix unsigned /t_npxl_controller/UUT/color_reg
add wave -noupdate -radix unsigned /t_npxl_controller/UUT/color_addr
add wave -noupdate /t_npxl_controller/UUT/speicher/register
add wave -noupdate /t_npxl_controller/UUT/color_data
add wave -noupdate -divider Neopixel
add wave -noupdate -radix unsigned /t_npxl_controller/value
add wave -noupdate -radix unsigned /t_npxl_controller/UUT/treiber/bit_counter
add wave -noupdate -radix unsigned /t_npxl_controller/UUT/treiber/led_counter
add wave -noupdate /t_npxl_controller/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
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
WaveRestoreZoom {0 ns} {2100263 ns}
