`timescale 1ns/1ns

module t_ROM;

  reg clk = 0;
  reg [7:0] addr = 0;
  reg ren = 0;
  
  wire [23:0] data;

  integer i;

  ROM #(.ADDR(256), .ADDR_LINES(8)) UUT(
    .i_clk(clk),
    .i_addr(addr),
    .i_ren(ren),
    .o_data(data)
  );

  // Taktsignal
  always begin
    #10 clk <= ~clk;
  end

  initial begin
    #100 ren = 1;
    for (i = 0; i < 256; i = i + 1) #50 addr = i;
    #100 ren = 0;
    #100 $finish;
  end

endmodule
