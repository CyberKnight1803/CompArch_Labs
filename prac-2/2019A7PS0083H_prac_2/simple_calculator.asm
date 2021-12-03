#user specified operation
.data
msg: .asciiz "Enter a number: "
msg1: .asciiz "The result is: "
msg2: .asciiz "Enter operand (0 for +,1 for -,2 for * ,3 for /) : "
.text
main:
    #input num1
    la $a0,msg
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t0,$v0

    #input num2
    la $a0,msg
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t1,$v0

    #input operand
    la $a0,msg2
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t3,$v0

    #perform operation
    beq $t3,0,A
    beq $t3,1,S
    beq $t3,2,M
    beq $t3,3,D
A:
    add $t2, $t0, $t1
    j Exit
S:
    sub $t2, $t0, $t1
    j Exit
M:
    mult $t0, $t1
    mflo $t2
    j Exit
D:
    div $t2, $t0, $t1
    mflo $t2 # quotient to $t2
    j Exit
Exit:
    la $a0,msg1
    li $v0,4
    syscall
    move $a0,$t2 #result of calc in t2 is moved to a0
    li $v0,1
    syscall
    li $v0, 10
    syscall