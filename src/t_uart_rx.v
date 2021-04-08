`timescale 1ns/1ns

module t_uart_rx;

  localparam DELAY = 416 * 20;
  
  reg clk = 0;
  reg rx = 1;
  
  wire [7:0] data;
  wire valid;

  uart_rx #(.BAUD(115200)) UUT(
    .i_clk(clk),
    .i_rx(rx),
    .o_data(data),
    .o_dv(valid)
  );

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

  always begin
    #10 clk = ~clk;
  end

  initial begin
    @(posedge clk);
    uart_write_byte(8'h37);
    @(posedge clk);

    #100;

    @(posedge clk);
    uart_write_byte(8'h03);
    @(posedge clk);

    $finish;
  end

endmodule
