.data 
min: .asciiz "min: "
newLine: .asciiz "\n"
max: .asciiz "max: "

.text
main: 
    li $v0, 5
    syscall 

    move $t0, $v0 

    li $v0, 5
    syscall 

    move $t1, $v0 

    bgt $t0, $t1, MAX 
    blt $t0, $t1, MIN 

    MAX:
        la $a0, min 
        li $v0, 4
        syscall 

        move $a0, $t1 
        li $v0, 1
        syscall 

        la $a0, newLine
        li $v0, 4
        syscall 

        la $a0, max 
        li $v0, 4
        syscall 

        move $a0, $t0 
        li $v0, 1
        syscall 

        j EXIT 
    
    MIN:
        la $a0, min 
        li $v0, 4
        syscall 

        move $a0, $t0 
        li $v0, 1
        syscall 

        la $a0, newLine
        li $v0, 4
        syscall 

        la $a0, max 
        li $v0, 4
        syscall 

        move $a0, $t1 
        li $v0, 1
        syscall 

        j EXIT 
    
    EXIT:
        li $v0, 10
        syscall 