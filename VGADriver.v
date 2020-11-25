module VGAController(
  input   clock,
  input   reset,
  output  io_n_blank,
  output  io_h_sync,
  output  io_v_sync,
  output  io_new_frame
);
  reg [9:0] v_cntReg; // @[VGAController.scala 27:25]
  reg [31:0] _RAND_0;
  reg [10:0] h_cntReg; // @[VGAController.scala 37:25]
  reg [31:0] _RAND_1;
  wire [10:0] _T_1; // @[VGAController.scala 40:24]
  wire  _T_2; // @[VGAController.scala 41:17]
  wire [9:0] _T_4; // @[VGAController.scala 43:26]
  wire  _T_5; // @[VGAController.scala 46:17]
  wire  _T_6; // @[VGAController.scala 52:18]
  wire  _T_7; // @[VGAController.scala 52:63]
  wire  _T_9; // @[VGAController.scala 60:18]
  wire  _T_10; // @[VGAController.scala 60:63]
  wire  _T_12; // @[VGAController.scala 68:18]
  wire  _T_13; // @[VGAController.scala 68:44]
  assign _T_1 = h_cntReg + 11'h1; // @[VGAController.scala 40:24]
  assign _T_2 = h_cntReg == 11'h41f; // @[VGAController.scala 41:17]
  assign _T_4 = v_cntReg + 10'h1; // @[VGAController.scala 43:26]
  assign _T_5 = v_cntReg == 10'h274; // @[VGAController.scala 46:17]
  assign _T_6 = v_cntReg >= 10'h259; // @[VGAController.scala 52:18]
  assign _T_7 = v_cntReg < 10'h25d; // @[VGAController.scala 52:63]
  assign _T_9 = h_cntReg >= 11'h348; // @[VGAController.scala 60:18]
  assign _T_10 = h_cntReg < 11'h3c8; // @[VGAController.scala 60:63]
  assign _T_12 = h_cntReg < 11'h320; // @[VGAController.scala 68:18]
  assign _T_13 = v_cntReg < 10'h258; // @[VGAController.scala 68:44]
  assign io_n_blank = _T_12 & _T_13; // @[VGAController.scala 14:14 VGAController.scala 69:16 VGAController.scala 72:16]
  assign io_h_sync = _T_9 & _T_10; // @[VGAController.scala 15:13 VGAController.scala 61:15 VGAController.scala 64:15]
  assign io_v_sync = _T_6 & _T_7; // @[VGAController.scala 16:13 VGAController.scala 53:15 VGAController.scala 56:15]
  assign io_new_frame = v_cntReg == 10'h274; // @[VGAController.scala 17:16 VGAController.scala 48:18]
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
  v_cntReg = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  h_cntReg = _RAND_1[10:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      v_cntReg <= 10'h0;
    end else if (_T_5) begin
      v_cntReg <= 10'h0;
    end else if (_T_2) begin
      v_cntReg <= _T_4;
    end
    if (reset) begin
      h_cntReg <= 11'h0;
    end else if (_T_2) begin
      h_cntReg <= 11'h0;
    end else begin
      h_cntReg <= _T_1;
    end
  end
endmodule
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
  wire  VGAController_clock; // @[VGADriver.scala 46:28]
  wire  VGAController_reset; // @[VGADriver.scala 46:28]
  wire  VGAController_io_n_blank; // @[VGADriver.scala 46:28]
  wire  VGAController_io_h_sync; // @[VGADriver.scala 46:28]
  wire  VGAController_io_v_sync; // @[VGADriver.scala 46:28]
  wire  VGAController_io_new_frame; // @[VGADriver.scala 46:28]
  reg  pixel_clock; // @[VGADriver.scala 34:28]
  reg [31:0] _RAND_0;
  wire  _T; // @[VGADriver.scala 37:18]
  wire  pixel_clock_c; // @[VGADriver.scala 43:35]
  reg [7:0] _T_1; // @[VGADriver.scala 54:24]
  reg [31:0] _RAND_1;
  wire  _T_2; // @[VGADriver.scala 56:20]
  wire [7:0] _T_4; // @[VGADriver.scala 57:22]
  VGAController VGAController ( // @[VGADriver.scala 46:28]
    .clock(VGAController_clock),
    .reset(VGAController_reset),
    .io_n_blank(VGAController_io_n_blank),
    .io_h_sync(VGAController_io_h_sync),
    .io_v_sync(VGAController_io_v_sync),
    .io_new_frame(VGAController_io_new_frame)
  );
  assign _T = ~ pixel_clock; // @[VGADriver.scala 37:18]
  assign pixel_clock_c = pixel_clock; // @[VGADriver.scala 43:35]
  assign _T_2 = VGAController_io_new_frame; // @[VGADriver.scala 56:20]
  assign _T_4 = _T_1 + 8'h1; // @[VGADriver.scala 57:22]
  assign io_pixel_clock = pixel_clock; // @[VGADriver.scala 39:18]
  assign io_n_sync = 1'h0; // @[VGADriver.scala 41:13]
  assign io_n_blank = VGAController_io_n_blank; // @[VGADriver.scala 48:16]
  assign io_h_sync = VGAController_io_h_sync; // @[VGADriver.scala 49:15]
  assign io_v_sync = VGAController_io_v_sync; // @[VGADriver.scala 50:15]
  assign io_R = 8'h0; // @[VGADriver.scala 60:10]
  assign io_G = 8'h0; // @[VGADriver.scala 61:10]
  assign io_B = _T_1; // @[VGADriver.scala 62:10]
  assign VGAController_clock = pixel_clock;
  assign VGAController_reset = reset;
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
  pixel_clock = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pixel_clock <= 1'h0;
    end else begin
      pixel_clock <= _T;
    end
  end
  always @(posedge pixel_clock_c) begin
    if (reset) begin
      _T_1 <= 8'h0;
    end else if (_T_2) begin
      _T_1 <= _T_4;
    end
  end
endmodule
