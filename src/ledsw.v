`default_nettype none
module ledsw (
  input wire i_sw,
  output wire o_led
);

  assign o_led = ~i_sw;

endmodule
