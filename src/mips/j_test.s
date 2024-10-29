

.text
.globl main

# addi andi ori xori slti

# add sub mult and or nor xor sll srl slt

# sw lw sb lb sh lh

# bgez beq bne bgtz blez bltz j jr jal

main:
    jal jalpoint
    nop
    nop
    nop
    nop
    nop
    j main
    nop
    nop
    nop
    nop
    nop
    
jalpoint:
    jr $ra
    nop
    nop
    nop
    nop
    nop