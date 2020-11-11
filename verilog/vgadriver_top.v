/* Minimal top level for the Chisel Hello World.
  Wire reset to 0. */

module vgadriver_top(input clk, output led)
  VGADriver h(.clock(clk), .reset(res));
endmodule
