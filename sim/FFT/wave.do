onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_FFT/clk
add wave -noupdate /t_FFT/i
add wave -noupdate /t_FFT/UUT/rst
add wave -noupdate /t_FFT/UUT/state
add wave -noupdate /t_FFT/UUT/fft_ce
add wave -noupdate /t_FFT/UUT/fft_sync
add wave -noupdate -divider Sink
add wave -noupdate /t_FFT/sink_write
add wave -noupdate -radix hexadecimal /t_FFT/sink_data
add wave -noupdate -radix unsigned /t_FFT/UUT/sink_addr
add wave -noupdate -radix hexadecimal /t_FFT/UUT/sink_ram/register
add wave -noupdate -radix hexadecimal /t_FFT/UUT/fft_in
add wave -noupdate /t_FFT/sink_empty
add wave -noupdate /t_FFT/sink_full
add wave -noupdate -divider Source
add wave -noupdate /t_FFT/source_strobe
add wave -noupdate /t_FFT/UUT/source_write
add wave -noupdate -radix hexadecimal /t_FFT/source_data_real
add wave -noupdate -radix hexadecimal /t_FFT/source_data_cplx
add wave -noupdate -radix unsigned /t_FFT/UUT/source_addr
add wave -noupdate -radix hexadecimal -childformat {{{/t_FFT/UUT/source_ram/register[0]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[1]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[2]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[3]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[4]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[5]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[6]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[7]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[8]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[9]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[10]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[11]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[12]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[13]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[14]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[15]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[16]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[17]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[18]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[19]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[20]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[21]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[22]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[23]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[24]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[25]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[26]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[27]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[28]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[29]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[30]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[31]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[32]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[33]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[34]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[35]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[36]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[37]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[38]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[39]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[40]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[41]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[42]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[43]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[44]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[45]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[46]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[47]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[48]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[49]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[50]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[51]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[52]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[53]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[54]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[55]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[56]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[57]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[58]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[59]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[60]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[61]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[62]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[63]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[64]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[65]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[66]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[67]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[68]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[69]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[70]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[71]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[72]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[73]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[74]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[75]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[76]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[77]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[78]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[79]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[80]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[81]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[82]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[83]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[84]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[85]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[86]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[87]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[88]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[89]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[90]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[91]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[92]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[93]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[94]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[95]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[96]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[97]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[98]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[99]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[100]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[101]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[102]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[103]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[104]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[105]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[106]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[107]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[108]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[109]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[110]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[111]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[112]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[113]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[114]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[115]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[116]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[117]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[118]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[119]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[120]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[121]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[122]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[123]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[124]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[125]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[126]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[127]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[128]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[129]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[130]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[131]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[132]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[133]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[134]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[135]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[136]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[137]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[138]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[139]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[140]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[141]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[142]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[143]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[144]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[145]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[146]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[147]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[148]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[149]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[150]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[151]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[152]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[153]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[154]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[155]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[156]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[157]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[158]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[159]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[160]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[161]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[162]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[163]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[164]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[165]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[166]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[167]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[168]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[169]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[170]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[171]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[172]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[173]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[174]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[175]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[176]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[177]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[178]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[179]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[180]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[181]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[182]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[183]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[184]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[185]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[186]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[187]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[188]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[189]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[190]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[191]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[192]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[193]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[194]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[195]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[196]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[197]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[198]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[199]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[200]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[201]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[202]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[203]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[204]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[205]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[206]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[207]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[208]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[209]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[210]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[211]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[212]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[213]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[214]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[215]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[216]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[217]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[218]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[219]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[220]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[221]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[222]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[223]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[224]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[225]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[226]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[227]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[228]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[229]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[230]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[231]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[232]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[233]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[234]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[235]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[236]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[237]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[238]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[239]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[240]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[241]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[242]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[243]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[244]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[245]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[246]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[247]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[248]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[249]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[250]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[251]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[252]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[253]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[254]} -radix hexadecimal} {{/t_FFT/UUT/source_ram/register[255]} -radix hexadecimal}} -subitemconfig {{/t_FFT/UUT/source_ram/register[0]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[1]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[2]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[3]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[4]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[5]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[6]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[7]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[8]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[9]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[10]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[11]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[12]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[13]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[14]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[15]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[16]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[17]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[18]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[19]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[20]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[21]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[22]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[23]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[24]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[25]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[26]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[27]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[28]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[29]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[30]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[31]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[32]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[33]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[34]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[35]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[36]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[37]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[38]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[39]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[40]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[41]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[42]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[43]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[44]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[45]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[46]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[47]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[48]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[49]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[50]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[51]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[52]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[53]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[54]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[55]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[56]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[57]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[58]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[59]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[60]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[61]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[62]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[63]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[64]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[65]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[66]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[67]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[68]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[69]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[70]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[71]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[72]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[73]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[74]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[75]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[76]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[77]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[78]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[79]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[80]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[81]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[82]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[83]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[84]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[85]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[86]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[87]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[88]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[89]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[90]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[91]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[92]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[93]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[94]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[95]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[96]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[97]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[98]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[99]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[100]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[101]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[102]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[103]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[104]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[105]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[106]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[107]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[108]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[109]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[110]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[111]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[112]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[113]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[114]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[115]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[116]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[117]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[118]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[119]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[120]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[121]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[122]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[123]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[124]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[125]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[126]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[127]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[128]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[129]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[130]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[131]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[132]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[133]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[134]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[135]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[136]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[137]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[138]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[139]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[140]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[141]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[142]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[143]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[144]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[145]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[146]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[147]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[148]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[149]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[150]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[151]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[152]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[153]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[154]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[155]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[156]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[157]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[158]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[159]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[160]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[161]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[162]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[163]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[164]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[165]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[166]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[167]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[168]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[169]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[170]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[171]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[172]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[173]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[174]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[175]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[176]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[177]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[178]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[179]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[180]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[181]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[182]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[183]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[184]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[185]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[186]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[187]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[188]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[189]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[190]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[191]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[192]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[193]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[194]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[195]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[196]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[197]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[198]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[199]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[200]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[201]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[202]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[203]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[204]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[205]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[206]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[207]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[208]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[209]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[210]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[211]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[212]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[213]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[214]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[215]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[216]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[217]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[218]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[219]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[220]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[221]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[222]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[223]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[224]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[225]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[226]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[227]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[228]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[229]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[230]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[231]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[232]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[233]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[234]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[235]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[236]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[237]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[238]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[239]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[240]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[241]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[242]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[243]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[244]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[245]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[246]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[247]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[248]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[249]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[250]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[251]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[252]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[253]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[254]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/source_ram/register[255]} {-height 15 -radix hexadecimal}} /t_FFT/UUT/source_ram/register
add wave -noupdate -radix hexadecimal -childformat {{{/t_FFT/UUT/fft_out[15]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[14]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[13]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[12]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[11]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[10]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[9]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[8]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[7]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[6]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[5]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[4]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[3]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[2]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[1]} -radix hexadecimal} {{/t_FFT/UUT/fft_out[0]} -radix hexadecimal}} -subitemconfig {{/t_FFT/UUT/fft_out[15]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[14]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[13]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[12]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[11]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[10]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[9]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[8]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[7]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[6]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[5]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[4]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[3]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[2]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[1]} {-height 15 -radix hexadecimal} {/t_FFT/UUT/fft_out[0]} {-height 15 -radix hexadecimal}} /t_FFT/UUT/fft_out
add wave -noupdate /t_FFT/source_empty
add wave -noupdate /t_FFT/source_full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12541 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 236
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
WaveRestoreZoom {0 ns} {58023 ns}
