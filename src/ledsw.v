module ledsw (
  input i_sw,
  output reg o_led
);

  initial begin
    o_led = 1'b0;
  end
  
  always @(posedge i_sw) begin
    o_led <= ~o_led;
  end

endmodule
