# Matthew Bierman
# CS 3340.003
# 9/3/17
# This programs gets the sum of the last four digits of my phone number

	.data
digit1:	.word	2		# set the first digit equal to 2
digit2:	.word	8		# set the first digit equal to 8
digit3:	.word	9		# set the first digit equal to 9
digit4:	.word	2		# set the first digit equal to 2
sum:	.word	0		# set the sum initially equal to 0

# the program loads the four digits, adds each number into the $t0 register, and stores the value into sum
	.text
main:
	lw	$t1, digit1	# load the first digit into the $t1 register
	lw	$t2, digit2	# load the second digit into the $t2 register
	lw	$t3, digit3	# load the third digit into the $t3 register
	lw	$t4, digit4	# load the fourth digit into the $t4 register
	add	$t0, $t1, $t2	# add the first and second digit together and store the sum in the $t0 register
	add	$t0, $t0, $t3	# add the current value of the $t0 register (digit1 + digit2) and the third digit and store the sum in the $t0 register
	add	$t0, $t0, $t4	# add the current value of the $t0 register (digit1 + digit2 + digit3) and the fourth digit and store the sum in the $t0 register
	sw	$t0, sum	# store the value of the $t0 register in the sum variable
	
exit:
	li	$v0, 10		# 10 is the system code for exiting a program
	syscall			# executes the system call of 10 (exit) that was loaded into $v0
	
