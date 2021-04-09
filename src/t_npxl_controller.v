`timescale 1ns/1ns

module t_npxl_controller;

  reg clk = 0;
  reg send = 0;
  reg [7:0] value = 0;

  wire data_out;
  wire rdy;

  npxl_controller #(.LEDS(20), .ADDR(8)) UUT(
    .i_clk(clk),
    .i_send(send),
    .i_value(value),
    .o_npxl_data(data_out),
    .o_rdy(rdy)
  );

  // Taktsignal
  always begin
    #10 clk <= ~clk;
  end

  initial begin
    value = 3;
    #100 send = 1;
    #50 send = 0;

    #1000000;

    value = 11;
    #50 send = 1;
    #50 send = 0;

    #1000000;
    
    $finish;
  end

endmodule
