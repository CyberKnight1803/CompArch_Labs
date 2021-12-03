.data 
S: .space 20 

.text 
main:
    la $a0, S 
    li $a1, 20 
    
    li $v0, 8
    syscall 
    
    li $v0, 4 
    syscall 

    li $v0, 10 
    syscall 