`default_nettype none
module uart_rx #(parameter BAUD = 115200, parameter WIDTH = 8) (
  input wire i_clk,    // 48MHz -> ~20ns
  input wire i_rx,
  output reg [WIDTH - 1:0] o_data,
  output reg o_dv
);

// Parameter ======================================================================================
localparam BAUD_CLK = 48000000 / BAUD;

localparam IDLE = 2'b00;
localparam RX_START = 2'b01;
localparam RX_DATA = 2'b10;
localparam RX_STOP = 2'b11;


// Register initialisieren ========================================================================
reg [1:0] state;
reg [9:0] counter;
reg [2:0] bit_counter;
reg [WIDTH - 1:0] rx_data;

initial begin
  state = 0;
  counter = 0;
  bit_counter = 0;
  rx_data = 'b0;
  o_data = 'b0;
  o_dv = 1'b1;
end


// Automatenlogik =================================================================================
always @(posedge i_clk) begin
  case (state)
    
    IDLE: begin // --------------------------------------------------------------------------------
      counter <= 0;
      bit_counter <= 0;
      rx_data <= 'b0;
      o_dv <= 1'b1;

      if (i_rx == 1'b0) state <= RX_START;
      else state <= IDLE;
    end

    RX_START: begin // ----------------------------------------------------------------------------
      if (counter < (BAUD_CLK - 1) / 2) begin
        counter <= counter + 1;
        state <= RX_START;
      end
      else begin
        if (i_rx == 1'b0) begin
          counter <= 0;
          o_dv <= 1'b0;
          state <= RX_DATA;
        end
        else state <= IDLE;
      end
    end

    RX_DATA: begin // -----------------------------------------------------------------------------
      if (counter < BAUD_CLK - 1) begin
        counter <= counter + 1;
        state <= RX_DATA;
      end
      else begin
        rx_data[bit_counter] <= i_rx;
        counter <= 0;

        if (bit_counter < 7) begin
          bit_counter <= bit_counter + 1;
          state <= RX_DATA;
        end
        else begin
          bit_counter <= 0;
          state <= RX_STOP;
        end
      end
    end

    RX_STOP: begin // -----------------------------------------------------------------------------
      if (counter < BAUD_CLK - 1) begin
        counter <= counter + 1;
        state <= RX_STOP;
      end
      else begin
        counter <= 0;
        o_data <= rx_data;
        state <= IDLE;
      end
    end

  endcase
end
  
endmodule
