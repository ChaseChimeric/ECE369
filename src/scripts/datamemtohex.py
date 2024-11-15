import os

text = ""
with open("message.txt", "r") as inputtext:
    text = inputtext.read()

text = text.split("\n")
output = ""
for line in text:
    # //print(line)
    if "h" not in line:
        continue
    outputline = line[line.index("h")+1:line.index(";")]
    output += (8-len(outputline))*"0" + outputline + "\n"
    # print(outputline)


with open("data_memory.mem", "w") as outputfile:
    outputfile.write(output)
