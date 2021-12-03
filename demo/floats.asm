.data 
floatVector: .space 20 
min: .asciiz "Min: "
max: .asciiz "\nMax: "

.text 
main:
    li $t0, 1
    la $a0, floatVector

    INPUT:
        li $v0, 6
        syscall 

        s.s $f0, ($a0)
        addi $a0, $a0, 4
        addi $t0, $t0, 1

        ble $t0, 5, INPUT 
    
    l.s $f1, floatVector
    l.s $f2, floatVector 

    la $s0, floatVector 
    addi $s0, $s0, 4
    li $t0, 2

    STATS:
        l.s $f3, ($s0)
        c.lt.s $f3, $f1 
        bc1t MIN

        A:
            c.lt.s $f2, $f3 
            bc1t MAX 
        B:
            addi $t0, $t0, 1
            addi $s0, $s0, 4
            ble $t0, 5, STATS 
    
    mov.s $f12, $f1
    la $a0, min 
    li $v0, 4
    syscall 

    li $v0, 2
    syscall 

    mov.s $f12, $f2 

    la $a0, max 
    li $v0, 4
    syscall 

    li $v0, 2
    syscall 

    li $v0, 10
    syscall 


    MIN:
        mov.s $f1, $f3 
        j A 

    
    MAX:
        mov.s $f2, $f3 
        j B 

