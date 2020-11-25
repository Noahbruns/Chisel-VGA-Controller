SBT = sbt

#export _JAVA_OPTIONS="-Xmx8g"

# Generate Verilog code
VGADriver:
	$(SBT) "runMain VGADriver.VGADriver"

VGADriver-test:
	$(SBT) "test:runMain simple.VGADriverTest"

VGADriver-view: VGADriver-test
	gtkwave generated/simple.VGADriverTest/VGA.vcd --save=VGA.gtkw
