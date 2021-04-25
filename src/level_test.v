`default_nettype none
module level_test (
  input wire i_clk,
  input wire i_rx,
  output wire o_npxl_data,
  output wire o_rdy
);

  // Register Initialisieren ======================================================================
  reg trigger_condition;
  reg trigger;

  wire [7:0] value_data;
  wire npxl_rdy;
  wire data_rdy;

  initial begin
    trigger_condition = 1'b1;
    trigger = 1'b0;
  end


  // Module einbinden =============================================================================
  npxl_controller #(.LEDS(20), .ADDR(8)) controller(
    .i_clk(i_clk),
    .i_send(trigger),
    .i_value(value_data),
    .o_npxl_data(o_npxl_data),
    .o_rdy(npxl_rdy)
  );

  uart_rx #(.BAUD(115200), .WIDTH(8)) uart(
    .i_clk(i_clk),
    .i_rx(i_rx),
    .o_data(value_data),
    .o_dv(data_rdy)
  );


  // Automatenlogik ===============================================================================
  always @(posedge i_clk) begin
    if (data_rdy == 1'b1 && trigger_condition == 1'b0) begin
      trigger <= 1'b1;
      trigger_condition <= data_rdy;
    end
    else begin
      trigger <= 1'b0;
      trigger_condition <= data_rdy;
    end
  end


  // Assignments ==================================================================================
  assign o_rdy = npxl_rdy & data_rdy;


endmodule
