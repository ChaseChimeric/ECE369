
.text
.globl main



main:
    addi $2, $0, 1
    addi $3, $0, 2
    beq $2, $3, fail # not taken, 1 != 2
    addi $3, $0, 1
    beq $2, $3, continue # 1==1
    addi $8, $0, -2 # fail

continue:
    bne $2, $3, fail2# not taken !(1==1)
    addi $3, $0, 4
    bne $2, $3, continue2 # 1!= 4
    addi $8, $0, -4

# bgez gt and eq cases
continue2:
    addi $2, $0, 5
    bgez $2, continue3 
    addi $8, $0, -5

continue3:
    addi $2, $0, 0
    bgez $2, continue4
    addi $8, $0, -6

# blez lt and eq cases
continue4:
    addi $2, $0, -1
    blez $2, continue5
    addi $8, $0, -7

continue5:
    addi $2, $0, 0
    blez $2, continue6
    addi $8, $0, -8

# bgtz gt case
continue6:
    addi $2, $0, 5
    bgtz $2, continue7
    addi $8, $0, -9

# blez lt case
continue7:
    addi $2, $0, -1
    bltz $2, continue8
    addi $8, $0, -10

# bgtz eq 0 fail check
continue8:
    addi $2, $0, 0
    bgtz $2, fail3

# bgtz lt 0 fail check
continue9:
    addi $2, $0, -1
    bgtz $2, fail4

# blez eq 0 fail check
continue10:
    addi $2, $0, 0
    bltz $2, fail5

# bltz gt 0 fail check
continue11:
    addi $2, $0, 1
    bltz $2, fail6

continue12:
    j end

fail:
    addi $8, $0, -1
    j end
fail2:
    addi $8, $0, -3
    j end
fail3:
    addi $8, $0, -11
    j end
fail4:
    addi $8, $0, -12
    j end
fail5:
    addi $8, $0, -13
    j end         
fail6:
    addi $8, $0, -14
    j end

end:
    j end
    nop
    nop
    nop
    nop
    nop