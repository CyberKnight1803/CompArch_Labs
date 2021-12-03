#length of string
.data
msg: .asciiz "example"
msg1: .asciiz "Length of string is: "
.text
main:
    la $a0,msg
    li $t0,0
    loop:
    lb $t1,0($a0)
    beqz $t1,exit
    addi $a0,$a0,1
    addi $t0,$t0,1
    j loop
    exit:
    la $a0,msg1
    li $v0,4
    syscall
    move $a0,$t0
    li $v0,1
    syscall
    li $v0, 10
    syscall