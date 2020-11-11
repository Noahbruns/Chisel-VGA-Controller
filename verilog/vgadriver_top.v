/* Minimal top level for the Chisel Hello World.
  Wire reset to 0. */

module vgadriver_top(input clk, output pixel_clock, output n_sync, output n_blank, output h_sync, output v_sync, output R, output G, output B)
  wire h_pixel_clock;
  wire h_n_sync;
  wire h_n_blank;

  wire h_h_sync;
  wire h_v_sync;

  wire [7:0] h_R;
  wire [7:0] h_G;
  wire [7:0] h_B;

  wire res;

  assign h_pixel_clock = pixel_clock;
  assign h_n_sync = n_sync;
  assign h_n_blank = n_blank;
  assign h_h_sync = h_sync;
  assign h_v_sync = v_sync;

  assign h_R = R;
  assign h_G = G;
  assign h_B = B;
  
  assign res = 1'h0;

  VGADriver h(.clock(clk), .reset(res), 
    .pixel_clock( h_pixel_clock ), .n_sync( h_n_sync ), .n_blank( h_n_blank ), 
    .h_sync( h_h_sync ), .v_sync( h_v_sync ), 
    .R( h_R ), G( h_G ), .B( h_B )
  );
endmodule
