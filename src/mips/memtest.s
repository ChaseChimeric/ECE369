
.data

memstart: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
.text

.globl main

main:
	addi $s0, $0, 0
	#la $s0, memstart
	lw $t0, 0($s0) # t0 = 1
	lw $t1, 4($s0) # t1 = 2
	lw $t2, 8($s0) # t2 = 3
	lw $t3, 12($s0) # t3 = 4
	addi $t0, $t0, -10 # t0 = -9
	addi $t1, $t1, -10 # t1 = -8
	addi $t2, $t2, -10 # t2 = -7
	addi $t3, $t3, -10 # t3 = -6
	sw $t0, 20($s0)# -9
	sw $t1, 24($s0)# -8
	sw $t2, 28($s0)# -7
	sw $t3, 32($s0)# -6
	sw $t0, 0($sp) #same
        sw $t1, -4($sp)
        sw $t2, -8($sp)
        sw $t3, -12($sp)
loop:
	j loop
	
