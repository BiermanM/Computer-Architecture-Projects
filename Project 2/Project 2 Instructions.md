# Project 2 Instructions - MIPS Basics

## Objective
* Practice MIPS load/store, integer expressions, and SYSCALLs.

## Details
* In the `.data` section:
  *	3 variables to hold input values: `a`, `b`, `c`
  *	3 variables to hold output values
  *	A variable to hold the user's name
  *	3 variables for messages:
    *	Prompt for name
    *	Prompt for integers
    *	Message for results
*	In the `.text` section write instructions to:
  * Prompt the user for their name and save it
  *	3 times: 
    *	Prompt user for an integer between 1-100 
    *	Read and store the integer
  *	Calculate `ans1 = (a + 2) + (b - 5)` and store the result
  *	Calculate `ans2 = 5 * a - b + 10` and store the result
  *	Calculate `ans3 = a + b/2` and store the result
  *	Display the user's name and message for results
  *	Display the 3 results but print a space character in between for readability
* At the bottom of your program, add comments with test values for `a`, `b`, `c` and the results you expect from the program for `ans1`, `ans2`, `ans3`
