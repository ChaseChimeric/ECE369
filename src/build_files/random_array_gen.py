#! /usr/bin/env python3
import argparse
import random
import os.path
import time


parser = argparse.ArgumentParser(prog="random_array_gen.py", usage='%(prog)s [options] /*must define -fs and -ws*/', description="\x1b[31mThis program will overwrite files named vbsme.s and output_array.txt in the same directory\x1b[0m")
parser.add_argument("-fs","--frame-size", help="--frame-size row\x1b[35mx\x1b[0mcol (one word)")
parser.add_argument("-ws","--window-size", help="--window-size row\x1b[35mx\x1b[0mcol (one word)")
parser.add_argument("-pm", "--perfect-match", help="flag to enable perfect match injection", action="store_true")
parser.add_argument("-v", "--vbsme", help="output as final vbsme.s file, will require other flags be set, version commit 9f33e08", action="store_true")
parser.add_argument("-fm", "--fixed-mem", help="set if the memory location will be \x1b[35m0\x1b[0m in the implementation (not for qtspim)", action="store_true")
parser.add_argument("-m", "--mul", help="set if mips multiply should be used (leave unset for comp builds)", action="store_true")

args = parser.parse_args()
if args.frame_size == None or args.window_size == None:
    parser.print_help()
    exit()

frame_size = (int(args.frame_size.split("x")[0]),int(args.frame_size.split("x")[1]))
window_size = (int(args.window_size.split("x")[0]),int(args.window_size.split("x")[1]))
perfect = args.perfect_match
vbsme = args.vbsme
print(frame_size)
print(window_size)
print(perfect)



if frame_size[0] < window_size[0] or frame_size[1] < window_size[1]:
    print("frame must be larger or equal to window")
    exit()


frame_arr = [[0 for x in range(frame_size[1])] for x in range(frame_size[0])]
window_arr = [[0 for x in range(window_size[1])] for x in range(window_size[0])]


for i in range(frame_size[0]):
    for j in range(frame_size[1]):
        frame_arr[i][j] = random.randint(0,200)


for i in range(window_size[0]):
    for j in range(window_size[1]):
        window_arr[i][j] = random.randint(0,200)


for line in frame_arr:
    print(str(line))
print()
for line in window_arr:
    print(str(line))

if perfect:
    perfect_row = random.randint(0, frame_size[0]-(window_size[0]))
    perfect_col = random.randint(0, frame_size[1]-(window_size[1]))

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

