onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_uart_rx/clk
add wave -noupdate /t_uart_rx/valid
add wave -noupdate /t_uart_rx/UUT/state
add wave -noupdate -divider Daten
add wave -noupdate /t_uart_rx/rx
add wave -noupdate -radix unsigned -childformat {{{/t_uart_rx/UUT/bit_counter[2]} -radix unsigned} {{/t_uart_rx/UUT/bit_counter[1]} -radix unsigned} {{/t_uart_rx/UUT/bit_counter[0]} -radix unsigned}} -subitemconfig {{/t_uart_rx/UUT/bit_counter[2]} {-height 15 -radix unsigned} {/t_uart_rx/UUT/bit_counter[1]} {-height 15 -radix unsigned} {/t_uart_rx/UUT/bit_counter[0]} {-height 15 -radix unsigned}} /t_uart_rx/UUT/bit_counter
add wave -noupdate -radix hexadecimal -childformat {{{/t_uart_rx/UUT/rx_data[7]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[6]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[5]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[4]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[3]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[2]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[1]} -radix unsigned} {{/t_uart_rx/UUT/rx_data[0]} -radix unsigned}} -subitemconfig {{/t_uart_rx/UUT/rx_data[7]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[6]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[5]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[4]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[3]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[2]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[1]} {-radix unsigned} {/t_uart_rx/UUT/rx_data[0]} {-radix unsigned}} /t_uart_rx/UUT/rx_data
add wave -noupdate -radix hexadecimal /t_uart_rx/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {36047 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 216
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
WaveRestoreZoom {0 ns} {176936 ns}
