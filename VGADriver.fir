;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit VGADriver : 
  module VGAController : 
    input clock : Clock
    input reset : Reset
    output io : {flip pixel_clock : UInt<1>, n_blank : UInt<1>, h_sync : UInt<1>, v_sync : UInt<1>}
    
    
  module VGADriver : 
    input clock : Clock
    input reset : UInt<1>
    output io : {pixel_clock : UInt<1>, n_sync : UInt<1>, n_blank : UInt<1>, h_sync : UInt<1>, v_sync : UInt<1>, R : UInt<8>, G : UInt<8>, B : UInt<8>}
    
    reg cntReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[VGADriver.scala 31:23]
    reg pixel_clock : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[VGADriver.scala 32:28]
    node _T = add(cntReg, UInt<1>("h01")) @[VGADriver.scala 34:20]
    node _T_1 = tail(_T, 1) @[VGADriver.scala 34:20]
    cntReg <= _T_1 @[VGADriver.scala 34:10]
    node _T_2 = eq(cntReg, UInt<1>("h01")) @[VGADriver.scala 35:15]
    when _T_2 : @[VGADriver.scala 35:24]
      cntReg <= UInt<1>("h00") @[VGADriver.scala 36:12]
      node _T_3 = not(pixel_clock) @[VGADriver.scala 37:20]
      pixel_clock <= _T_3 @[VGADriver.scala 37:17]
      skip @[VGADriver.scala 35:24]
    io.pixel_clock <= pixel_clock @[VGADriver.scala 39:18]
    io.R <= UInt<1>("h00") @[VGADriver.scala 41:8]
    io.G <= UInt<8>("h0ff") @[VGADriver.scala 42:8]
    io.B <= UInt<1>("h00") @[VGADriver.scala 43:8]
    inst controller of VGAController @[VGADriver.scala 45:26]
    controller.clock <= clock
    controller.reset <= reset
    controller.io.pixel_clock <= pixel_clock @[VGADriver.scala 47:29]
    io.n_sync <= UInt<1>("h00") @[VGADriver.scala 49:13]
    io.n_blank <= controller.io.n_blank @[VGADriver.scala 50:14]
    io.h_sync <= controller.io.h_sync @[VGADriver.scala 52:13]
    io.v_sync <= controller.io.v_sync @[VGADriver.scala 53:13]
    
