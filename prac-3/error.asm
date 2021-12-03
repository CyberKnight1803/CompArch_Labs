.data 
newLine: .asciiz "\n" 
n1: .word 230412
n2: .word 12


.text 
main:
    la $a0, n1 
    lw $t0, ($a0)

    la $a0, n2  
    lw $t1, ($a0)

    mult $t0, $t1
    mflo $t2 

    move $a0, $t2 
    li $v0, 1 
    syscall 

    mtc1 $t0, $f0 
    mtc1 $t1, $f1 

    cvt.s.w $f0, $f0 
    cvt.s.w $f1, $f1 

    jal NEWLINE 
    mul.s $f12, $f0, $f1 
    li $v0, 2
    syscall 

    cvt.w.s $f12 $f12 
    mfc1 $t3, $f12 

    jal NEWLINE

    sub $t4, $t3, $t2 
    move $a0, $t4 

    li $v0, 1
    syscall

    li $v0, 10
    syscall 


NEWLINE:
    la $a0, newLine
    li $v0, 4
    syscall 
    jr $ra