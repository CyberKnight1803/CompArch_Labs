.data 
N: .space 4 
M: .space 4

F: .space 2000

inputN: .asciiz "Input N: "
inputM: .asciiz "Input M: "
open: .asciiz "("
comam: .asciiz ","
close: .asciiz ")" 
whitespace: .asciiz " "

.text 
main:

    # INPUT 
    la $a0, inputN
    li $v0, 4
    syscall 

    li $v0, 5
    syscall 

    sw $v0, N 

    la $a0, inputM
    li $v0, 4
    syscall 

    li $v0, 5
    syscall 

    sw $v0, M

    # BASE CASE
    la $s0, F
    li $t0, 0

    sw $t0, ($s0)
    addi $s0, $s0, 4
    li $t0, 1
    sw $t0, ($s0)    

    # CALCULATE FIB
    lw $t0, N
    li $t1, 3
    la $s0, F
    addi $s0, $s0, 8 
    FIB:
        addi $s1, $s0, -8 
        addi $s2, $s0, -4 

        lw $t4, ($s1)
        lw $t5, ($s2) 

        add $t4, $t4, $t5 
        sw $t4, ($s0)

        addi $s0, $s0, 4
        addi $t1, $t1, 1
        ble $t1, $t0, FIB 
    
    la $s0, F
    li $t1, 0 
    addi $t3, $t0, -1 
    lw $s5, M 

    OUTER_LOOP:
        move $t2, $t1 
        addi $t2, $t2, 1

        addi $s1, $s0, 4
        blt $t2, $t0, INNER_LOOP

    A:
        addi $t1, $t1, 1
        addi $s0, $s0, 4
        beq $t1, 2, A
        blt $t1, $t3, OUTER_LOOP
        j EXIT 

    INNER_LOOP:
        lw $t6, ($s0)
        lw $t7, ($s1) 

        add $t4, $t6, $t7 
        bgt $t4, $s5, PRINT 

        B:
            addi $t2, $t2, 1
            addi $s1, $s1, 4
            blt $t2, $t0, INNER_LOOP
            j A
    
    PRINT:
        la $a0, open 
        li $v0, 4
        syscall 

        move $a0, $t6
        li $v0, 1
        syscall 

        la $a0, comam
        li $v0, 4
        syscall 

        move $a0, $t7 
        li $v0, 1
        syscall 

        la $a0, close 
        li $v0, 4
        syscall 

        la $a0, whitespace
        li $v0, 4
        syscall 

        j B


    EXIT:
        li $v0, 10
        syscall 
