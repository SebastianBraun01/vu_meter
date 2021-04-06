module npxl_treiber #(parameter LEDS = 20) (
  input i_clk,         // 48MHz -> ~20ns
  input i_en,
  input [23:0] i_color_data,
  output reg [7:0] o_color_reg,
  output reg o_npxl_data,
  output reg o_rdy
);

  // Parameter ====================================================================================
  localparam IDLE = 2'b00;
  localparam FETCH = 2'b01;
  localparam SHIFT_OUT = 2'b10;
  localparam CONFIRM = 2'b11;


  // Register initialisieren ======================================================================
  reg [1:0] state;
  reg [23:0] color_data;
  reg [11:0] counter;
  reg [7:0] bit_counter;
  reg [7:0] led_counter;

  initial begin
    state = IDLE;
    color_data = 0;
    counter = 0;
    bit_counter = 24;
    led_counter = LEDS;
    o_color_reg = 0;
    o_npxl_data = 1'b0;
    o_rdy = 1'b1;
  end


  // Automatenlogik ===============================================================================
  always @(posedge i_clk) begin
    case (state)

      IDLE: begin // ------------------------------------------------------------------------------
        // Warten bis i_en ausgelöst wird
        counter <= 0;
        bit_counter <= 24;
        led_counter <= LEDS;
        o_npxl_data <= 1'b0;
        o_rdy <= 1'b1;
        
        if (i_en == 1'b1) begin
          state <= FETCH;
          o_color_reg <= LEDS - led_counter;
          o_rdy <= 1'b0;
        end
      end

      FETCH: begin // -----------------------------------------------------------------------------
        color_data <= i_color_data;
        led_counter <= led_counter - 1;
        state <= SHIFT_OUT;
      end

      SHIFT_OUT: begin // -------------------------------------------------------------------------
        if (color_data[bit_counter - 1] == 0) begin
          if (counter < 20) o_npxl_data <= 1'b1;
          else o_npxl_data <= 1'b0;
        end
        else begin
          if (counter < 40) o_npxl_data <= 1'b1;
          else o_npxl_data <= 1'b0;
        end

        if (counter == 60) begin
          counter <= 0;
          bit_counter <= bit_counter - 1;
        end
        else counter <= counter + 1;

        if (bit_counter == 0) begin
          counter <= 0;
          bit_counter <= 24;
          o_color_reg <= LEDS - led_counter;
          
          if (led_counter == 0) begin
            led_counter <= LEDS;
            state <= CONFIRM;
          end
          else begin
            state <= FETCH;
          end
        end
      end

      CONFIRM: begin // ---------------------------------------------------------------------------
        counter <= counter + 1;
        o_color_reg <= LEDS - led_counter;
        o_npxl_data <= 1'b0;

        if (counter == 3600) begin
          state <= IDLE;
          counter <= 0;
        end
      end

    endcase
  end
  
endmodule
