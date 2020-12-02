package PixelBuffer

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class LineMemory() extends Module {
  val size = 800

  val io = IO(new Bundle {
    val rdAddr = Input(UInt(log2Ceil(size).W)) 
    val rdData = Output(UInt(16.W)) 
    val wrEna = Input(Bool())
    val wrData = Input(UInt(16.W)) 
    val wrAddr = Input(UInt(log2Ceil(size).W))
  })

  val mem = SyncReadMem(size, UInt(16.W))
  loadMemoryFromFile(mem, "Testdata/data.txt")
  io.rdData := mem.read(io.rdAddr)

  when(io.wrEna) {
    mem.write(io.wrAddr, io.wrData)
  }
}

class PixelBuffer extends Module {
  val frame_height = 800

  val io = IO(new Bundle {
    val new_frame = Input(UInt(1.W))

    val pixel_clock = Input(UInt(1.W))
    val enable = Input(UInt(1.W))
    val R = Output(UInt(8.W))
    val G = Output(UInt(8.W))
    val B = Output(UInt(8.W))
    val h_pos = Input(UInt(log2Ceil(frame_height).W))
  })

  io.R := 0.U
  io.G := 0.U
  io.B := 0.U

  val memory = Module(new LineMemory)

  memory.io.wrEna  := false.B
  memory.io.wrAddr := 0.U
  memory.io.wrData := 0.U

  memory.io.rdAddr := io.h_pos
  val rdData = memory.io.rdData

  when(io.enable === 1.U) {
    io.R := rdData >> 0
    io.G := rdData >> 5
    io.B := rdData >> 10
  }
}