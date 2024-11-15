import sys
import os
path = ""
try:

    path = sys.argv[1]
    path = path.replace('"','')
except:
    print("must pass through input file path")
if not os.path.isfile(path):
    print("file dne")
    exit()

text = ""
with open(path, "r") as inputtext:
    text = inputtext.read()

text = text.split("\n")
output = ""
for line in text:
    if "//" in line:
        outputline = line[:line.index("//")]
        output += outputline + "\n"
    else:
        output += line + "\n"
output = output[:-1]
with open("instruction_memory.mem", "w") as outputfile:
    outputfile.write(output)
