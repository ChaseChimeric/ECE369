
.text
.globl main



main:
    addi $2, $0, 1
    nop
    nop
    nop
    nop
    nop
    addi $3, $0, 2
    nop
    nop
    nop
    nop
    nop
    beq $2, $3, fail # not taken, 1 != 2
    nop
    nop
    nop
    nop
    nop
    addi $3, $0, 1
    nop
    nop
    nop
    nop
    nop
    beq $2, $3, continue # 1==1
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -2 # fail
    nop
    nop
    nop
    nop
    nop
continue:
    bne $2, $3, fail2# not taken !(1==1)
    nop
    nop
    nop
    nop
    nop
    addi $3, $0, 4
    nop
    nop
    nop
    nop
    nop
    bne $2, $3, continue2 # 1!= 4
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -4
    nop
    nop
    nop
    nop
    nop


# bgez gt and eq cases
continue2:
    addi $2, $0, 5
    nop
    nop
    nop
    nop
    nop
    bgez $2, continue3 
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -5
    nop
    nop
    nop
    nop
    nop
continue3:
    addi $2, $0, 0
    nop
    nop
    nop
    nop
    nop
    bgez $2, continue4
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -6
    nop
    nop
    nop
    nop
    nop


# blez lt and eq cases
continue4:
    addi $2, $0, -1
    nop
    nop
    nop
    nop
    nop
    blez $2, continue5
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -7
    nop
    nop
    nop
    nop
    nop
continue5:
    addi $2, $0, 0
    nop
    nop
    nop
    nop
    nop
    blez $2, continue6
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -8
    nop
    nop
    nop
    nop
    nop


# bgtz gt case
continue6:
    addi $2, $0, 5
    nop
    nop
    nop
    nop
    nop
    bgtz $2, continue7
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -9
    nop
    nop
    nop
    nop
    nop
# blez lt case
continue7:
    addi $2, $0, -1
    nop
    nop
    nop
    nop
    nop
    bltz $2, continue8
    nop
    nop
    nop
    nop
    nop
    addi $8, $0, -10
    nop
    nop
    nop
    nop
    nop


# bgtz eq 0 fail check
continue8:
    addi $2, $0, 0
    nop
    nop
    nop
    nop
    nop
    bgtz $2, fail3
    nop
    nop
    nop
    nop
    nop
#bgtz lt 0 fail check
continue9:
    addi $2, $0, -1
    nop
    nop
    nop
    nop
    nop
    bgtz $2, fail4
    nop
    nop
    nop
    nop
    nop
# blez eq 0 fail check
continue10:
    addi $2, $0, 0
    nop
    nop
    nop
    nop
    nop
    bltz $2, fail5
    nop
    nop
    nop
    nop
    nop
#bltz gt 0 fail check
continue11:
    addi $2, $0, 1
    nop
    nop
    nop
    nop
    nop
    bltz $2, fail6
    nop
    nop
    nop
    nop
    nop

continue12:
    j end
    nop
    nop
    nop
    nop
    nop










fail:
    addi $8, $0, -1
    nop
    nop
    nop
    nop
    nop
    j end
    nop
    nop
    nop
    nop
    nop
fail2:
    addi $8, $0, -3
    nop
    nop
    nop
    nop
    nop
    j end
    nop
    nop
    nop
    nop
    nop
fail3:
    addi $8, $0, -11
    nop
    nop
    nop
    nop
    nop
    j end
    nop
    nop
    nop
    nop
    nop
fail4:
    addi $8, $0, -12
    nop
    nop
    nop
    nop
    nop
    j end
    nop
    nop
    nop
    nop
    nop
fail5:
    addi $8, $0, -13
    nop
    nop
    nop
    nop
    nop
    j end
    nop
    nop
    nop
    nop
    nop         
fail6:
    addi $8, $0, -14
    nop
    nop
    nop
    nop
    nop
    j end
    nop
    nop
    nop
    nop
    nop

end:
    j end
    nop
    nop
    nop
    nop
    nop