.data 
vector: .space 8 

.text 
main:
    la $a0, vector
    
    li $v0, 6
    syscall 

    s.s $f0, ($a0) 

    la $a0, vector 
    l.s $f12, ($a0)

    li $v0, 2
    syscall 

    li $v0, 10
    syscall 