# SAD = 0
# location (1, 1)

########################################################################################################################
### data
########################################################################################################################
.data
asize0:	.word	3, 4, 2, 2

frame0:	.word	122, 41, 84, 91
.word	170, 7, 35, 32
.word	98, 191, 79, 28

window0:	.word	7, 35
.word	191, 79
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

