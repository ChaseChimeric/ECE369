#!/usr/bin/env python
import os
import sys
import re
it = sys.argv[1]

output = ""

with open(".gitignore", "r") as inputFile:
    inputText = inputFile.read().split("\n")
    for s in inputText:
        
        if it != re.sub(r"\D", "", s):

            pass
        else:
            if '#' in s:
                s = s[1:]
            else:
                s = "#" + s
        output += s + '\n'
with open(".gitignore", "w") as outputfile:
    outputfile.write(output)

