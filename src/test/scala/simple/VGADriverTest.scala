package simple

import chisel3._
import chisel3.iotesters.PeekPokeTester
import VGADriver._


/**
 * Test the VGADriver design
 */
class VGADriverTester(dut: VGADriver) extends PeekPokeTester(dut) {
        step(500)
}


object VGADriverTest extends App {
  iotesters.Driver.execute(Array("--target-dir", "generated", "--generate-vcd-output", "on"), () => new VGADriver()) {
  // iotesters.Driver.execute(Array("--target-dir", "generated", "--fint-write-vcd", "--wave-form-file-name", "generated/BubbleFifo.vcd"), () => new BubbleFifo(8, 4)) {
    c => new VGADriverTester(c)
  }
}
