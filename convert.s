.data
    prmt:        .asciiz    "please enter an integer (0 to quit): "
    part1:       .asciiz    " decimal = "
    part2:       .asciiz    "binary\n"
    space:       .asciiz    " "
    prgmexit:    .asciiz    "program exits.\n"
.globl main
.text
# main program
main: li $v0 4
      la $a0 prmt
      syscall

      li $v0 5
      syscall

      beq $v0 $zero Exit
      move $s0 $v0 # input integer

      # set program prarameter
      # t0 = loop counter
      # t1 = and operand
      # s0 = save result
      # t3 = counter for white space
      addi $s1 0          # result
      addi $t0 32         # loop counter
      lui $t1 0x8000      # set and operand
      addi $t3 $zero 3    # set counter for whitespace to 3

      # print decimal integer
      li $v0 1
      move $a0 $s0
      syscall

      # print string segment
      li $v0 4
      la $a0 part1
      syscall

      # set v0 to print integer
      li $v0 1

# mask loop begins
Loop: and $t2 $s0 $t1       # mask input
      beq $t2 $zero Prnt    # if 0 directly print
      addi $t2 $zero 1      # if not 0 set to print 1

# print out 1 bit
Prnt: move $a0 $t2          # move result to print
      syscall               # print result
      srl $t1 $t1 1         # shift left result by 1 bit

      bne $t3 $zero npnt    # every 4 print out follows a white space
      addi $t3 4            # reset white space counter to 4

                            # print out white space
      li $v0 4
      la $a0 space
      syscall

      li $v0 1              # reset print mode to integer

# don't print white space
npnt: addi $t3 -1

      addi $t0 -1           # loop counter decrease by 1
      beq $t0 0 lpet        # loop out when counter is 0
      j Loop                # jump back to loop

# print out another string segment
lpet: li $v0 4
      la $a0 part2
      syscall

      j main                # jump to main

# program exit
Exit: li $v0 4
      la $a0 prgmexit
      syscall
      li $v0 10
      syscall
