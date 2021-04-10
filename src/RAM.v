module RAM #(parameter WIDTH = 8, parameter ADDR = 8) (
  input i_clk,
  input [ADDR - 1:0] i_addr,
  input i_rw,       // R=0, W=1
  input i_wen,
  inout wire [WIDTH - 1:0] io_data
);

  // Register initialisieren ======================================================================
  integer i;
  reg [WIDTH - 1:0] register [0:2**ADDR - 1];
  reg [WIDTH - 1:0] buffer;
  
  initial begin
    for (i = 0; i < 2**ADDR; i = i + 1) register[i] = 'b0;
  end


  // Speicherlogik ================================================================================
  always @(posedge i_clk) begin
    if (i_rw == 1) begin
      if (i_wen == 1) begin
        register[i_addr] <= io_data;
      end
    end
  end


  // IO Assignment ================================================================================
  assign io_data = i_rw ? 'bZ : register[i_addr];

endmodule
