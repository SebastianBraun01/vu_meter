onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_level_test/clk
add wave -noupdate /t_level_test/rx
add wave -noupdate /t_level_test/rdy
add wave -noupdate -divider UART
add wave -noupdate /t_level_test/UUT/uart/state
add wave -noupdate -radix unsigned /t_level_test/UUT/uart/rx_data
add wave -noupdate -divider Neopixel
add wave -noupdate /t_level_test/UUT/controller/treiber/state
add wave -noupdate -radix unsigned /t_level_test/UUT/value_data
add wave -noupdate -radix unsigned /t_level_test/UUT/controller/treiber/bit_counter
add wave -noupdate -radix unsigned /t_level_test/UUT/controller/treiber/led_counter
add wave -noupdate /t_level_test/npxl_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 248
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
WaveRestoreZoom {0 ns} {4553651 ns}
