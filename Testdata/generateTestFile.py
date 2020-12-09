file = open("data.txt", "w")

lila = "4864"
blue = "33F2"
green = "2610"
yellow = "E70E"
orange = "E3C0"
red = "C888"

line = range(0, 133)

for i in line:
    file.write(lila + "\n")

for i in line:
    file.write(blue + "\n")

for i in line:
    file.write(green + "\n")

for i in line:
    file.write(yellow + "\n")

for i in line:
    file.write(orange + "\n")

for i in line:
    file.write(red + "\n")

file.write(red)
