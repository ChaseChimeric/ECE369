

.text
.globl main

# addi andi ori xori slti

# add sub mult and or nor xor sll srl slt

# sw lw sb lb sh lh

# bgez beq bne bgtz blez bltz j jr jal

main:
    addi $1, $0, 5 # will be 5
    nop
    nop
    nop
    nop
    andi $2, $1, 15 # should be 5
    nop
    nop
    nop
    nop
    ori $3, $1, 10 # should be 15
    nop
    nop
    nop
    nop
    xori $4, $3, 14 # should be 1 i think
    nop
    nop
    nop
    nop
    slti $5, $0, 69 # shold be 1
    nop
    nop
    nop
    nop

    add $6, $1, $2 # should be 10?
    nop
    nop
    nop
    nop
    sub $7, $0, $2 # shld be -5
    nop
    nop
    nop
    nop
    mult $8, $1, $2 # shold be 25 
    nop
    nop
    nop
    nop
    and $9, $6, $7 # should be 10?
    nop
    nop
    nop
    nop
    or $10, $6, $8 # should be 27?
    nop
    nop
    nop
    nop
    nor $11, $6, $8 # shold be  4?
    nop
    nop
    nop
    nop
    xor $12, $6, $8 # should be 19?
    nop
    nop
    nop
    nop
    sll $13, $6, 5 # should be 320
    nop
    nop
    nop
    nop
    srl $14, $13, 2 # should be 80
    nop
    nop
    nop
    nop
    slt $15, $1, $3 # should be 1?
    nop
    nop
    nop
    nop

    addi $16, $0, 256
    nop
    nop
    nop
    nop
    sw $16, 0($1)
    nop
    nop
    nop
    nop
    addi $16, $0, 200
    nop
    nop
    nop
    nop
    sh $16, 4($1)
    nop
    nop
    nop
    nop
    lw $17, 0($1)
    nop
    nop
    nop
    nop
    lh $18, 4($1)
    nop
    nop
    nop
    nop
    addi $16, $0, 111
    nop
    nop
    nop
    nop
    sb $16, 2($1)
    nop
    nop
    nop
    nop
    lw $19, 0($1)
    nop
    nop
    nop
    nop

    addi $1, $0, 17
    nop
    nop
    nop
    nop
    bgez $19, branch1
    nop
    nop
    nop
    nop
    addi $1, $0 -1
    nop
    nop
    nop
    nop
branch1:
    beq $1, $1, branch2
    nop
    nop
    nop
    nop
    addi $1, $0, -2
    nop
    nop
    nop
    nop
branch2:
    bne $1, $0, branch3
    nop
    nop
    nop
    nop
    addi $1, $0, -3
    nop
    nop
    nop
    nop
branch3:
    bgtz $3, branch4
    nop
    nop
    nop
    nop
    addi $1, $0, -4
    nop
    nop
    nop
    nop
branch4:
    blez $0, branch5
    nop
    nop
    nop
    nop
    addi $1, $0, -5
    nop
    nop
    nop
    nop
branch5: 
    addi $2, $0, -1
    nop
    nop
    nop
    nop
    bltz $2, branch6
    nop
    nop
    nop
    nop
    addi $1, $0, -6
    nop
    nop
    nop
    nop
branch6: 
    jal jalpoint
    nop
    nop
    nop
    nop
    addi $21, $0, 5
    nop
    nop
    nop
    nop
    addi $22, $0, 0
    nop
    nop
    nop
    nop
    j loop
    nop
    nop
    nop
    nop

jalpoint:
    addi $20, $0, 6969
    nop
    nop
    nop
    nop
    jr $ra
    nop
    nop
    nop
    nop

loop:
    blez $21, loopend
    nop
    nop
    nop
    nop
    addi $22, $22, 2
    nop
    nop
    nop
    nop
    addi $21, $21, -1
    nop
    nop
    nop
    nop
    j loop
    nop
    nop
    nop
    nop
loopend:
    add $1, $0, $0
    nop
    nop
    nop
    nop
    j loopend
    nop
    nop
    nop
    nop
