.data
S: .asciiz "Hello Omkar"

.text
main:
    la $a0, S 
    jal stringLen

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

stringLen:
    addi $sp, $sp, -8
    sw $a0, ($sp)
    sw $ra, 4($sp)

    li $t0, -1
    LOOP:
        lb $t1, 0($a0)
        addi $a0, $a0, 1
        addi $t0, $t0, 1
        bnez $t1, LOOP 

    move $v0, $t0
    
    lw $a0, ($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    jr $ra
    
