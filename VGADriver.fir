;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit VGADriver : 
  module VGAController : 
    input clock : Clock
    input reset : Reset
    output io : {n_blank : UInt<1>, h_sync : UInt<1>, v_sync : UInt<1>}
    
    io.n_blank <= UInt<1>("h00") @[VGAController.scala 13:14]
    io.h_sync <= UInt<1>("h00") @[VGAController.scala 14:13]
    io.v_sync <= UInt<1>("h00") @[VGAController.scala 15:13]
    node _T = add(UInt<10>("h0320"), UInt<8>("h080")) @[VGAController.scala 23:30]
    node _T_1 = tail(_T, 1) @[VGAController.scala 23:30]
    node _T_2 = add(_T_1, UInt<7>("h058")) @[VGAController.scala 23:39]
    node _T_3 = tail(_T_2, 1) @[VGAController.scala 23:39]
    node _T_4 = add(_T_3, UInt<6>("h028")) @[VGAController.scala 23:54]
    node line_width = tail(_T_4, 1) @[VGAController.scala 23:54]
    reg h_cntReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[VGAController.scala 25:25]
    reg pixel_clock : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[VGAController.scala 26:28]
    node _T_5 = add(h_cntReg, UInt<1>("h01")) @[VGAController.scala 28:24]
    node _T_6 = tail(_T_5, 1) @[VGAController.scala 28:24]
    h_cntReg <= _T_6 @[VGAController.scala 28:12]
    node _T_7 = eq(h_cntReg, line_width) @[VGAController.scala 29:17]
    when _T_7 : @[VGAController.scala 29:33]
      h_cntReg <= UInt<1>("h00") @[VGAController.scala 30:14]
      skip @[VGAController.scala 29:33]
    
  module VGADriver : 
    input clock : Clock
    input reset : UInt<1>
    output io : {pixel_clock : UInt<1>, n_sync : UInt<1>, n_blank : UInt<1>, h_sync : UInt<1>, v_sync : UInt<1>, R : UInt<8>, G : UInt<8>, B : UInt<8>}
    
    reg cntReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[VGADriver.scala 33:23]
    reg pixel_clock : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[VGADriver.scala 34:28]
    node _T = add(cntReg, UInt<1>("h01")) @[VGADriver.scala 36:20]
    node _T_1 = tail(_T, 1) @[VGADriver.scala 36:20]
    cntReg <= _T_1 @[VGADriver.scala 36:10]
    node _T_2 = eq(cntReg, UInt<1>("h01")) @[VGADriver.scala 37:15]
    when _T_2 : @[VGADriver.scala 37:24]
      cntReg <= UInt<1>("h00") @[VGADriver.scala 38:12]
      node _T_3 = not(pixel_clock) @[VGADriver.scala 39:20]
      pixel_clock <= _T_3 @[VGADriver.scala 39:17]
      skip @[VGADriver.scala 37:24]
    io.pixel_clock <= pixel_clock @[VGADriver.scala 41:18]
    io.R <= UInt<1>("h00") @[VGADriver.scala 43:8]
    io.G <= UInt<8>("h0ff") @[VGADriver.scala 44:8]
    io.B <= UInt<1>("h00") @[VGADriver.scala 45:8]
    io.n_sync <= UInt<1>("h00") @[VGADriver.scala 47:13]
    node pixel_clock_c = asClock(pixel_clock) @[VGADriver.scala 49:35]
    inst VGAController of VGAController @[VGADriver.scala 52:28]
    VGAController.clock <= pixel_clock_c
    VGAController.reset <= reset
    io.n_blank <= VGAController.io.n_blank @[VGADriver.scala 54:16]
    io.h_sync <= VGAController.io.h_sync @[VGADriver.scala 55:15]
    io.v_sync <= VGAController.io.v_sync @[VGADriver.scala 56:15]
    
