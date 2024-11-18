# SAD = 2457
# location (1, 45)

########################################################################################################################
### data
########################################################################################################################
.data
asize0:	.word	8, 53, 7, 7

frame0:	.word	37, 104, 11, 149, 104, 88, 156, 145, 19, 17, 143, 25, 76, 179, 63, 35, 59, 104, 39, 161, 6, 149, 170, 151, 192, 60, 160, 29, 104, 61, 199, 139, 193, 79, 49, 17, 193, 34, 45, 15, 24, 67, 73, 87, 49, 79, 200, 193, 191, 114, 52, 108, 47
.word	23, 65, 101, 29, 158, 133, 108, 70, 67, 129, 189, 183, 61, 189, 108, 17, 165, 125, 6, 14, 79, 17, 157, 57, 135, 156, 21, 175, 122, 71, 26, 17, 70, 29, 11, 41, 86, 112, 54, 64, 57, 9, 167, 13, 102, 95, 7, 32, 163, 62, 3, 194, 9
.word	129, 200, 50, 12, 180, 117, 154, 123, 8, 182, 6, 92, 120, 117, 110, 77, 91, 58, 191, 32, 28, 82, 120, 82, 20, 100, 133, 93, 183, 128, 169, 108, 171, 42, 107, 10, 106, 39, 46, 186, 148, 59, 115, 161, 3, 90, 102, 197, 94, 163, 111, 168, 132
.word	76, 196, 156, 193, 59, 154, 57, 179, 150, 96, 138, 83, 152, 177, 77, 175, 101, 47, 146, 180, 174, 108, 186, 22, 6, 104, 67, 71, 148, 15, 114, 101, 127, 25, 4, 132, 143, 7, 31, 81, 42, 60, 120, 153, 130, 20, 38, 32, 168, 117, 109, 49, 27
.word	109, 27, 38, 39, 118, 188, 151, 32, 46, 12, 179, 84, 61, 105, 125, 34, 50, 199, 155, 162, 165, 186, 24, 40, 47, 60, 189, 130, 165, 12, 59, 174, 88, 6, 43, 43, 18, 85, 161, 174, 165, 3, 54, 65, 71, 32, 163, 25, 0, 70, 105, 25, 23
.word	101, 61, 172, 90, 160, 26, 0, 101, 92, 132, 164, 98, 189, 2, 153, 23, 98, 101, 183, 175, 158, 63, 193, 167, 185, 151, 101, 97, 54, 142, 85, 25, 17, 95, 63, 137, 183, 171, 70, 5, 85, 99, 27, 127, 70, 1, 39, 6, 90, 68, 80, 140, 91
.word	151, 0, 171, 129, 51, 47, 18, 188, 139, 65, 45, 172, 6, 45, 149, 163, 82, 18, 123, 95, 152, 172, 44, 128, 141, 185, 177, 166, 74, 198, 144, 143, 158, 62, 41, 103, 82, 76, 160, 153, 171, 175, 51, 151, 186, 162, 149, 173, 177, 194, 77, 157, 78
.word	43, 147, 52, 77, 39, 41, 56, 69, 6, 122, 168, 54, 84, 151, 129, 199, 137, 150, 55, 38, 12, 159, 9, 162, 14, 123, 61, 2, 51, 150, 195, 105, 42, 142, 42, 90, 40, 89, 50, 18, 108, 123, 179, 19, 109, 31, 95, 159, 39, 116, 136, 87, 164

window0:	.word	81, 19, 17, 162, 84, 167, 103
.word	5, 113, 195, 170, 156, 92, 115
.word	67, 167, 80, 1, 146, 188, 42
.word	3, 140, 72, 49, 29, 156, 19
.word	67, 93, 85, 16, 62, 80, 199
.word	112, 7, 177, 82, 49, 67, 92
.word	1, 60, 18, 28, 147, 112, 75
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

