.data 
sum: .asciiz "Sum : "

.text 
main:
    li $v0, 5 
    syscall 

    move $t0, $v0 

    li $t1, 1 
    li $s0, 0

    SUM:
        add $s0, $s0, $t1 
        addi $t1, $t1, 1 
        ble $t1, $t0, SUM 

    move $a0, $s0
    li $v0, 1
    syscall 

    li $v0, 10
    syscall 
        