.data 
N: .space 4 
A: .space 4

.text 
main:
    li $v0, 5
    syscall 

    sw $v0, N 

    li $t0, 4
    mult $v0, $t0 
    mflo $a0 

    li $v0, 9
    syscall 

    sw $v0, A 
    lw $a0, A 

    li $t0, 1
    lw $t1, N 
    INPUT:
        li $v0, 5
        syscall 

        sw $v0, ($a0) 
        addi $a0, $a0, 4 
        addi $t0, $t0, 1

        ble $t0, $t1, INPUT 
    
    li $t0, 1
    li $t2, 0
    lw $a0, A 
    SUM:
        lw $t3, ($a0)
        add $t2, $t2, $t3
        addi $a0, $a0, 4
        addi $t0, $t0, 1

        ble $t0, $t1, SUM 
    
    move $a0, $t2 
    li $v0, 1
    syscall 
        
    li $v0, 10
    syscall 



    