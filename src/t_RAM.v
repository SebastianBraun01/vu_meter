`timescale 1ns/1ns

module t_RAM;

  reg clk = 0;
  reg [1:0] addr = 2'b00;
  reg rw = 0;
  reg write = 0;
  reg [1:0] data_in = 2'b00;

  wire [1:0] data_out;

  RAM #(.BREITE(2), .TIEFE(2)) UUT(
    .i_clk(clk),
    .i_addr(addr),
    .i_rw(rw),       // R=0, W=1
    .i_write(write),
    .i_data(data_in),
    .o_data(data_out)
  );

  // Taktsignal
  always begin
    #10 clk = ~clk;
  end

  initial begin
    #5 rw = 1;

    data_in = 2'b01;
    addr = 2'b01;
    #5 write = 1;
    #30 write = 0;

    data_in = 2'b10;
    addr = 2'b10;
    #5 write = 1;
    #30 write = 0;

    data_in = 2'b11;
    addr = 2'b11;
    #5 write = 1;
    #30 write = 0;

    addr = 2'b00;
    rw = 0;

    #50 addr = 2'b01;
    #50 addr = 2'b10;
    #50 addr = 2'b11;
    #50 $finish;
  end

endmodule
