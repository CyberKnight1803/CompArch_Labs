.data 
vector: .space 20 
len: .word 5 
max: .asciiz "Max: "
min: .asciiz "Min: "
newLine: .asciiz "\n"

.text 
main:
    la $a0, vector 
    lw $t0, len 

    li $t1, 0 

    INPUT:
        li $v0, 5
        syscall 

        sw $v0, ($a0)
        addi $a0, $a0, 4 
        addi $t1, $t1, 1

        blt $t1, $t0, INPUT 
    
    la $a0, vector
    lw $t2, ($a0)
    lw $t3, ($a0)

    addi $a0, $a0, 4
    li $t1, 1
    STATS:
        lw $t4, ($a0)
        blt $t4, $t2, MIN 
    A:
        bgt $t4, $t3, MAX 
    B:
        addi $t1, $t1, 1 
        addi $a0, $a0, 4
        blt $t1, $t0, STATS 
    
    j EXIT
    
    MIN:
        li $t2, 0
        add $t2, $t4, $zero 
        j A

    MAX:
        li $t3, 0
        add $t3, $t4, $zero
        j B 

    EXIT:
        la $a0, min 
        li $v0, 4
        syscall 

        move $a0, $t2 
        li $v0, 1
        syscall 

        la $a0, newLine
        li $v0, 4
        syscall 

        la $a0, max 
        li $v0, 4 
        syscall 

        move $a0, $t3 
        li $v0, 1
        syscall 

        li $v0, 10
        syscall 