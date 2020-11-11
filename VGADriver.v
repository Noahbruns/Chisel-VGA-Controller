module VGADriver(
  input        clock,
  input        reset,
  output       io_pixel_clock,
  output       io_n_sync,
  output       io_n_blank,
  output       io_h_sync,
  output       io_v_sync,
  output [7:0] io_R,
  output [7:0] io_G,
  output [7:0] io_B
);
  reg  cntReg; // @[VGADriver.scala 31:23]
  reg [31:0] _RAND_0;
  reg  pixel_clock; // @[VGADriver.scala 32:28]
  reg [31:0] _RAND_1;
  wire  _T_1; // @[VGADriver.scala 34:20]
  wire  _T_3; // @[VGADriver.scala 37:20]
  assign _T_1 = cntReg + 1'h1; // @[VGADriver.scala 34:20]
  assign _T_3 = ~ pixel_clock; // @[VGADriver.scala 37:20]
  assign io_pixel_clock = pixel_clock; // @[VGADriver.scala 39:18]
  assign io_n_sync = 1'h0; // @[VGADriver.scala 45:13]
  assign io_n_blank = 1'h0; // @[VGADriver.scala 46:14]
  assign io_h_sync = 1'h0; // @[VGADriver.scala 48:13]
  assign io_v_sync = 1'h0; // @[VGADriver.scala 49:13]
  assign io_R = 8'h0; // @[VGADriver.scala 41:8]
  assign io_G = 8'hff; // @[VGADriver.scala 42:8]
  assign io_B = 8'h0; // @[VGADriver.scala 43:8]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  pixel_clock = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cntReg <= 1'h0;
    end else if (cntReg) begin
      cntReg <= 1'h0;
    end else begin
      cntReg <= _T_1;
    end
    if (reset) begin
      pixel_clock <= 1'h0;
    end else if (cntReg) begin
      pixel_clock <= _T_3;
    end
  end
endmodule
