`timescale 1ns/1ns
module t_ROM;
  // Register initialisieren ======================================================================
  integer i;

  reg clk = 0;
  reg [7:0] addr = 0;
  reg ren = 0;
  
  wire [23:0] data;

  
  // Testmodul einbinden ==========================================================================
  ROM #(.ADDR(256)) UUT(
    .i_clk(clk),
    .i_addr(addr),
    .i_ren(ren),
    .o_data(data)
  );


  // Taktsignal ===================================================================================
  always #10 clk <= ~clk;


  // Testroutine ==================================================================================
  initial begin
    #100 ren = 1;
    for (i = 0; i < 256; i = i + 1) #50 addr = i + 1;
    #100 ren = 0;
    #100 $stop;
  end
endmodule
