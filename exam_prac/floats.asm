.data 

# Float
F1: .space 4  
F2: .space 4 

# Double
D1: .space 8
D2: .space 8 

.text 
main:
    li $v0, 6
    syscall 

    mov.s $f1, $f0 

    li $v0, 6
    syscall 

    mov.s $f2, $f0 

    mul.s $f12, $f1, $f2 

    li $v0, 2
    syscall 

    li $v0, 10
    syscall 
