module npxl_controller (
  input i_clk,
  input i_send,
  input i_toggle,
  output wire o_npxl_data,
  output wire o_rdy
);

  wire [23:0] color_data;
  wire [7:0] color_addr;
  wire [7:0] color_reg;
  wire r;
  wire inverse_clk;

  // Module einbinden =============================================================================
  npxl_treiber #(.LEDS(20)) treiber(
    .i_clk(i_clk),         // 48MHz -> ~20ns
    .i_en(i_send),
    .i_color_data(color_data),
    .o_color_reg(color_reg),
    .o_npxl_data(o_npxl_data),
    .o_rdy(o_rdy)
  );

  ROM rom_rot_blau(
    .i_clk(inverse_clk),
    .i_addr(color_addr),
    .i_ren(r),
    .o_data(color_data)
  );

  // Assignments ==================================================================================
  assign r = ~o_rdy;
  assign inverse_clk = ~i_clk;
  assign color_addr = i_toggle ? color_reg + 100 : color_reg;

endmodule
