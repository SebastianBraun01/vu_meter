`timescale 1ns/1ns
module t_uart_rx;
  localparam DELAY = 416 * 20;

  // Register initialisieren ======================================================================
  reg clk = 0;
  reg rx = 1;
  
  wire [7:0] data;
  wire valid;


  // Testmodule einbinden =========================================================================
  uart_rx #(.BAUD(115200), .WIDTH(8)) UUT(
    .i_clk(clk),
    .i_rx(rx),
    .o_data(data),
    .o_dv(valid)
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
    uart_write_byte(8'h37);
    @(posedge clk);

    #100;

    @(posedge clk);
    uart_write_byte(8'h03);
    @(posedge clk);

    $stop;
  end
endmodule
