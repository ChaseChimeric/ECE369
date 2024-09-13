# Exercise 3
# Max Score: 12 points
.data
list1:		.word		3, 9, -1, 0, 6, 5, -4, -7, -8,
list2:		.word		9, 5, 0, 3, -4, 5, 6, -7, 8, 9,
.text
.globl	tomato
tomato:
addi	$sp, $sp, -8       # allocate 2 words in stack
addi	$t0, $a0, -1       # decrement recursive counter
sw  	$t0, 0($sp)        # store t0 to first pos in stack
sw  	$ra, 4($sp)        # store return address in second pos in stack
bne 	$a0, $zero, orange   # if recursive counter ne 0: branch to orange
li  	$v0, 0             # load imm 0 to v0 return reg
addi	$sp, $sp, 8        # move up in stack 2 words
jr 	$ra                  # jump to most recent ra load

orange:
add  $a0, $0, $t0            # load t0 to a0
jal   tomato                 # jump + link to tomato
lw    $t0, 0($sp)            # load stored stack t0 values into $t0
sll	$t1, $t0, 2              # multilpy value in t0 by 4 => t1
add   $t1, $t1, $a1          # add base address of current list
lw    $t2, 0($t1)            # load value list[stack(t1)] to t2
slt   $t3, $t2, $a2          # check if t2 less than $a2 (5i)
bne   $t3, $0, carrot        # branch if not eq / greater than 5
add   $v0, $v0, $t2          # add number to sum, (should be ge to 5)

carrot:
lw    $ra, 4($sp)            # load return address only from stack
addi 	$sp, $sp, 8            # move up in stack, 2 words
jr 	$ra                      # jump to loaded return address
########################################################################
.globl	test
test:
addi	$sp, $sp, -4	# Make space on stack
sw	$ra, 0($sp)		# Save return address
jal	tomato		# call function
lw	$ra, 0($sp)		# Restore return address
addi	$sp, $sp, 4		# Restore stack pointer
jr 	$ra			# Return
########################################################################
# main function starts here                                            #
.globl main
main:	addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)		# Save return address
	la	$a1, list2
	li	$a0, 8
  li    $a2, 5
	jal	test
# What is the value of $v0 at this point? (v0)= _ _ _ _ _ _ _ _        #
# 0x19 = > 25
  la	$a1, list1
	li	$a0, 13
	jal	test
# What is the value of $v0 at this point?	(v0) = _ _ _ _ _ _ _ _       #
# $v0 = 0x22 = > 34
# What does this code compute? Your answer HERE: _ _ _ _ _ _ _ _ _ _ _ _ #
#
# the first tracked value of v0 is the sum of numbers in list 2 greater than / equal to 5 up until index 7 (8-1)
# 9+5+5+6 = 'd25
# the second tracked value of v0 is the sum of numbers greater than / equal to 5 till index 12 (13-1), 
# this doesn't exist so it overflows into the first 2 elements of list 2
# 9+6+5+ /list 2/ + 9 + 5 = 'd34
return:
li	$v0, 0		# Return value
	lw	$ra, 0($sp)		# Restore return address
	addi	$sp, $sp, 4		# Restore stack pointer
	jr 	$ra			# Return
