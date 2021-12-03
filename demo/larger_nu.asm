.data 
num: .word 2147483647
num1: .word 2147483648

n1: .word 100000
n2: .word 100000

.text 
main:
    lw $t0, n1 
    lw $t1, n2 

    mult $t0, $t1 

    mflo $t3 
    move $a0, $t3 

    li $v0, 1
    syscall 
    
    li $v0, 10
    syscall 
