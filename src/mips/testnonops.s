

.text
.globl main

# addi andi ori xori slti

# add sub mult and or nor xor sll srl slt

# sw lw sb lb sh lh

# bgez beq bne bgtz blez bltz j jr jal

main:
    addi $1, $0, 5 # will be 5





    andi $2, $1, 15 # should be 5





    ori $3, $1, 10 # should be 15





    xori $4, $3, 14 # should be 1 i think





    slti $5, $0, 69 # shold be 1






    add $6, $1, $2 # should be 10?





    sub $7, $0, $2 # shld be -5





    mul $8, $1, $2 # shold be 25 





    and $9, $6, $7 # should be 10?





    or $10, $6, $8 # should be 27?





    nor $11, $6, $8 # shold be  -28





    xor $12, $6, $8 # should be 19?





    sll $13, $6, 5 # should be 320





    srl $14, $13, 2 # should be 80





    slt $15, $1, $3 # should be 1?






    addi $16, $0, 256 # Should be 256





    addi $1, $0, 0    # Should be 0





    sw $16, 0($1)





    addi $16, $0, 200





    sh $16, 4($1)





    sh $0, 6($1)





    lw $17, 0($1)





    lh $18, 4($1)





    addi $16, $0, 111





    sb $16, 2($1)





    lw $19, 0($1)






    addi $1, $0, 17





    bgez $19, branch1





    addi $1, $0 -1





branch1:
    beq $1, $1, branch2





    addi $1, $0, -2





branch2:
    bne $1, $0, branch3





    addi $1, $0, -3





branch3:
    bgtz $3, branch4





    addi $1, $0, -4





branch4:
    blez $0, branch5





    addi $1, $0, -5





branch5: 
    addi $2, $0, -1





    bltz $2, branch6





    addi $1, $0, -6





branch6: 
    jal jalpoint





    addi $21, $0, 5





    addi $22, $0, 0





    j loop






jalpoint:
    addi $20, $0, 6969





    jr $ra






loop:
    blez $21, loopend





    addi $22, $22, 2





    addi $21, $21, -1





    j loop





loopend:
    add $1, $0, $0





    j loopend
    nop
    nop
    nop
    nop
    nop




