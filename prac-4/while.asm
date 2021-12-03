.data 
newLine: .asciiz "\n"

.text 
main:

    li $t1, 10
    li $t0, 1

    WHILE:
        move $a0, $t0 
        li $v0, 1
        syscall 

        la $a0, newLine 
        li $v0, 4
        syscall 
        addi $t0, $t0, 1
        ble $t0, $t1, WHILE 
    
    li $v0, 10
    syscall 
    
