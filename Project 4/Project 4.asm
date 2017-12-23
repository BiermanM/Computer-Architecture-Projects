# Matthew Bierman
# CS 3340.003
# 10/15/17

# This program inputs the user's height and weight
# and outputs their body mass index (BMI)

	.data
height:	.word	0
weight:	.word	0
wConst:	.word	703
bmiC1:	.float	18.5
bmiC2:	.float	25.0
bmiC3:	.float	30.0
msg1:	.asciiz	"Please enter your height in inches: "
msg2:	.asciiz	"Now enter your weight in pounds (round to a whole number): "
msg3:	.asciiz	"Your BMI is: "
msg4:	.asciiz	"\nThis is considered underweight."
msg5:	.asciiz	"\nThis is a normal weight."
msg6:	.asciiz	"\nThis is considered overweight."
msg7:	.asciiz	"\nThis is considered obese."

	.text
main:
# Get height
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg1	# set string as argument for system call
	syscall			# print "Please enter your height in inches: "
	
	li	$v0, 5		# set system call to code 5 (read integer)
	syscall			# get input (integer) from user
	sw	$v0, height	# store input in height
	
# Get weight	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg2	# set string as argument for system call
	syscall			# print "Now enter your weight in pounds (round to a whole number): "
	
	li	$v0, 5		# set system call to code 5 (read integer)
	syscall			# get input (integer) from user
	sw	$v0, weight	# store input in weight
	
# Calculate BMI
	lwc1	$f0, weight	# load weight into $f0 coprocessor 1 register
	lwc1	$f1, wConst	# load 703 into $f1 coprocessor 1 register
	cvt.s.w	$f2, $f0	# convert word in $f0 to single floating point in $f2
	cvt.s.w	$f3, $f1	# convert word in $f1 to single floating point in $f3
	mul.s	$f2, $f2, $f3	# weight = weight * 703
	
	lwc1	$f4, height	# load weight into $f0 coprocessor 1 register
	cvt.s.w	$f5, $f4	# convert word in $f4 to single floating point in $f5
	mul.s	$f5, $f5, $f5	# height = height * height
	
	div.s	$f6, $f2, $f5	# bmi = weight / height


# Print BMI
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg3	# set string as argument for system call
	syscall			# print "Your bmi is: "
	
	li	$v0, 2		# set system call to code 2 (print float)
	mov.s	$f12, $f6	# move bmi to $f12
	syscall			# print bmi value
	
# Determine weight class
	lwc1	$f7, bmiC1	# load 18.5 into $f7 register
	c.lt.s	$f6, $f7	# if (bmi < 18.5)
	bc1t	underweight	# then jump to underweight
	
	lwc1	$f7, bmiC2	# load 25 into $f7 register
	c.lt.s	$f6, $f7	# else if (bmi < 25)
	bc1t	normalWeight	# then jump to normalWeight
	
	lwc1	$f7, bmiC3	# load 30 into $f7 register
	c.lt.s	$f6, $f7	# else if (bmi < 30)
	bc1t	overweight	# then jump to overweight
	
	bc1f	obese		# else, jump to obese
	
underweight:
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg4	# set string as argument for system call
	syscall			# print "This is considered underweight.\n"
	
	j	exit		# jump to exit

normalWeight:
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg5	# set string as argument for system call
	syscall			# print "This is a normal weight.\n"
	
	j	exit		# jump to exit

overweight:
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg6	# set string as argument for system call
	syscall			# print "This is considered overweight.\n"
	
	j	exit		# jump to exit

obese:
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg7	# set string as argument for system call
	syscall			# print "This is considered obese.\n"

exit:
	li	$v0, 10		# set system call to code 10 (exit)
	syscall			# exit the program
