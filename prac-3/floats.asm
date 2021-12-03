.data 
fnum: .float 3.14 

.text 
main:
    l.s $f12 fnum 

    li $v0, 2
    syscall 

    li $v0, 6 
    syscall 

    mov.s $f12, $f0 
    li $v0, 2
    syscall 

    li $v0, 10 
    syscall 