package VGAController

import chisel3._

class VGAController extends Module {
  val io = IO(new Bundle {
    val pixel_clock = Input(UInt(1.W))
    val n_blank = Output(UInt(1.W))
    val h_sync = Output(UInt(1.W))
    val v_sync = Output(UInt(1.W))
  })

  val width = 800
  val height = 600

  val h_front_porch = 40 // in pixels
  val h_back_porch = 88
  val h_sync = 128

  val h_front_porch = 1 // in lines
  val h_back_porch = 23
  val h_sync = 4
}