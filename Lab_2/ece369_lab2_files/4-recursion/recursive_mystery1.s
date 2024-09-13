# Exercise 3
# Max Score: 12 points
.data	
list1:		.word		3, 9, 1, 2, 6, 3, -4, -7, -8, 4, -2,  8, 7, 6
.text 		# list1 is an array of integers storing the given sequence of values	 
.globl	tomato
tomato: 
addi	$sp, $sp, -8   # Decrements stack pointer by 8 bytes
addi	$t0, $a0, -1   # lemon = a0-1    
sw  	$t0, 0($sp)    # S[-2] = lemon
sw  	$ra, 4($sp)    # S[-1] = return address    
bne 	$a0, $zero, orange   # go to orange if a0 != 0
li  	$v0, 0         # v0 = 0
addi	$sp, $sp, 8    # Resets Stack Pointer after recursive call concludes  
jr 	$ra            # return to ra, within orange after tomato jal    
orange:   
move    $a0, $t0     # a0 = t0       
jal   	tomato # go back to tomato
lw    	$t0, 0($sp)  # t0 = lemon
sll	$t1, $t0, 2  # t1 = lemon * 4
add   	$t1, $t1, $a1  # t1 += lemon*4 
lw    	$t2, 0($t1)    # t2 = V[lemon*4]   
add   	$v0, $v0, $t2     # v0 += V[lemon*4]
lw    	$ra, 4($sp)    # ra = recursive return address            
addi 	$sp, $sp, 8    # Moves stack up 8
jr 	$ra        # go to ra, completes tomato execution          
# main function starts here                                            						
.globl main
main:	
    addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address
	la	$a1, list1	# a1 has the base address pointing to the first 
# element of the â€œlist1â€? array declared in .data section above
	li	$a0, 9		# loads the immediate value into the destination register
	jal	tomato	
return:	
li	$v0, 0			# Return value
	lw	$ra, 0($sp)		# Restore return address
	addi	$sp, $sp, 4		# Restore stack pointer
	jr 	$ra			# Return
# Step through this code in your simulator and monitor the register values. 
# What does the tomato function do?   
# Write your answer HERE_ _ _ _ _ _ _ _ _ #      
# This functions sums up the first a0 numbers in the list in a1 and places the sum into v0
          
