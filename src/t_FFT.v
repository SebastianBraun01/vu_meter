`timescale 1ns/1ns
module t_FFT;
  localparam SAMPLES = 512;

  reg clk = 0;
  reg sink_write = 0;
  reg [7:0] sink_data = 0;
  reg source_strobe = 0;
  reg [7:0] memory [0:SAMPLES - 1];

  wire sink_empty;
  wire sink_full;
  wire [7:0] source_data_real;
  wire [7:0] source_data_cplx;
  wire source_empty;
  wire source_full;

  integer i;
  integer f;

  FFT #(.WIDTH(8), .SAMPLES(SAMPLES)) UUT(
    .i_clk(clk),
    .i_sink_write(sink_write),
    .i_sink_real(sink_data),
    .i_sink_cplx(8'b00000000),
    .o_sink_empty(sink_empty),
    .o_sink_full(sink_full),
    .i_source_strobe(source_strobe),
    .o_source_real(source_data_real),
    .o_source_cplx(source_data_cplx),
    .o_source_full(source_full),
    .o_source_empty(source_empty)
  );

  task insert_data(
    input [7:0] index
  );
    begin
      @(negedge clk);
      sink_data <= memory[index];
      sink_write <= 1'b1;
      @(negedge clk);
      sink_write <= 1'b0;
    end
  endtask

  task takeout_strobe;
    begin
      @(negedge clk);
      source_strobe <= 1'b1;
      @(negedge clk);
      source_strobe <= 1'b0;
    end
  endtask

  task takeout_strobe_write;
    begin
      @(negedge clk);
      $fdisplay(f, "%d; %d", source_data_real, source_data_cplx);
      source_strobe <= 1'b1;
      @(negedge clk);
      source_strobe <= 1'b0;
    end
  endtask

  always begin
    #10 clk <= ~clk;
  end

  initial begin
    $readmemh("input_values.csv", memory);
    f = $fopen("fft_output.csv");
    $fdisplay(f, "real; komplex");

    while (sink_empty == 1'b0) begin
      #10;
    end
    for (i = 0; i < SAMPLES; i = i + 1) begin
      insert_data(i + 1);
    end
    while (source_full == 1'b0) begin
      #10;
    end

    #1000;

    for (i = 0; i < SAMPLES; i = i + 1) begin
      insert_data(i + 1);
    end
    for (i = 0; i < SAMPLES; i = i + 1) begin
      takeout_strobe_write;
    end
    while (source_full == 1'b0) begin
      #10;
    end

    #1000;
    
    $fclose(f);
    $stop;
  end

endmodule
