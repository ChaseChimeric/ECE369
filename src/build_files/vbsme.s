# SAD = 0
# location (2, 8)

########################################################################################################################
### data
########################################################################################################################
.data
asize0:	.word	20, 20, 6, 6

frame0:	.word	40, 159, 110, 145, 27, 9, 88, 137, 60, 23, 90, 166, 107, 56, 55, 192, 32, 46, 96, 113
.word	36, 151, 126, 66, 145, 145, 129, 150, 35, 145, 190, 101, 184, 162, 29, 49, 111, 153, 173, 150
.word	82, 97, 61, 104, 194, 39, 68, 129, 72, 55, 84, 2, 117, 27, 86, 81, 162, 60, 11, 181
.word	9, 26, 16, 7, 81, 47, 89, 16, 127, 45, 157, 137, 84, 150, 98, 58, 22, 115, 108, 158
.word	17, 106, 100, 16, 62, 66, 50, 14, 74, 57, 170, 179, 92, 165, 153, 126, 150, 99, 29, 70
.word	109, 186, 106, 124, 196, 112, 3, 100, 122, 3, 18, 110, 67, 97, 10, 147, 57, 24, 91, 88
.word	144, 162, 115, 22, 119, 190, 182, 62, 78, 38, 172, 86, 119, 51, 45, 29, 179, 69, 179, 138
.word	19, 55, 0, 49, 168, 60, 3, 159, 138, 162, 97, 65, 73, 160, 92, 151, 0, 146, 158, 46
.word	41, 100, 159, 87, 178, 182, 81, 15, 67, 183, 37, 179, 26, 49, 150, 184, 19, 83, 115, 35
.word	16, 54, 137, 9, 169, 95, 195, 89, 25, 127, 159, 42, 150, 146, 94, 99, 183, 101, 174, 109
.word	82, 49, 127, 2, 78, 37, 189, 123, 117, 82, 109, 190, 196, 137, 91, 76, 53, 108, 34, 178
.word	177, 192, 66, 67, 92, 18, 60, 118, 26, 179, 167, 42, 62, 193, 28, 52, 3, 115, 107, 45
.word	196, 128, 173, 182, 83, 7, 72, 61, 7, 74, 9, 81, 22, 88, 167, 29, 86, 109, 85, 11
.word	126, 62, 95, 166, 25, 160, 112, 187, 87, 0, 119, 91, 150, 158, 157, 155, 116, 7, 145, 128
.word	184, 3, 89, 73, 178, 195, 180, 152, 133, 41, 57, 93, 119, 166, 38, 27, 115, 16, 8, 74
.word	105, 140, 39, 136, 127, 36, 151, 11, 173, 12, 3, 181, 4, 19, 137, 183, 4, 135, 197, 78
.word	143, 88, 90, 83, 173, 9, 43, 55, 89, 51, 172, 82, 194, 99, 49, 133, 53, 36, 43, 65
.word	151, 10, 110, 163, 171, 10, 43, 105, 177, 176, 25, 25, 138, 106, 25, 73, 156, 35, 129, 88
.word	12, 170, 153, 71, 107, 80, 2, 101, 31, 145, 199, 149, 78, 56, 170, 106, 189, 142, 187, 125
.word	114, 19, 43, 28, 57, 26, 62, 72, 103, 11, 174, 90, 73, 74, 197, 33, 155, 96, 144, 199

window0:	.word	72, 55, 84, 2, 117, 27
.word	127, 45, 157, 137, 84, 150
.word	74, 57, 170, 179, 92, 165
.word	122, 3, 18, 110, 67, 97
.word	78, 38, 172, 86, 119, 51
.word	138, 162, 97, 65, 73, 160
########################################################################################################################
### main
########################################################################################################################
.text
.globl main
main: 
    addi    $sp, $sp, -4    # Make space on stack
    sw      $ra, 0($sp)     # Save return address
addi $a0, $0, 0
addi $a1, $a0, 16
lw $t0, 0($a0)
lw $t1, 4($a0)
mul $t3, $t0, $t1
sll $t3, $t3, 2
    add $a2, $t3, $a1
    jal     vbsme           # call function
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
    add $0, $0, $0
    jr $ra
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
    add $0, $0, $0
    jr $ra 

