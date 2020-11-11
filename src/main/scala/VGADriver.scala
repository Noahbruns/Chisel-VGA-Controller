/*
 * This code is a minimal hardware described in Chisel.
 * 
 * Blinking LED: the FPGA version of Hello World
 */

import chisel3._
import chisel3.Driver

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
  val pixel_clock = RegInit(0.U(1.W))

  cntReg := cntReg + 1.U
  when(cntReg === 1.U) {
    cntReg := 0.U
    pixel_clock := ~pixel_clock
  }
  io.pixel_clock := pixel_clock

  io.R := 0.U
  io.G := 255.U
  io.B := 0.U

  val controller = Module(new VGAController())

  controller.io.pixel_clock := pixel_clock

  io.n_sync := 0.U // Pulled to 0 because sync using green channel not used.
  io.n_blank := controller.io.n_blank

  io.h_sync := controller.io.h_sync
  io.v_sync := controller.io.v_sync
}

/**
 * An object extending App to generate the Verilog code.
 */
object VGADriver extends App {
  chisel3.Driver.execute(Array[String](), () => new VGADriver())
}
