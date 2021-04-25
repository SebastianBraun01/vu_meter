`default_nettype none
module RAM #(parameter WIDTH = 8, parameter ADDR = 8) (
  input wire i_clk,
  input wire i_rst,
  input wire [ADDR - 1:0] i_addr,
  input wire i_rw,       // R=0, W=1
  input wire i_wen,
  input wire [WIDTH - 1:0] i_data,
  output wire [WIDTH - 1:0] o_data
);

  // Register initialisieren ======================================================================
  integer i;
  
  reg [WIDTH - 1:0] register [0:2**ADDR - 1];
  reg [WIDTH - 1:0] buffer;


  // Tasks definieren =============================================================================
  task reset_mem;
    integer i;
    for (i = 0; i < 2**ADDR; i = i + 1) register[i] = 'b0;
  endtask
  
  initial begin
    reset_mem;
  end


  // Speicherlogik ================================================================================
  always @(posedge i_clk) begin
    if (i_rst == 1'b1) begin
      if (i_rw == 1'b1) begin
        if (i_wen == 1'b1) begin
          register[i_addr] <= i_data;
        end
      end
    end
    else begin
      reset_mem;
    end
  end


  // IO Assignment ================================================================================
  assign o_data = i_rw ? 'bZ : register[i_addr];

endmodule
