package PixelBuffer

import chisel3._

class PixelBuffer extends Module {
  val io = IO(new Bundle {
    // Clockdomain Main clock
    val new_frame = Input(UInt(1.W))

    // Clockdomain Pixel CLock
    val pixel_clock = Input(UInt(1.W))
    val enable = Input(UInt(1.W))
    val R = Output(UInt(8.W))
    val G = Output(UInt(8.W))
    val B = Output(UInt(8.W))
  })

  io.R := 255.U
  io.G := 255.U
  io.B := 255.U
}