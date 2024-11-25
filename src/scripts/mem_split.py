import sys
import os.path
try:
    path = sys.argv[1]
except:
    print("usage: memsplit.py FILEPATH (-i/-d instruction/data) defaults data")
    exit()

if not os.path.exists(path):
    print("usage: memsplit.py FILEPATH >>> file must exist")
    exit()
with open(f"{path}", "r") as inputfile:
    input_dat = inputfile.readlines()

if "-i" in sys.argv:
    output_list = []
    for i in range(4):
        current = ""
        for j in range(64):
            try:
                current += input_dat[i*4 + j] + ""
            except:
                current += "00000000\n"
        output_list.append(current)
    if not os.path.exists("./output"):
        os.mkdir("./output")
    for i in range(4):
        with open(f"./output/instruction_memory{i}.mem", "w") as output:
            output.write(output_list[i])
    print("initial begin")
    for i in range(4):
        print(f'    $readmemh("instruction_memory{i}.mem", Mem{i})')
    print("end")

else:
    output_list = []
    for i in range(65):
        current = ""
        for j in range(65):
            try:
                current += input_dat[i*65 + j] + ""
            except:
                current += "00000000\n"
        output_list.append(current)
    if not os.path.exists("./output"):
        os.mkdir("./output")
    for i in range(65):
        with open(f"./output/data_memory{i}.mem", "w") as output:
            output.write(output_list[i])
    print("initial begin")
    for i in range(64):
        print(f'    $readmemh("data_memory{i}.mem", Mem{i})')
    print(f'    $readmemh("data_memory{64}.mem", Window)')
    print("end")
