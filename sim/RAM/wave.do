onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_RAM/clk
add wave -noupdate /t_RAM/rst
add wave -noupdate /t_RAM/rw
add wave -noupdate /t_RAM/write
add wave -noupdate -divider Daten
add wave -noupdate -radix unsigned /t_RAM/addr
add wave -noupdate /t_RAM/UUT/register
add wave -noupdate -radix unsigned /t_RAM/data_in
add wave -noupdate -radix unsigned /t_RAM/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {383 ns}
