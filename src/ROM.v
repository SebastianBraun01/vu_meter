`default_nettype none
module ROM #(parameter ADDR = 256) (
  input wire i_clk,
  input wire [$clog2(ADDR) - 1:0] i_addr,
  input wire i_ren,
  output reg [23:0] o_data
);

  integer i;
  reg [23:0] register [0:ADDR - 1];

  // ROM auf Null setzen und Daten schreiben ======================================================
  initial begin
    for (i = 0; i < ADDR; i = i + 1) register[i] = 'b0;

    // Rote Anzeige
    register[0] = 24'b000000000000111100000000;
    register[1] = 24'b000000000000111100000000;
    register[2] = 24'b000000000000111100000000;
    register[3] = 24'b000000000000111100000000;
    register[4] = 24'b000000000000111100000000;
    register[5] = 24'b000000000000111100000000;
    register[6] = 24'b000000000000111100000000;
    register[7] = 24'b000000000000111100000000;
    register[8] = 24'b000000000000111100000000;
    register[9] = 24'b000000000000111100000000;
    register[10] = 24'b000000000000111100000000;
    register[11] = 24'b000000000000111100000000;
    register[12] = 24'b000000000000111100000000;
    register[13] = 24'b000000000000111100000000;
    register[14] = 24'b000000000000111100000000;
    register[15] = 24'b000000000000111100000000;
    register[16] = 24'b000000000000111100000000;
    register[17] = 24'b000000000000111100000000;
    register[18] = 24'b000000000000111100000000;
    register[19] = 24'b000000000000111100000000;
  end


  // Datenzugang ==================================================================================
  always @(posedge i_clk) begin
    if (i_ren == 1) o_data <= register[i_addr];
    else o_data <= 'bZ;
  end

endmodule
