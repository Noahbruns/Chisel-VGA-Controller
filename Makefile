SBT = sbt

# Generate Verilog code
VGADriver:
	$(SBT) "runMain VGADriver"

VGADriver-test:
	$(SBT) "test:runMain simple.VGADriverTest"

VGADriver-view:
	./gtkwave generated/simple.VGADriverTest2108977987/VGA.vcd --save=VGA.gtkw
