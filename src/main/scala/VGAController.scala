package VGAController

import chisel3._

class VGAController extends Module {
  val io = IO(new Bundle {
    val pixel_clock = Output(UInt(1.W))
    val n_blank = Output(UInt(1.W))
    val h_sync = Output(UInt(1.W))
    val v_sync = Output(UInt(1.W))
  })

}