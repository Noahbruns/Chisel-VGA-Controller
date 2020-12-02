package PixelBuffer

import chisel3._
import fifo._

class PixelBuffer extends Module {
  val io = IO(new Bundle {
    // Clockdomain Main clock
    val new_frame = Input(UInt(1.W))

    // Clockdomain Pixel CLock
    val pixel_clock = Input(Clock())
    val R = Output(UInt(8.W))
    val G = Output(UInt(8.W))
    val B = Output(UInt(8.W))
  })

  io.R := 255.U
  io.G := 255.U
  io.B := 255.U

  val fifo = Module(new FIFO(16, 512))

  fifo.io.dataIn := 0.U
  fifo.io.writeEn := false.B
  fifo.io.writeClk := clock
  //fifo.io.full := Output(Bool())
  // read-domain
  //fifo.io.dataOut := Output(UInt(width.W))
  fifo.io.readEn := false.B
  fifo.io.readClk := io.pixel_clock
  //fifo.io.empty := Output(Bool())
  // reset
  fifo.io.systemRst := reset
}