if vbsme:
    with open("vbsme.s", "w") as outputfile:
        outputfile.write("# SAD = " + str(sad) + "\n")
        outputfile.write("# location " + str(sad_loc) + "\n\n")
        vbsme_begin = """########################################################################################################################
### data
########################################################################################################################
.data
"""
        outputfile.write(vbsme_begin)
        outputfile.write(f"asize0:\t.word\t{frame_size[0]}, {frame_size[1]}, {window_size[0]}, {window_size[1]}\n\n")
        outputfile.write("frame0:\t")
        for line in frame_arr:
            outputfile.write(".word\t" + str(line).replace("[","").replace("]","")+"\n")
        outputfile.write("\n")
        outputfile.write("window0:\t")
        for line in window_arr:
            outputfile.write(".word\t" + str(line).replace("[","").replace("]","")+"\n")
        
        main_begin = """########################################################################################################################
### main
########################################################################################################################
.text
.globl main
main: 
    addi    $sp, $sp, -4    # Make space on stack
    sw      $ra, 0($sp)     # Save return address
"""
        outputfile.write(main_begin)
        if args.fixed_mem:
            outputfile.write("addi $a0, $0, 0\n")
        else:
            outputfile.write("la $a0, asize0\n")
        outputfile.write("addi $a1, $a0, 16\nlw $t0, 0($a0)\nlw $t1, 4($a0)\n")
        if args.mul:
            outputfile.write("mul $t3, $t0, $t1\n")
            outputfile.write("""sll $t3, $t3, 2
    add $a2, $t3, $a1
    j     vbsme           # call function
    endtest:
    j endtest
#####################################################################
### vbsme
#####################################################################
vbsme:  
    # stack list:
    # idk what they did with the stack before, so we'll start at -4
    # -4 = stored x value for current position
    # -8 = stored y value for current position
    # -12 = top offset
    # -16 = right offset
    # -20 = bottom offset
    # -24 = left offset
    init:
        addi $s1, $zero, 32000  # minimum tracked sad value
        addi $s2, $zero, 0      # direction of movement
        addi, $s3, $a1, 0       # load frame pointer to mutable reg
        # zero everything used in stack
        # have to change to 0 offset start eventually
        sw $zero, -4($sp)       # | variables listed above
        sw $zero, -8($sp)       # |
        sw $zero, -12($sp)      # |
        sw $zero, -16($sp)      # |
        sw $zero, -20($sp)      # |
        sw $zero, -24($sp)      # |
        lw $t0, 12($a0)         # load window width
        addi $t0, $t0, -1
        lw $t1, 4($a0)          # load frame width
        sub $t2, $t1, $t0
        addi $t4, $0, 1
        bne $t2, $t4, nonZeroWidth
        addi $s2, $0, 1         # set direction to down
        nonZeroWidth:
        lw $t0, 8($a0)          # load window height
        addi $t0, $t0, -1
        lw $t1, 0($a0)          # load frame height
        sub $t3, $t1, $t0
        mul $s6, $t3, $t2       # s6 is now dec counter
    j forinit
#________________________________________________
# handles branch logic for frame traversal/offset functions
    movement:
        blez $s6, return # check if at final
        j contmove  # continue
    contmove:
        addi $t0, $zero, 0      # | check right
        beq $s2, $t0, right     # |
        addi $t0, $zero, 1      # | check down
        beq $s2, $t0, down      # |
        addi $t0, $zero, 2      # | check left 
        beq $s2, $t0, left      # |
        addi $t0, $zero, 3      # | check up 
        beq $s2, $t0, up        # |
 
#__________________________________________________
# for loop, calculates sad for frame/window
    forinit:
        addi $s0, $zero, 0          #zero sum for this frame
        addi $t5, $a2, 0            # load new iterator over window
        addi $t0, $zero, 0          # j = 0
        # dec return counter
        addi $s6, $s6, -1
        lw $t7, -4($sp)  
        lw $t8, -8($sp)  
    for:
        lw $t2, 8($a0)              # load window height
        beq $t0, $t2, loopend       # continue while j != window height
            for2init:
                addi $t1, $zero, 0      # i = 0
            for2:
                lw $t2, 12($a0)         #window width
                beq $t1, $t2, forend    # i != window width
                loopbody:
                    sll $t3, $t1, 2         # offset of i 
                    lw $t4, 4($a0)          # get frame width
                    mul $t4, $t4, $t0       # mult by y index
                    end_mult:
                    sll $t4, $t4, 2         # mult by 4 for offset
                    add $t9, $t3, $t4       # add offsets together, should now have total indexing offset
                    add $t3, $t9, $s3       # final address in array 
                    lw $t3 0($t3)           # load frame val
                    lw $t4 0($t5)           # load window val
                    slt $t6, $t3, $t4       # | check which is greater
                    beq $t6, $zero, abs21   # |
                abs12: # t4 - t3
                    sub $t3, $t4, $t3       # difference if 1 > 2
                    add $s0, $s0, $t3       # sum += diff
                    j cont
                abs21: # t3 - t4
                    sub $t3, $t3, $t4       # difference if 2 > 1
                    add $s0, $s0, $t3       # sum += diff
                cont:
                    addi $t5, $t5, 4        # index++ on window
            for2end:
                addi $t1, $t1, 1        # j++
                j for2
    forend:
        addi $t0, $t0, 1            # i++
        j for
loopend:
    beq $zero, $s0, foundzero   # if zero
    slt $t0, $s0, $s1           # | check if current sum is lower than stored sum
    bne $t0, $zero, newsum      # |
    j movement  # continue
newsum:
    lw $v0, -8($sp)         # | set minimum indexes
    lw $v1, -4($sp)         # |
    addi, $s1, $s0, 0       # set new minimum sad      
    j movement
foundzero:
    lw $v0, -8($sp)         # | set minimum indexes
    lw $v1, -4($sp)         # |
    
    j     endtest
#______________________________________________________
# movement functions
right:
    addi $s3, $s3, 4        # increment array pointer
    lw $t0, -4($sp)         # load current x index
    addi $t0, $t0, 1        # increment +1
    sw $t0, -4($sp)         # writeback, t0 is sustained
    lw $t2, -16($sp)        # load offset right
    lw $t1, 12($a0)         # load window width
    add $t1, $t1, $t2       # add offset limit
    add $t0, $t0, $t1       # now current index + window width + offset
    lw $t1, 4($a0)          # frame width
    beq $t1, $t0, chdirdown # check if index is at edge
    j forinit
    chdirdown:
        lw $t0, -12($sp)    # load top offset
        addi $t0, $t0, 1    # increment
        sw $t0, -12($sp)    # writeback
        addi $s2, $zero, 1  # change direction to down
        j forinit   # continue
down:    
    lw $t1, 4($a0)          # frame width
    sll $t2, $t1, 2         # convert to addr offset
    add $s3, $s3, $t2       # add to index pointer (move down 1)
    lw $t1, 0($a0)          # load frame height for check later
    lw $t0, -8($sp)         # load current y index
    addi $t0, $t0, 1        # increment index y
    sw $t0, -8($sp)         # store
    lw $t2, 8($a0)          # load window height
    lw $t3, -20($sp)        # load offset bottom
    add $t2, $t2, $t3       # add as offsets
    add $t0, $t0, $t2       # current index + window height + offset 
    beq $t1, $t0, chdirleft # check if 'index' is at edge
    j forinit       # continue
        chdirleft:
        lw $t0, -16($sp)    # load right offset
        addi $t0, $t0, 1    # add 1
        sw $t0, -16($sp)    # writeback
        addi $s2, $zero, 2  # change direction to down
        j forinit   # continue
left:
    addi $s3, $s3, -4 
    lw $t0, -4($sp)         # load current x val
    addi $t0, $t0, -1       # dec index x
    sw $t0, -4($sp)         # writeback
    lw $t1, -24($sp)        # get left offset
    sub $t2, $t0, $t1       
    beq $zero, $t2, chdirup # check if index is at edge
    j forinit
    chdirup:
        lw $t0, -20($sp)    # load offset bottom
        addi $t0, $t0, 1    # increase
        sw $t0, -20($sp)    # writeback
        addi $s2, $zero, 3  # change direction to down
        j forinit
up:
    lw $t1, 4($a0)          # frame width 
    sll $t2, $t1, 2         # convert to addr offset
    sub $s3, $s3, $t2       # add to index pointer (move down 1)
    lw $t0, -8($sp)         # load current y val
    addi $t0, $t0, -1       # dec index y
    sw $t0, -8($sp)         # writeback
    #lw $t2, 8($a0)          # load window height
    lw $t3, -12($sp)        # load top offset
    sub $t0, $t0, $t3
    beq $zero, $t0, chdirright # check if index is at edge
    j forinit
    chdirright:
        lw $t0, -24($sp)    # load left offset
        addi $t0, $t0, 1    # increment
        sw $t0, -24($sp)    # writeback
        addi $s2, $zero, 0  # change direction to down
        j forinit
return:
    
    j     endtest 

""")
        else:
            outputfile.write("addi $t3, $0, 0\nj multiply3\nend_mult3:\n")
            outputfile.write("""sll $t3, $t3, 2
    add $a2, $t3, $a1 
    j     vbsme           # call function
    endtest:
    j endtest
#####################################################################
### vbsme
#####################################################################
vbsme:  
    # stack list:
    # idk what they did with the stack before, so we'll start at -4
    # -4 = stored x value for current position
    # -8 = stored y value for current position
    # -12 = top offset
    # -16 = right offset
    # -20 = bottom offset
    # -24 = left offset
    init:
        addi $s1, $zero, 32000  # minimum tracked sad value
        addi $s2, $zero, 0      # direction of movement
        addi, $s3, $a1, 0       # load frame pointer to mutable reg
        # zero everything used in stack
        # have to change to 0 offset start eventually
        sw $zero, -4($sp)       # | variables listed above
        sw $zero, -8($sp)       # |
        sw $zero, -12($sp)      # |
        sw $zero, -16($sp)      # |
        sw $zero, -20($sp)      # |
        sw $zero, -24($sp)      # |
        lw $t0, 12($a0)         # load window width
        addi $t0, $t0, -1
        lw $t1, 4($a0)          # load frame width
        sub $t2, $t1, $t0
        addi $t4, $0, 1
        bne $t2, $t4, nonZeroWidth
        addi $s2, $0, 1         # set direction to down
        nonZeroWidth:
        lw $t0, 8($a0)         # load window height
        addi $t0, $t0, -1
        lw $t1, 0($a0)          # load frame height
        sub $t3, $t1, $t0
        addi $s6, $0, 0
        j multiply
        end_mult:
    j forinit
#________________________________________________
# handles branch logic for frame traversal/offset functions
    movement:
        blez $s6, return # check if at final position
        j contmove  # continue if not
    contmove:
        addi $t0, $zero, 0      # | check right
        beq $s2, $t0, right     # |
        addi $t0, $zero, 1      # | check down
        beq $s2, $t0, down      # |
        addi $t0, $zero, 2      # | check left 
        beq $s2, $t0, left      # |
        addi $t0, $zero, 3      # | check up 
        beq $s2, $t0, up        # |
#__________________________________________________
# for loop, calculates sad for frame/window
    forinit:
        addi $s0, $zero, 0          #zero sum for this frame
        addi $t5, $a2, 0            # load new iterator over window
        addi $t0, $zero, 0          # j = 0
        addi $s6, $s6, -1           # dec return counter
        lw $t7, -4($sp)  ############################################################### can remove for comp
        lw $t8, -8($sp)  
    for:
        lw $t2, 8($a0)              # load window height
        beq $t0, $t2, loopend       # continue while j != window height
            for2init:
                addi $t1, $zero, 0      # i = 0
            for2:
                lw $t2, 12($a0)         #window width
                beq $t1, $t2, forend    # i != window width
                loopbody:
                    sll $t3, $t1, 2         # offset of i 
                    lw $t4, 4($a0)          # get frame width
                    lw $t7, 4($a0)          # get frame width
                    addi $t4, $0, 0
                    j multiply2
                    end_mult2:
                    sll $t4, $t4, 2         # mult by 4 for offset
                    add $t9, $t3, $t4       # add offsets together, should now have total indexing offset
                    add $t3, $t9, $s3       # final address in array 
                    lw $t3 0($t3)           # load frame val
                    lw $t4 0($t5)           # load window val
                    slt $t6, $t3, $t4       # | check which is greater
                    beq $t6, $zero, abs21   # |
                abs12: # t4 - t3
                    sub $t3, $t4, $t3       # difference if 1 > 2
                    add $s0, $s0, $t3       # sum += diff
                    j cont
                abs21: # t3 - t4
                    sub $t3, $t3, $t4       # difference if 2 > 1
                    add $s0, $s0, $t3       # sum += diff
                cont:
                    addi $t5, $t5, 4        # index++ on window
            for2end:
                addi $t1, $t1, 1        # j++
                j for2
    forend:
        addi $t0, $t0, 1            # i++
        j for
loopend:
    beq $zero, $s0, foundzero   # if zero
    slt $t0, $s0, $s1           # | check if current sum is lower than stored sum
    bne $t0, $zero, newsum      # |
    j movement  # continue
newsum:
    lw $v0, -8($sp)         # | set minimum indexes
    lw $v1, -4($sp)         # |
    addi, $s1, $s0, 0       # set new minimum sad      
    j movement
foundzero:
    lw $v0, -8($sp)         # | set minimum indexes
    lw $v1, -4($sp)         # |
    j     endtest
#______________________________________________________
# movement functions
right:
    addi $s3, $s3, 4        # increment array pointer
    lw $t0, -4($sp)         # load current x index
    addi $t0, $t0, 1        # increment +1
    sw $t0, -4($sp)         # writeback, t0 is sustained
    lw $t2, -16($sp)        # load offset right
    lw $t1, 12($a0)         # load window width
    add $t1, $t1, $t2       # add offset limit
    add $t0, $t0, $t1       # now current index + window width + offset
    lw $t1, 4($a0)          # frame width
    beq $t1, $t0, chdirdown # check if index is at edge
    j forinit
    chdirdown:
        lw $t0, -12($sp)    # load top offset
        addi $t0, $t0, 1    # increment
        sw $t0, -12($sp)    # writeback
        addi $s2, $zero, 1  # change direction to down
        j forinit   # continue
down:    
    lw $t1, 4($a0)          # frame width
    sll $t2, $t1, 2         # convert to addr offset
    add $s3, $s3, $t2       # add to index pointer (move down 1)
    lw $t1, 0($a0)          # load frame height for check later
    lw $t0, -8($sp)         # load current y index
    addi $t0, $t0, 1        # increment index y
    sw $t0, -8($sp)         # store
    lw $t2, 8($a0)          # load window height
    lw $t3, -20($sp)        # load offset bottom
    add $t2, $t2, $t3       # add as offsets
    add $t0, $t0, $t2       # current index + window height + offset 
    beq $t1, $t0, chdirleft # check if 'index' is at edge
    j forinit       # continue
        chdirleft:
        lw $t0, -16($sp)    # load right offset
        addi $t0, $t0, 1    # add 1
        sw $t0, -16($sp)    # writeback
        addi $s2, $zero, 2  # change direction to down
        j forinit   # continue
left:
    addi $s3, $s3, -4 
    lw $t0, -4($sp)         # load current x val
    addi $t0, $t0, -1       # dec index x
    sw $t0, -4($sp)         # writeback
    lw $t1, -24($sp)        # get left offset
    sub $t2, $t0, $t1       
    beq $zero, $t2, chdirup # check if index is at edge
    j forinit
    chdirup:
        lw $t0, -20($sp)    # load offset bottom
        addi $t0, $t0, 1    # increase
        sw $t0, -20($sp)    # writeback
        addi $s2, $zero, 3  # change direction to down
        j forinit
up:
    lw $t1, 4($a0)          # frame width 
    sll $t2, $t1, 2         # convert to addr offset
    sub $s3, $s3, $t2       # add to index pointer (move down 1)
    lw $t0, -8($sp)         # load current y val
    addi $t0, $t0, -1       # dec index y
    sw $t0, -8($sp)         # writeback
    lw $t3, -12($sp)        # load top offset
    sub $t0, $t0, $t3
    beq $zero, $t0, chdirright # check if index is at edge
    j forinit
    chdirright:
        lw $t0, -24($sp)    # load left offset
        addi $t0, $t0, 1    # increment
        sw $t0, -24($sp)    # writeback
        addi $s2, $zero, 0  # change direction to down
        j forinit
#________________________________________________________
# extra functions (still needed)
return:
    j     endtest 
multiply:
        beq $t2, $zero, end_mult  # If $t1 == 0, return (multiplication done)
        add $s6, $s6, $t3         # Add $t0 to the result
        addi $t2, $t2, -1           # Decrement the second number (multiplicand)
        j multiply
multiply2:
        beq $t7, $zero, end_mult2  # If $t1 == 0, return (multiplication done)
        add $t4, $t4, $t0         # Add $t0 to the result
        addi $t7, $t7, -1           # Decrement the second number (multiplicand)
        j multiply2
multiply3:
        beq $t1, $zero, end_mult3  # If $t1 == 0, return (multiplication done)
        add $t3, $t3, $t0         # Add $t0 to the result
        addi $t1, $t1, -1           # Decrement the second number (multiplicand)
        j multiply3

""")

else:
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