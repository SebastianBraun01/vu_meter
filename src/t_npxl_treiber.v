`timescale 1ns/1ns
module t_npxl_treiber;
  // Register initialisieren ======================================================================
  reg clk = 1'b0;
  reg en = 1'b0;
  reg [23:0] color_data = 24'b000000000000011100000000;

  wire [2:0] color_reg;
  wire npxl_data;
  wire rdy;


  // Testmodul einbinden ==========================================================================
  npxl_treiber #(.LEDS(5)) UUT(
    .i_clk(clk),         // 48MHz -> ~20ns
    .i_en(en),
    .i_color_data(color_data),
    .o_color_reg(color_reg),
    .o_npxl_data(npxl_data),
    .o_rdy(rdy)
  );


  // Taktsignal ===================================================================================
  always #10 clk = ~clk;

  always @(color_reg) begin
    if (color_reg > 2) color_data = 24'b000000000000011100000000;
    else color_data = 24'b000000000000000000000000;
  end
  

  // Testroutine ==================================================================================
  initial begin
    #2500 en = 1'b1;
    #2000 en = 1'b0;
    #250000 $stop;
  end
endmodule
