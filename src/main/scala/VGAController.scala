package VGAController

import chisel3._

class VGAController extends Module {
  val io = IO(new Bundle {
    //val pixel_clock = Input(UInt(1.W))
    val n_blank = Output(UInt(1.W))
    val h_sync = Output(UInt(1.W))
    val v_sync = Output(UInt(1.W))
  })

  io.n_blank := 0.U
  io.h_sync := 0.U
  io.v_sync := 0.U

  /* Horizontal */
  val h_front_porch = 40.U // in pixels
  val h_back_porch = 88.U
  val h_sync = 128.U
  val h_display = 800.U

  val line_width = h_display + h_sync + h_back_porch + h_front_porch

  val h_cntReg = RegInit(0.U(1.W))
  val pixel_clock = RegInit(0.U(1.W))

  h_cntReg := h_cntReg + 1.U
  when(h_cntReg === line_width) {
    h_cntReg := 0.U
  }

  /* Vertical */
  val v_front_porch = 1.U // in lines
  val v_back_porch = 23.U
  val v_sync = 4.U
}