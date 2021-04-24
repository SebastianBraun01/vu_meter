onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_ROM/clk
add wave -noupdate /t_ROM/i
add wave -noupdate -radix unsigned -childformat {{{/t_ROM/addr[7]} -radix unsigned} {{/t_ROM/addr[6]} -radix unsigned} {{/t_ROM/addr[5]} -radix unsigned} {{/t_ROM/addr[4]} -radix unsigned} {{/t_ROM/addr[3]} -radix unsigned} {{/t_ROM/addr[2]} -radix unsigned} {{/t_ROM/addr[1]} -radix unsigned} {{/t_ROM/addr[0]} -radix unsigned}} -subitemconfig {{/t_ROM/addr[7]} {-height 15 -radix unsigned} {/t_ROM/addr[6]} {-height 15 -radix unsigned} {/t_ROM/addr[5]} {-height 15 -radix unsigned} {/t_ROM/addr[4]} {-height 15 -radix unsigned} {/t_ROM/addr[3]} {-height 15 -radix unsigned} {/t_ROM/addr[2]} {-height 15 -radix unsigned} {/t_ROM/addr[1]} {-height 15 -radix unsigned} {/t_ROM/addr[0]} {-height 15 -radix unsigned}} /t_ROM/addr
add wave -noupdate /t_ROM/ren
add wave -noupdate -divider Daten
add wave -noupdate /t_ROM/UUT/register
add wave -noupdate /t_ROM/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13047 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 130
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
WaveRestoreZoom {0 ns} {13755 ns}
