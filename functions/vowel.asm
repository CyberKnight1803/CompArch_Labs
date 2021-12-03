.data
S: .space 100
newLine: .asciiz "\n"

.text 
main:
    la $a0, S 
    li $a1, 100
    
    li $v0, 8
    syscall 

    jal VOWEL_COUNT

    move $s0, $v0 

    la $a0, newLine
    li $v0, 4
    syscall 

    move $a0, $s0 
    li $v0, 1
    syscall 

    li $v0, 10
    syscall

VOWEL_COUNT:
    addi $sp, $sp, -8 
    sw $a0, ($sp)
    sw $ra, 4($sp)

    li $t0, 0
    LOOP:
        lb $t2, 0($a0)

    A:
        li $t1, 'a'
        beq $t1, $t2, INCREMENT
    
    E:
        li $t1, 'e'
        beq $t1, $t2, INCREMENT
    
    I:
        li $t1, 'i'
        beq $t1, $t2, INCREMENT

    O:
        li $t1, 'o'
        beq $t1, $t2, INCREMENT
    
    U:
        li $t1, 'u'
        beq $t1, $t2, INCREMENT
    
    END_LOOP:
        addi $a0, $a0, 1
        bnez $t2, LOOP

        j END_FUNCTION 
    
    INCREMENT:
        addi $t0, $t0, 1
        
        li $t1, 'a'
        beq $t1, $t2, E 
        
        li $t1, 'e'
        beq $t1, $t2, I 

        li $t1, 'i'
        beq $t1, $t2, O 

        li $t1, 'o'
        beq $t1, $t2, U 

        li $t1, 'u'
        beq $t1, $t2, END_LOOP
    
    END_FUNCTION:
        move $v0, $t0 

        lw $a0, ($sp)
        lw $ra, 4($sp)
        addi $sp, $sp, 8 

        jr $ra