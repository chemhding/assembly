.data
        pmt1:   .asciiz    "Please enter an integer for a: "
        pmt2:   .asciiz    "Please enter an integer for b: "
        pmt3:   .asciiz    "Please enter an integer for c: "
        pmt4:   .asciiz    "Please enter an integer for X: "
        pmt5:   .asciiz    "a * X^2 + b * x + c = "
        sym1:   .asciiz    " * "
        sym2:   .asciiz    "^2"
        sym3:   .asciiz    " + "
        sym4:   .asciiz    " = "
        end:    .asciiz    "\n\nProgram Exits"
.globl main
.text
        main:
                # store user input into $s1 for a
                li $v0, 4
                la $a0, pmt1
                syscall
                li $v0, 5
                syscall
                move $s1, $v0

                # store user input into $s2 for b
                li $v0, 4
                la $a0, pmt2
                syscall
                li $v0, 5
                syscall
                move $s2, $v0

                # store user input into $s2 for c
                li $v0, 4
                la $a0, pmt3
                syscall
                li $v0, 5
                syscall
                move $s3, $v0

                # store user input into $s2 for X
                li $v0, 4
                la $a0, pmt4
                syscall
                li $v0, 5
                syscall
                move $s4, $v0

                # calculation
                mul $t0, $s4, $s4   # $t0 = X * X
                mul $s0, $s1, $t0   # $s0 = a * X^2
                mul $t0, $s2, $s4   # $t0 = b * X
                add $s0, $s0, $t0   # $s0 = a * X^2 + b * X
                add $s0, $s0, $s3   # $s0 = a * X^2 + b * X + c

                # print out formula
                li $v0, 4
                la $a0, pmt5
                syscall

                # print out value for a
                li $v0, 1
                move $a0, $s1
                syscall

                # print " * "
                li $v0, 4
                la $a0, sym1
                syscall

                # print out value for X
                li $v0, 1
                move $a0, $s4
                syscall

                # print "^2" and " + "
                li $v0, 4
                la $a0, sym2
                syscall
                la $a0, sym3
                syscall

                # print out value for b
                li $v0, 1
                move $a0, $s2
                syscall

                # print " * "
                li $v0, 4
                la $a0, sym1
                syscall

                # print out value for X
                li $v0, 1
                move $a0, $s4
                syscall

                # print " + "
                li $v0, 4
                la $a0, sym3
                syscall

                # print out value for c
                li $v0, 1
                move $a0, $s3
                syscall

                # print " = "
                li $v0, 4
                la $a0, sym4
                syscall

                # print out result
                li $v0, 1
                move $a0, $s0
                syscall

                # exit program
                li $v0, 4
                la $a0, end
                syscall
                li $v0, 10
                syscall
