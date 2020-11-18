/* Minimal top level for the Chisel Hello World.
  Wire reset to 0. */

module vgadriver_top(input clk, output pixel_clock, output n_sync, output n_blank, output h_sync, output v_sync, output [7:0] R, output [7:0] G, output [7:0] B);
  assign res = 1'h0;
  
  wire fast_clk;
  
  pll p(res, clk, fast_clk);

  VGADriver device(.clock( fast_clk ), .reset( res ), 
    .io_pixel_clock( pixel_clock ), .io_n_sync( n_sync ), .io_n_blank( n_blank ), 
    .io_h_sync( h_sync ), .io_v_sync( v_sync ), 
    .io_R( R ), .io_G( G ), .io_B( B )
  );
endmodule
