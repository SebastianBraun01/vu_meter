`timescale 1ns/1ns
module t_level_test;
  localparam DELAY = 416 * 20;

  // Register initialisieren ======================================================================
  reg clk = 0;
  reg rx = 1;

  wire npxl_data;
  wire rdy;


  // Testmodule einbinden =========================================================================
  level_test UUT(
    .i_clk(clk),
    .i_rx(rx),
    .o_npxl_data(npxl_data),
    .o_rdy(rdy)
  );


  // Tasks definieren =============================================================================
  task uart_write_byte;
  input [7:0] i_data;
  integer i;
  begin
    rx = 0;
    #(DELAY);
    #1000;

    for (i = 0; i < 8; i = i + 1) begin
      rx = i_data[i];
      #(DELAY);
    end

    rx = 1;
    #(DELAY);
  end
  endtask


  // Taktsignal ===================================================================================
  always #10 clk = ~clk;


  // Testroutine ==================================================================================
  initial begin
    @(posedge clk);
    uart_write_byte(8'd3);
    @(posedge clk);

    #1000000;

    @(posedge clk);
    uart_write_byte(8'd11);
    @(posedge clk);

    #1000000;

    @(posedge clk);
    uart_write_byte(8'd20);
    @(posedge clk);

    #1000000;

    @(posedge clk);
    uart_write_byte(8'd0);
    @(posedge clk);

    #1000000;

    $stop;
  end
endmodule
