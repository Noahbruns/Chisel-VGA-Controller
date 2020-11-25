package simple

import chisel3._
import chisel3.iotesters.PeekPokeTester
import VGADriver._


/**
 * Test the VGADriver design
 */
class VGADriverTester(dut: VGADriver) extends PeekPokeTester(dut) {
  step(2000000)
}


object VGADriverTest extends App {
  iotesters.Driver.execute(Array("--target-dir", "generated", "--generate-vcd-output", "on"), () => new VGADriver()) {
    c => new VGADriverTester(c)
  }
}
