`default_nettype none
module FFT #(parameter WIDTH = 8, parameter SAMPLES = 128) (
  input wire i_clk,

  input wire i_sink_write,
  input wire [WIDTH - 1:0] i_sink_real,
  input wire [WIDTH - 1:0] i_sink_cplx,
  output wire o_sink_empty,
  output wire o_sink_full,

  input wire i_source_strobe,
  output wire [WIDTH - 1:0] o_source_real,
  output wire [WIDTH - 1:0] o_source_cplx,
  output wire o_source_full,
  output wire o_source_empty
);

  // Parameter definieren =========================================================================
  localparam IDLE = 3'b000;
  localparam FFT_START = 3'b001;
  localparam FFT_FEED = 3'b010;
  localparam FFT_SYNCRO = 3'b011;
  localparam FFT_TAKE = 3'b100;
  localparam FFT_WAIT = 3'b101;

  // Register initialisieren ======================================================================
  reg [2:0] state;
  reg rst;
  reg [$clog2(SAMPLES):0] sink_addr;
  reg [$clog2(SAMPLES):0] source_addr;
	reg stm_write;
  reg fft_ce;
  reg [3:0] counter;

  wire sink_rw;
  wire source_rw;
  wire [(2 * WIDTH) - 1:0] fft_in;
  wire [(2 * WIDTH) - 1:0] fft_out;
  wire fft_sync;
  wire source_write;

  initial begin
    state = IDLE;
    rst = 1'b1;
    sink_addr = 0;
    source_addr = SAMPLES;
    stm_write = 1'b0;
    fft_ce = 1'b0;
    counter = 0;
  end


  // FFT Megafunktion und RAM =====================================================================
  fftmain FFT_MF(
    .i_clk(i_clk),
    .i_reset(rst),
    .i_ce(fft_ce),
    .i_sample(fft_in),	// 2*8 Bit
    .o_result(fft_out),	// 2*8 bit
    .o_sync(fft_sync)
  );

  RAM #(.WIDTH(2*WIDTH), .ADDR($clog2(SAMPLES))) sink_ram(
    .i_clk(i_clk),
    .i_rst(1'b1),
    .i_addr(sink_addr),
    .i_rw(sink_rw),
    .i_wen(i_sink_write),
    .i_data({i_sink_real, i_sink_cplx}),
    .o_data(fft_in)
  );

  RAM #(.WIDTH(2*WIDTH), .ADDR($clog2(SAMPLES) + 1)) source_ram(
    .i_clk(i_clk),
    .i_rst(1'b1),
    .i_addr(source_addr),
    .i_rw(source_rw),
    .i_wen(source_write),
    .i_data(fft_out),
    .o_data({o_source_real, o_source_cplx})
  );


  // Treiberlogik =================================================================================
  always @(posedge i_clk) begin
    case (state)

      IDLE: begin // ---------------------------------------------------------------------------
        if (sink_addr == SAMPLES && source_addr == SAMPLES) begin
          state <= FFT_START;
          sink_addr <= 0;
          source_addr <= 0;
        end
        else begin
          state <= IDLE;
          rst <= 1'b1;
          fft_ce <= 1'b0;
          stm_write <= 1'b0;
          counter <= 0;
        end
      end

      FFT_START: begin // --------------------------------------------------------------------------
        rst <= 1'b0;
        counter <= counter + 1;

        if (counter == 5) begin
          state <= FFT_FEED;
          fft_ce <= 1'b1;
          counter <= 0;
        end
        else begin
          state <= FFT_START;
          fft_ce <= 1'b0;
        end
      end

      FFT_FEED: begin  // -------------------------------------------------------------------------
        rst <= 1'b0;
        fft_ce <= 1'b1;

        if (sink_addr == SAMPLES) begin
          if (fft_sync == 1'b1) begin
            state <= FFT_TAKE;
            stm_write <= 1'b1;
            source_addr <= source_addr + 1;
          end
          else begin
            state <= FFT_FEED;
          end
        end
        else begin
          sink_addr <= sink_addr + 1;

          if (fft_sync == 1'b1) begin
            state <= FFT_SYNCRO;
            stm_write <= 1'b1;
          end
          else begin
            state <= FFT_FEED;
          end
        end
      end

      FFT_SYNCRO: begin // ------------------------------------------------------------------------
        fft_ce <= 1'b1;
        sink_addr <= sink_addr + 1;
        stm_write <= 1'b1;
        source_addr <= source_addr + 1;

        if (sink_addr == SAMPLES) begin
          state <= FFT_TAKE;
        end
        else begin
          state <= FFT_SYNCRO;
        end
      end

      FFT_TAKE: begin // --------------------------------------------------------------------------
        stm_write <= 1'b1;
        source_addr <= source_addr + 1;

        if (source_addr == SAMPLES) begin
          state <= FFT_WAIT;
          rst <= 1'b1;
          fft_ce <= 1'b0;
          sink_addr <= 0;
          source_addr <= 0;
          stm_write <= 1'b0;
        end
        else begin
          state <= FFT_TAKE;
        end
      end

      FFT_WAIT: begin // --------------------------------------------------------------------------
        rst <= 1'b1;
        fft_ce <= 1'b0;
        stm_write <= 1'b0;
        counter <= counter + 1;

        if (counter == 5) begin
          state <= IDLE;
          counter <= 0;
        end
        else begin
          state <= FFT_WAIT;
        end
      end

    endcase
  end

  always @(posedge i_clk) begin
    if (i_sink_write == 1'b1 && state == IDLE && sink_addr < SAMPLES) begin
      sink_addr <= sink_addr + 1;
    end
  end

	always @(posedge i_clk) begin
    if (i_source_strobe == 1'b1 && state == IDLE && source_addr < SAMPLES) begin
      source_addr <= source_addr + 1;
    end
  end

  // Assignments ==================================================================================
  assign sink_rw = (state == IDLE) ? 1'b1 : 1'b0;
  assign source_rw = (state == IDLE) ? 1'b0 : 1'b1;

  assign source_write = stm_write | fft_sync;
  
  assign o_sink_empty = (sink_addr == 0 && state == IDLE) ? 1'b1 : 1'b0;
  assign o_sink_full = (sink_addr == SAMPLES && state == IDLE) ? 1'b1 : 1'b0;
  assign o_source_empty = (source_addr == SAMPLES && state == IDLE) ? 1'b1 : 1'b0;
  assign o_source_full = (source_addr == 0 && state == IDLE) ? 1'b1 : 1'b0;

endmodule
