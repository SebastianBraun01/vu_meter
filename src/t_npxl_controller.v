`timescale 1ns/1ns

module t_npxl_controller;

  reg clk = 0;
  reg send = 0;
  reg toggle = 0;
  reg counter = 0;

  wire data_out;
  wire rdy;

  npxl_controller UUT(
    .i_clk(clk),
    .i_send(send),
    .i_toggle(toggle),
    .o_npxl_data(data_out),
    .o_rdy(rdy)
  );

  // Taktsignal
  always begin
    #10 clk <= ~clk;
  end

  initial begin
    #100 send = 1;
    #50 send = 0;

    #1000000;

    toggle = 1;
    #50 send = 1;
    #50 send = 0;

    #1000000;
    
    $finish;
  end

endmodule
