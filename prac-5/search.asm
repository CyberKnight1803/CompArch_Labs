.data 
char: .byte 'a' 
S: .asciiz "Omkar" 

.text 
main:

    lb $t0, char 
    li $t1, 0 

    la $s0, S 
    SEARCH:
        lb $t2, ($s0) 
        beq $t2, $t0, FOUND 
        addi $s0, $s0, 1
        addi $t1, $t1, 1
        bne $t2, $zero, SEARCH

    li $a0, -1 
    li $v0, 1
    syscall 

    j EXIT 

    
    FOUND:
        move $a0, $t1 
        li $v0, 1
        syscall 

        j EXIT 
    
    EXIT: 
        li $v0, 10
        syscall 
