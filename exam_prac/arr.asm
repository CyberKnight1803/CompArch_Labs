.data
N: .space 4
A: .space 4
space: .asciiz " "

.text 
main:
    li $v0, 5
    syscall 

    sw $v0, N 

    lw $a0, N
    li $t0, 4

    mult $a0, $t0 
    mflo $a0 

    li $v0, 9 
    syscall

    sw $v0, A 

    li $t0, 0
    lw $s1, N 
    li $s0, 0 

    INPUT:
        li $v0, 5
        syscall 

        sw $v0, A($s0) 
        addi $s0, $s0, 4 
        addi $t0, $t0, 1

        blt $t0, $s1, INPUT 
    
    li $t0, 0
    li $s0, 0

    PRINT:
        lw $a0, A($s0) 
        li $v0, 1
        syscall 

        la $a0, space 
        li $v0, 4
        syscall 

        addi $s0, $s0, 4
        addi $t0, $t0, 1
        blt $t0, $s1, PRINT 

    END:
        li $v0, 10
        syscall 


    