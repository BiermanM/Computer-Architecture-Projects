# Matthew Bierman
# CS 3340.003
# 9/13/17

# This programs asks the user for their name and three numbers,
# runs the numbers through three individual formulas, 
# and then prints the user's name and the results of the formulas

	.data
a:	.word	0		# initialize a to 0
b:	.word	0		# initialize a to 0
c:	.word	0		# initialize a to 0
ans1:	.word	0		# ans1 = (a + 2) + (b - 5)
ans2:	.word	0		# ans2 = 5 * a - b + 10
ans3:	.word	0		# ans3 = a + b/2
name:	.asciiz	""		# initialize name to an empty string
msg1:	.asciiz	"What is your name? "
msg2:	.asciiz	"Please enter an integer between 1-100: "
msg3:	.asciiz	"your answers are: "

	.text
main:
	# Get name input from user

	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg1	# set msg1 as argument for system call
	syscall			# print "What is your name? "

	li	$v0, 8		# set system call to code 8 (read string)
	la	$a0, name	# set name as argument for system call
	li	$a1, 20		# set input limit of 20 characters as argument for system call
	syscall			# get input (string) from user

	# Get first integer input from user

	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg2	# set msg2 as argument for system call
	syscall			# print "Please enter an integer between 1-100: "
	
	li	$v0, 5		# set system call to code 5 (read integer)
	syscall			# get input (integer) from user
	sw	$v0, a		# store input in a
	
	# Get second integer input from user
	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg2	# set msg2 as argument for system call
	syscall			# print "Please enter an integer between 1-100: "
	
	li	$v0, 5		# set system call to code 5 (read integer)
	syscall			# get input (integer) from user
	sw	$v0, b		# store integer in b
	
	# Get third integer input from user
	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg2	# set msg2 as argument for system call
	syscall			# print "Please enter an integer between 1-100: "
	
	li	$v0, 5		# set system call to code 5 (read integer)
	syscall			# get input (integer) from user
	sw	$v0, c		# store integer in c
	
	
	
	lw	$t1, a		# load the first input digit into the $t1 register
	lw	$t2, b		# load the second input digit into the $t2 register
	lw	$t3, c		# load the third input digit into the $t3 register
	
	# Calculate ans1 = (a + 2) + (b - 5)
	
	addi	$t4, $t1, 2	# set $t4 register equal to a + 2
	addi	$t5, $t2, -5	# set $t5 register equal to b - 5
	add	$t6, $t4, $t5	# set $t6 register equal to $t4 + $t5, aka (a + 2) + (b - 5)
	sw	$t6, ans1	# store result of $t6 in ans1
	
	add	$t4, $zero, $zero	# set the $t4 register to zero
	add	$t5, $zero, $zero	# set the $t5 register to zero
	add	$t6, $zero, $zero	# set the $t6 register to zero
	
	# Calculate ans2 = 5 * a - b + 10
	
	addi	$t4, $zero, 5	# set $t4 register equal to 5
	mult	$t4, $t1	# multiply $t4 register by $t1 register, aka 5 * a
	mflo	$t5		# take lower 32 bits of the result of 5 * a
	sub	$t6, $t5, $t2	# set the $t6 register equal to $t5 - b, aka (5 * a) - b
	addi	$t7, $t6, 10	# set the $t7 register equal to $t6 + 10, aka (5 * a) - b + 10
	sw	$t7, ans2	# store result of $t6 in ans2
	
	add	$t4, $zero, $zero	# set the $t4 register to zero
	add	$t5, $zero, $zero	# set the $t5 register to zero
	add	$t6, $zero, $zero	# set the $t6 register to zero
	add	$t7, $zero, $zero	# set the $t7 register to zero
	
	# Calculate ans3 = a + b/2
	
	srl	$t4, $t2, 1	# set the $t4 register to bit-shift right once of $t2, aka b / 2
	add	$t5, $t1, $t4	# set the $t5 register to a + $t4, aka a + (b / 2)
	sw	$t5, ans3	# store result of $t5 in ans3
	
	# print name of user
	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, name	# set name as argument for system call
	syscall			# print name from user input
	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg3	# set msg3 as argument for system call
	syscall			# print "your answers are: "
	
	# print ans1
	
	li	$v0, 1		# set system call to code 1 (print integer)
	lw	$a0, ans1	# set ans1 as argument for system call
	syscall			# print value of ans1
	
	li	$v0, 11		# set system call to code 11 (print character)
	li	$a0, ' '	# set space as argument for system call
	syscall			# print space
	
	# print ans2
	
	li $v0, 1		# set system call to code 1 (print integer)
	lw $a0, ans2		# set ans2 as argument for system call
	syscall			# print value of ans2
	
	li $v0, 11		# set system call to code 11 (print character)
	li $a0, ' '		# set space as argument for system call
	syscall			# print space
	
	# print ans3
	
	li	$v0, 1		# set system call to code 1 (print integer)
	lw	$a0, ans3	# set ans3 as argument for system call
	syscall			# print value of ans3
	
exit:
	li	$v0, 10		# set system call to code 10 (exit)
	syscall			# exit the program

# Test Cases:
# a = 1, b = 2, c = 3
# ans1 = 0, ans2 = 13, ans3 = 2
#
# a = 10, b = 20, c = 30
# ans1 = 27, ans2 = 40, ans3 = 20
#
# a = 5, b = 70, c = 19
# ans1 = 72, ans2 = -35, ans3 = 40
#
# a = 5, b = 71, c = 19
# ans1 = 73, ans2 = -36, ans3 = 40
#
# a = 0, b = 0, c = 0
# ans1 = -3, ans2 = 10, ans3 = 0
#
# a = 2, b = 31, c = 24
# ans1 = 30, ans2 = -11, ans3 = 17
#
# a = 20, b = 30, c = 40
# ans1 = 47, ans2 = 80, ans3 = 35
