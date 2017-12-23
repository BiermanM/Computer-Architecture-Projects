# Matthew Bierman
# CS 3340.003
# 9/20/17

# This program inputs a string from the user and counts 
# the number of characters and words in that string

	.data
numChars: 	.word	0
numSpaces: 	.word	0
msg1:		.asciiz	"Enter some text:"
msg2:		.asciiz " words "
msg3:		.asciiz " characters\n"
msg4:		.asciiz "Goodbye!"
msg5:		.asciiz ""
str:		.asciiz	""

	.text
main:
	# get input from user
	li	$v0, 54		# set system call to code 54 (pop-up with input)
	la	$a0, msg1	# display message in pop-up
	la	$a1, str	# set name as argument for system call
	li	$a2, 100	# set input limit of 100 characters
	syscall			# get input (string) from user with pop-up
	
	# count number of characters and spaces in string
	lw	$t0, numChars	# load numChars into t0 register
	lw	$t1, numSpaces	# load numSpaces into t0 register
	la	$a0, str	# load str into a0 register
	jal	count		# jump to count function
	sw	$v0, numChars	# store number of characters result from count function in numChars
	sw	$v1, numSpaces	# store number of words result from count function (and t1++) in numSpaces
	
	# print string inputted by user
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, str	# set string as argument for system call
	syscall			# print string from user input
	
	# print number of characters and words
	li	$v0, 1		# set system call to code 1 (print integer)
	lw	$a0, numSpaces	# set number of words as argument for system call
	syscall			# print number of words
	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg2	# set " words " as argument for system call
	syscall			# print " words "
	
	li	$v0, 1		# set system call to code 1 (print integer)
	lw	$a0, numChars	# set number of characters as argument for system call
	syscall			# print number of characters
	
	li	$v0, 4		# set system call to code 4 (print string)
	la	$a0, msg3	# set " characters" as argument for system call
	syscall			# print " characters"
	
	sw	$zero, numSpaces	# reset numSpaces to 0
	sw	$zero, numChars		# reset numChars to 0
	li	$t5, '\0'		# reset str to '\0' (empty string)
	sw	$t5, str		# store empty string ('\0') in str
	
	j	main		# loop back to beginning of main

exit:
	# say goodbye to user
	li	$v0, 59		# set system call to code 59 (pop-up with text)
	la	$a0, msg4	# display message in pop-up
	la	$a1, msg5	# syscall 59 requires a value to be loaded into a1, so loaded with an empty strin
	syscall
	
	li	$v0, 10		# set system call to code 10 (exit)
	syscall			# exit the program

count:
	# count the number of characters and spaces in a given string
	addi	$sp, $sp, -4		# set space for 1 register
	sw	$s1, 0($sp)		# save $s1 on stack
	
	lbu	$s1, 0($a0)		# load the byte of str at index 0
	beq	$s1, '\0', exit		# if str only contains '\0' (meaning it's an empty string), then exit
	beq	$s1, ' ', foundSpace	# if the character at the current index of str is a space, jump to foundSpace
	bne	$s1, '\n', foundChar	# if not yet reached the end of string (where user pressed enter), jump to foundChar
					# else, exit function and go back to main, after storing variables
	add	$v0, $t0, $zero		# move $t0 to $v0
	addi	$t1, $t1, 1		# 1 + (number of spaces in string) = number of words in string
	add	$v1, $t1, $zero		# move $t1 to $v1
	
	lw	$s1, 0($sp)		# load $s1 from stack
	addi	$sp, $sp, 4		# remove space for 1 register
	
	jr	$ra			# return to main
	
foundChar:
	addi	$a0, $a0, 1		# increment index in string
	addi	$t0, $t0, 1		# increment numChars
	j	count			# jump back to the beginning of count	
	
foundSpace:
	addi	$a0, $a0, 1	# increment index in string
	addi	$t0, $t0, 1	# increment numChars
	addi	$t1, $t1, 1	# increment numSpaces
	j	count		# jump back to the beginning of count
