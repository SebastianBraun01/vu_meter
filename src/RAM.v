module RAM #(parameter BREITE = 8, parameter TIEFE = 8) (
  input i_clk,
  input [TIEFE-1:0] i_addr,
  input i_rw,       // R=0, W=1
  input i_write,
  input wire [BREITE-1:0] i_data,
  output wire [BREITE-1:0] o_data
);

  reg [BREITE-1:0] register [0:2**TIEFE-1];
  reg [BREITE-1:0] buffer;
  integer i;

  initial begin
    for (i = 0; i < 2**TIEFE; i = i + 1) register[i] = 0;
    buffer = 0;
  end

  always @(posedge i_clk) begin
    if (i_rw == 1) begin
      if (i_write == 1) begin
        register[i_addr] <= i_data;
      end
    end
    else begin
      buffer <= register[i_addr];
    end
  end

  assign o_data = i_rw ? 'bZ : buffer;

endmodule
