module npxl_controller #(parameter LEDS = 20, parameter ADDR = 8) (
  input i_clk,
  input i_send,
  input [ADDR - 1:0] i_value,
  output wire o_npxl_data,
  output wire o_rdy
);

  // Register initialisieren ======================================================================
  reg [ADDR - 1:0] value_reg;

  wire [23:0] color_data;
  wire [ADDR - 1:0] color_addr;
  wire [ADDR - 1:0] color_reg;
  wire r;
  wire inverse_clk;

  initial begin
    value_reg = 0;
  end


  // Module einbinden =============================================================================
  npxl_treiber #(.LEDS(LEDS), .ADDR(ADDR)) treiber(
    .i_clk(i_clk),         // 48MHz -> ~20ns
    .i_en(i_send),
    .i_color_data(color_data),
    .o_color_reg(color_reg),
    .o_npxl_data(o_npxl_data),
    .o_rdy(o_rdy)
  );

  ROM #(.ADDR(2 * LEDS), .ADDR_LINES(ADDR)) speicher(
    .i_clk(inverse_clk),
    .i_addr(color_addr),
    .i_ren(r),
    .o_data(color_data)
  );


  // Steuerung ====================================================================================
  always @(posedge i_clk) begin
    if (i_send == 1'b1) begin
      value_reg <= i_value;
    end
  end


  // Assignments ==================================================================================
  assign r = ~o_rdy;
  assign inverse_clk = ~i_clk;
  assign color_addr = (color_reg >= value_reg) ? color_reg + LEDS : color_reg;

endmodule
