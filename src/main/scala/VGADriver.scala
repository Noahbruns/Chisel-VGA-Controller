/*
 * This code is a minimal hardware described in Chisel.
 *
 * Blinking LED: the FPGA version of Hello World
 */
package VGADriver

import chisel3._
import chisel3.Driver
import chisel3.experimental.withClock

import VGAController._

/**
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

  io.n_sync := 0.U // Pulled to 0 because sync using green channel not used

  val pixel_clock_c = pixel_clock.asClock

  withClock(pixel_clock_c) {
    val controller = Module(new VGAController())

    io.n_blank := controller.io.n_blank
    io.h_sync := controller.io.h_sync
    io.v_sync := controller.io.v_sync

    val new_frame = controller.io.new_frame

    val color = RegInit(0.U(8.W))

    when(new_frame === 1.U) {
      color := color + 1.U
    }

    io.R := 0.U
    io.G := 0.U
    io.B := color
  }
}

/**
 * An object extending App to generate the Verilog code.
 */
object VGADriver extends App {
  chisel3.Driver.execute(Array[String](), () => new VGADriver())
}
