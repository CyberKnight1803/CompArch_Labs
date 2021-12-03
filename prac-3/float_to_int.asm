.data 
    n: .word 20 
    newLine: .asciiz "\n"

.text 
main:
    la $a0, n 
    lw $t0, ($a0)

    mtc1 $t0, $f12 
    cvt.s.w $f12, $f12 

    li $v0, 2 
    syscall 

    jal NEWLINE 

    cvt.w.s $f12, $f12 
    mfc1 $t1, $f12 

    move $a0, $t1
    li $v0, 1
    syscall 
    
    li $v0, 10
    syscall 

NEWLINE:
    la $a0, newLine
    li $v0, 4
    syscall 
    jr $ra 

