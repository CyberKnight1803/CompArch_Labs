.data 
newLine: .asciiz "\n"

.text
main:

    li $v0, 7
    syscall 

    mov.d $f12, $f0 

    li $v0, 3
    syscall 

    cvt.s.d $f12, $f12 

    jal NEWLINE
    li $v0, 2
    syscall 

    cvt.d.s $f12, $f12 

    jal NEWLINE
    li $v0, 3
    syscall 

    li $v0, 10 
    syscall 

    NEWLINE:
        la $a0, newLine
        li $v0, 4 
        syscall 
        jr $ra 

