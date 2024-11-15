import sys
import random
frame_size = input("Enter dimensions of frame(row col):")
frame_size = (int(frame_size.replace("\n", "").split(" ")[0]),int(frame_size.replace("\n", "").split(" ")[1]))
#frame_size = (120,120)
print(frame_size)
window_size = input("Enter dimensions of frame(row col):")
window_size = (int(window_size.replace("\n", "").split(" ")[0]),int(window_size.replace("\n", "").split(" ")[1]))
#window_size = (5,5)
print(window_size)
perfect = True if input("perfect match? (y/n): ") == "y" else False

if frame_size[0] < window_size[0] or frame_size[1] < window_size[1]:
    print("frame must be larger or equal to window")
    exit()




frame_arr = [[0 for x in range(frame_size[1])] for x in range(frame_size[0])]
window_arr = [[0 for x in range(window_size[1])] for x in range(window_size[0])]

for i in range(frame_size[0]):
    for j in range(frame_size[1]):
        frame_arr[i][j] = random.randint(0,200)
#print (frame_arr)

for i in range(window_size[0]):
    for j in range(window_size[1]):
        window_arr[i][j] = random.randint(0,200)
#print (window_arr)

for line in frame_arr:
    print(str(line))
print()
for line in window_arr:
    print(str(line))

if perfect:
    perfect_row = random.randint(0, frame_size[0]-(window_size[0]-1))
    perfect_col = random.randint(0, frame_size[1]-(window_size[1]-1))

    for k in range(window_size[0]):
        for l in range(window_size[1]):
            frame_arr[perfect_row+k][perfect_col+l] = window_arr[k][l]


sad = 99999999999999999
sad_loc = (-1,-1)
for i in range(frame_size[0]-(window_size[0]-1)):
    for j in range(frame_size[1]-(window_size[1]-1)):
        sum = 0
        for k in range(window_size[0]):
            for l in range(window_size[1]):
                sum += abs(frame_arr[i+k][j+l] - window_arr[k][l])
        if sum < sad:
            sad = sum
            sad_loc = (i,j)



with open("output_array.txt", "w") as outputfile:
    outputfile.write("SAD = " + str(sad) + "\n")
    outputfile.write("location " + str(sad_loc) + "\n\n")
    outputfile.write(f"asize0:\t.word\t{frame_size[0]}, {frame_size[1]}, {window_size[0]}, {window_size[1]}\n\n")
    outputfile.write("frame0:\t")
    for line in frame_arr:
        outputfile.write(".word\t" + str(line).replace("[","").replace("]","")+"\n")
    outputfile.write("\n")
    outputfile.write("window0:\t")
    for line in window_arr:
        outputfile.write(".word\t" + str(line).replace("[","").replace("]","")+"\n")
#with open("output_array.txt", "w") as outputfile:
#    outputfile.write("SAD = " + str(sad) + "\n")
#    outputfile.write("location " + str(sad_loc) + "\n\n")



 