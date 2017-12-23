# Project 3 Instructions - MIPS Control Structures

## Objective
* Practice MIPS loops, conditionals, procedures, and dialog SYSCALLs.

## Details
* Use the dialog `syscall` (#54) to input a string from the user
* Call a function which counts the number of characters and number of words in the string and returns these in `$v0` and `$v1`; store these in memory
* Output (console) the string and counts to the user
* Repeat from 1 until the user enters a blank string or hits "cancel"
* Additionally, use `$s1` in your function so that you must save it on the stack at the top of your function and restore it before the function exits
* Output a dialog message (`syscall` #59) to say goodbye before the program ends
