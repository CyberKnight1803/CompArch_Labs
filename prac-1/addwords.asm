.data
    x: .word 10
    y: .word 20

.text
main:
    la $a0, x
    lw $t0, ($a0)

    la $a0, y 
    lw $t1, ($a0) 

    add $t2, $t0, $t1 
    move $a0, $t2 
    li $v0, 1
    syscall 

    li $v0, 10
    syscall