.data 
even: .asciiz "Even" 
odd: .asciiz "Odd"

.text 
main:

    li $v0, 5
    syscall 

    move $t0, $v0 

    li $t1, 2
    div $t0, $t1 

    mfhi $t1 

    beq $t1, 0, EVEN
    beq $t1, 1, ODD

    EVEN:
        la $a0, even 
        li $v0, 4
        syscall 

        j EXIT
    
    ODD:
        la $a0, odd 
        li $v0, 4
        syscall 

        j EXIT
    
    EXIT:
        li $v0, 10
        syscall 
