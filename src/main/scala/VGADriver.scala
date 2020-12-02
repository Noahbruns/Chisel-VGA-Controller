// Chisel highlighting

/*
 * This code is a minimal hardware described in Chisel.
 *
 * Blinking LED: the FPGA version of Hello World
 */

package VGADriver

import chisel3._

import VGAController._
import PixelBuffer._

/*
 * The blinking LED component.
 */

class VGADriver extends Module {
  val io = IO(new Bundle {
    val pixel_clock = Output(UInt(1.W))
    val n_sync = Output(UInt(1.W))
    val n_blank = Output(UInt(1.W))

    val h_sync = Output(UInt(1.W))
    val v_sync = Output(UInt(1.W))

    val R = Output(UInt(8.W))
    val G = Output(UInt(8.W))
    val B = Output(UInt(8.W))
  })

  /* Devide clock to generate Pixel clock */
  val cntReg = RegInit(0.U(1.W))
  val pixel_clock = RegInit(false.B)

  // Clock devide by 2
  pixel_clock := ~pixel_clock
  io.pixel_clock := pixel_clock
  val pixel_clock_c = pixel_clock.asClock

  io.n_sync := 0.U // Pulled to 0 because sync using green channel not used

  val new_frame = 0.U

  withClock(pixel_clock_c) {
    val controller = Module(new VGAController())

    io.n_blank := controller.io.n_blank
    io.h_sync := controller.io.h_sync
    io.v_sync := controller.io.v_sync

    new_frame = controller.io.new_frame
  }

  val PixelBuffer = Module(new PixelBuffer())
  
  PixelBuffer.io.new_frame := new_frame // Add synchronizer

  io.R := PixelBuffer.io.R
  io.G := PixelBuffer.io.G
  io.B := PixelBuffer.io.B
}

/**
 * An object extending App to generate the Verilog code.
 */
object VGADriver extends App {
  chisel3.Driver.execute(Array[String](), () => new VGADriver())
}
